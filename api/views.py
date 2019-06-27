from django.shortcuts import render

# Create your views here.
from index.models import Book
from question.models import Question
from answer.models import Answer,Comment
from rest_framework import serializers
from rest_framework.response import Response
from rest_framework.decorators import api_view

class BookSerializer(serializers.ModelSerializer):
    class Meta:
        model = Book
        fields = '__all__'

@api_view(['GET'])
def book(request):
    book_list = Book.objects.all()
    serializers = BookSerializer(book_list,many=True)
    return Response(serializers.data)

