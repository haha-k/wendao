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
class ColumnViewSet(viewsets.ModelViewSet):
    queryset = Column.objects.all()
    serializer_class = ColumnSerializer
    authentication_classes = (JSONWebTokenAuthentication,)

def get_permissions(self):
    permission_classes = [IsAuthenticated,]
    return [permission() for permission in permission_classes]

def get_serializer_class(self):
    if self.action == "create":
        return ColumnSerializer
    elif self.action == "update":
        return ColumnSerializer
    return ColumnSerializer
