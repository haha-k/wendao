from django.shortcuts import render

# Create your views here.
# from django.views.decorators.csrf import csrf_exempt
from question.models import Question
from rest_framework import serializers
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework.views import APIView,Response
from rest_framework.generics import CreateAPIView
from question.serializers import AddQuestionSerializer

class QuestionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Question
        fields = '__all__'


@api_view(['GET'])
def questions(request):
    question_list = Question.objects.all()
    serializers = QuestionSerializer(question_list,many=True)
    return Response(serializers.data)

@api_view(['GET'])
def userQuestions(request,uid):
    '''
    获取用户提的问题
    '''
    userQuestions = Question.objects.filter(uid = uid)
    print(userQuestions)

    serializers = QuestionSerializer(userQuestions,many=True)
    return Response(serializers.data)

@api_view(['GET'])
def question(request,qid):
    '''
    获取指定的问题
    '''
    theQuestion = Question.objects.filter(qid = qid)
    print(userQuestions)
    serializers = QuestionSerializer(theQuestion,many=True)
    return Response(serializers.data)

class QuestionExistenceView(APIView):
    '''
    判断问题是否存在
    '''
    def get(self,request,question_content):
        count = Question.objects.filter(question_content = question_content).count()
        # qid = Question.objects.filter(question_content = question_content)
        # print(qid)
        data = {
            # 'qid':qid,
            'question_content':question_content,
            'count':count
        }
        return Response(data = data)

class QidExistenceView(APIView):
    '''
    判断qid是否重复
    '''
    def get(self,request,qid):
        count = Question.objects.filter(qid = qid).count()
        # qid = Question.objects.filter(question_content = question_content)
        # print(qid)
        data = {
            'qid':qid,
            'count':count
        }
        return Response(data = data)

# @csrf_exempt
class AddQuestionView(CreateAPIView):
    '''
    加入问题接口
    '''
    print("---------------------")
    serializer_class = AddQuestionSerializer

