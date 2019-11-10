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
class FavlistsViewSet(viewsets.ModelViewSet):
    queryset = Favorites.objects.all()
    serializer_class = FavlistsSerializer
    authentication_classes = (JSONWebTokenAuthentication,)

def get_permissions(self):
    permission_classes = [IsAuthenticated,]
    return [permission() for permission in permission_classes]

def get_serializer_class(self):
    if self.action == "create":
        return FavlistsSerializer
    elif self.action == "update":
        return FavlistsSerializer
    return FavlistsSerializer
