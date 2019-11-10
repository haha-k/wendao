from django.shortcuts import render
from rest_framework import viewsets
from .models import *
from .serializer import *
from rest_framework.mixins import *
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework.viewsets import GenericViewSet
from rest_framework.permissions import *
# from .permissions import *


# Create your views here.
class ImgsViewSet(viewsets.ModelViewSet):
    queryset = Picture.objects.all()
    serializer_class = ImgsSerializer
    authentication_classes = (JSONWebTokenAuthentication,)

def get_permissions(self):
    permission_classes = [IsAuthenticated,]
    return [permission() for permission in permission_classes]

def get_serializer_class(self):
    if self.action == "create":
        return ImgsSerializer
    elif self.action == "update":
        return ImgsSerializer
    return ImgsSerializer
