from django.db import models
from backend.choice import follow_choice
from account.models import Account

class Question(models.Model):
    qid = models.AutoField(primary_key=True,verbose_name='问题id')
    title = models.CharField(max_length = 40,verbose_name='问题标题')
    desc = models.TextField(max_length = 4000,verbose_name='问题详情描述')
    photos = models.CharField(max_length = 1024,verbose_name='问题图片')
    topics = models.CharField(max_length = 1024,verbose_name='问题相关话题')
    pageviews = models.IntegerField(verbose_name='浏览量')
    crt_time = models.DateTimeField(verbose_name='创建日期', auto_now_add=True)
    upd_time = models.DateTimeField(verbose_name='更新日期', auto_now=True)
    avatar = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True,verbose_name='发布者')

    class Meta:
        db_table = "question"

class follow(models.Model):
    follow_id = models.AutoField(primary_key=True,verbose_name='关注id')
    people = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True,verbose_name='关注者')
    resource_id = models.IntegerField(unique=True,verbose_name='关注的资源id')
    resource_type = models.CharField(max_length = 2,verbose_name='关注资源类型')
    crt_time = models.DateTimeField(auto_now_add = True,verbose_name='创建日期')
    upd_time = models.DateTimeField(auto_now = True,verbose_name='更新日期')

    class Meta:
        db_table = "follow"

class Topic(models.Model):
    topic_id = models.AutoField(primary_key=True,verbose_name='话题id')
    title = models.CharField(max_length = 40,verbose_name='话题标题')
    desc = models.TextField(max_length = 1024,verbose_name='话题描述')
    crt_time = models.DateTimeField(auto_now_add = True,verbose_name='创建日期')
    upd_time = models.DateTimeField(auto_now = True,verbose_name='更新日期')
    creator = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True,verbose_name='创建者')

    class Meta:
        db_table = "topic"