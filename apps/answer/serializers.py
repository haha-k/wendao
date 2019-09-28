from rest_framework import serializers
from answer.models import Answer

class AddAnswerSerializer(serializers.ModelSerializer):
    class Meta:
        model = Answer
        fields = '__all__'
    # pass
    def create(self,validated_data):
        print(validated_data)
        answer = Answer.objects.create(**validated_data)
        return answer
        # question = Question.objects.create(
        #     validated_data['qid'],
        #     validated_data['question_content'],
        #     validated_data['question_describe'],
        #     validated_data['cid'],
        #     validated_data['uid'],
        # )

    # def update(self,instance,validated_data):
