from django.db import models

# Create your models here.
from backend.choice import follow_choice

class Question(models.Model):
    qid = models.CharField(max_length = 10,unique=True)
    question_content = models.CharField(max_length = 40)
    add_time = models.DateTimeField(auto_now_add = True)
    question_describe = models.CharField(max_length = 200,blank=True,null=True)
    cid = models.CharField(max_length = 10)
    uid = models.CharField(max_length = 10)
    attend_count = models.IntegerField(blank=True,default=0)
    browse_count = models.IntegerField(blank=True,default=0)

class Follow(models.Model):
    qid = models.CharField(max_length = 10,unique=True)
    uid = models.CharField(max_length = 10,unique=True)
    # FOLLOW_CHOICES = [()]
    status = models.IntegerField(choices = follow_choice)
    create_at = models.DateTimeField(auto_now_add = True)
    update_at = models.DateTimeField(auto_now_add = True)


