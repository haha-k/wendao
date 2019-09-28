from django.shortcuts import render
from rest_framework.views import APIView,Response
from rest_framework.generics import CreateAPIView
from account.models import Account
from rest_framework import serializers
from rest_framework.decorators import api_view

# Create your views here.
from account.serializers import RegisterUserSerializer

class AccountSerializer(serializers.ModelSerializer):
    class Meta:
        model = Account
        fields = '__all__'

class AcSerializer(serializers.ModelSerializer):
    class Meta:
        model = Account
        fields = ('id','username','nickname','email','telephone')

@api_view(['GET'])
def accounts(request):
    '''
    获取所有账户
    '''
    account_list = Account.objects.all()
    serializers = AccountSerializer(account_list,many=True)
    return Response(serializers.data)

@api_view(['GET'])
def account(request,uid):
    '''
    获取指定账户
    '''
    account_list = Account.objects.filter(id=uid)
    serializers = AcSerializer(account_list,many=True)
    return Response(serializers.data[0])

class UsernameCountView(APIView):
    '''
    判断用户名是否存在
    '''
    def get(self,request,username):
        count = Account.objects.filter(username = username).count()
        print(count)
        data = {
           'username': username,
            "count": count
        }

        return Response(data = data)

# class CommentSerializer(serializers.ModelSerializer):
#     class Meta:
#         model =
#         fields = '__all__'

# @api_view(['GET'])
# def UsernameCount(request):
#     book_list = Book.objects.all()
#     data = {
#         'username': username,
#         "count": count
#         }
#     serializers = BookSerializer(book_list,many=True)
#     return Response(serializers.data)

class RegisterUserView(CreateAPIView):
    '''
    注册接口
    '''
    serializer_class = RegisterUserSerializer