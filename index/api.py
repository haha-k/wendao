from index.models import Book

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