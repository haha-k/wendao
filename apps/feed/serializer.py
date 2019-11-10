from rest_framework import serializers
from .models import *

class FeedSerializer(serializers.ModelSerializer):
    create_date = serializers.DateTimeField(format='%Y-%m-%d %H:%M:%S',read_only=True)
    update_date = serializers.DateTimeField(format='%Y-%m-%d %H:%M:%S',read_only=True)

    class Meta:
        model = Feed
        fields = '__all__'