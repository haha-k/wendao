from django.shortcuts import render

# Create your views here.
from question.models import Question
from answer.models import Answer,Comment
from rest_framework import serializers
from rest_framework.response import Response
from rest_framework.decorators import api_view


