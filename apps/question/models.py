from django.db import models
from backend.choice import follow_choice
from account.models import Account

class Question(models.Model):
    qid = models.AutoField(primary_key=True)
    title = models.CharField(max_length = 40)
    desc = models.TextField(max_length = 4000)
    photos = models.CharField(max_length = 1024)
    topics = models.CharField(max_length = 1024)
    pageviews = models.IntegerField(max_length = 20)
    crt_time = models.DateTimeField(verbose_name='创建日期', auto_now_add=True)
    upd_time = models.DateTimeField(verbose_name='更新日期', auto_now=True)
    avatar = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True,verbose_name='发布者')

    class Meta:
        db_table = "question"

class follow(models.Model):
    follow_id = models.AutoField(primary_key=True)
    people = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True,verbose_name='关注者')
    resource_id = models.IntegerField(max_length = 11,unique=True)
    resource_type = models.CharField(max_length = 2)
    crt_time = models.DateTimeField(auto_now_add = True)
    upd_time = models.DateTimeField(auto_now_add = True)

    class Meta:
        db_table = "follow"

class Topic(models.Model):
    topic_id = models.AutoField(primary_key=True)
    title = models.CharField(max_length = 40)
    desc = models.TextField(max_length = 1024)
    crt_time = models.DateTimeField(auto_now_add = True)
    upd_time = models.DateTimeField(auto_now_add = True)
    creator = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True,verbose_name='创建者')

    class Meta:
        db_table = "topic"