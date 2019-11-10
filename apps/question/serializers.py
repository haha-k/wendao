from rest_framework import serializers
from question.models import Question
# from django.views.decorators.csrf import csrf_exempt

class AddQuestionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Question
        fields = '__all__'

    # pass
    # @csrf_exempt
    def create(self,validated_data):
        print(validated_data)
        question = Question.objects.create(**validated_data)
        return question
        # question = Question.objects.create(
        #     validated_data['qid'],
        #     validated_data['question_content'],
        #     validated_data['question_describe'],
        #     validated_data['cid'],
        #     validated_data['uid'],
        # )

    # def update(self,instance,validated_data):

class QuestionSerializer(serializers.ModelSerializer):
    create_date = serializers.DateTimeField(format='%Y-%m-%d %H:%M:%S',read_only=True)
    update_date = serializers.DateTimeField(format='%Y-%m-%d %H:%M:%S',read_only=True)

    class Meta:
        model = Question
        fields = '__all__'