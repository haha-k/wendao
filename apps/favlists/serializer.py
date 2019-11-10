from rest_framework import serializers
from .models import *

class FavlistsSerializer(serializers.ModelSerializer):
    create_date = serializers.DateTimeField(format='%Y-%m-%d %H:%M:%S',read_only=True)
    update_date = serializers.DateTimeField(format='%Y-%m-%d %H:%M:%S',read_only=True)

    class Meta:
        model = Favorites
        fields = '__all__'