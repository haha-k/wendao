from django.shortcuts import render

# Create your views here.
from answer.models import Answer
from rest_framework import serializers
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework.generics import CreateAPIView
from answer.serializers import AddAnswerSerializer
from rest_framework.views import APIView,Response
from rest_framework import viewsets
from .models import *
from .serializers import *
from rest_framework.mixins import *
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework.viewsets import GenericViewSet
from rest_framework.permissions import *

class AnswerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Answer
        fields = '__all__'

# class CommentSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Comment
#         fields = '__all__'


@api_view(['GET'])
def answers(request):
    answer_list = Answer.objects.all()
    serializers = AnswerSerializer(answer_list,many=True)
    return Response(serializers.data)

@api_view(['GET'])
def comment(request):
    Comment_list = Comment.objects.all()
    serializers = CommentSerializer(Comment_list,many=True)
    return Response(serializers.data)

@api_view(['GET'])
def userAnswer(request,uid):
    '''
    获取用户的所有回答
    '''
    userAnswers = Answer.objects.filter(uid = uid)
    # print(userQuestions)
    serializers = AnswerSerializer(userAnswers,many=True)
    return Response(serializers.data)

@api_view(['GET'])
def answer(request,aid):
    '''
    获取指定的回答
    '''
    theAnswer = Answer.objects.filter(aid = aid)
    # print(userQuestions)
    serializers = AnswerSerializer(theAnswer,many=True)
    return Response(serializers.data)

@api_view(['GET'])
def qAnswer(request,qid):
    '''
    根据问题获取所有的回答
    '''
    theAnswer = Answer.objects.filter(qid = qid)
    # print(userQuestions)
    serializers = AnswerSerializer(theAnswer,many=True)
    return Response(serializers.data)

@api_view(['GET'])
def qaAnswer(request,qid,aid):
    '''
    根据问题和指定aid确认的回答
    '''
    theAnswer = Answer.objects.filter(aid = aid,qid = qid)
    # print(userQuestions)
    serializers = AnswerSerializer(theAnswer,many=True)
    return Response(serializers.data[0])

class AddAnswerView(CreateAPIView):
    '''
    加入回答接口
    '''
    print("---------------------")
    serializer_class = AddAnswerSerializer

class AidExistenceView(APIView):
    '''
    判断aid是否重复
    '''
    def get(self,request,aid):
        count = Answer.objects.filter(aid = aid).count()
        # qid = Question.objects.filter(question_content = question_content)
        # print(qid)
        data = {
            'aid':aid,
            'count':count
        }
        return Response(data = data)


class AnswerViewSet(viewsets.ModelViewSet):
    queryset = Answer.objects.all()
    serializer_class = AnswerSerializer
    authentication_classes = (JSONWebTokenAuthentication,)

def get_permissions(self):
    permission_classes = [IsAuthenticated,]
    return [permission() for permission in permission_classes]

def get_serializer_class(self):
    if self.action == "create":
        return AnswerSerializer
    elif self.action == "update":
        return AnswerSerializer
    return AnswerSerializer

