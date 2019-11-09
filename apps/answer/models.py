from django.db import models
from backend.choice import like_choice
from account.models import Account
from question.models import Question

class Answer(models.Model):
    aid = models.AutoField(verbose_name='关注id',primary_key=True)
    content = models.TextField(max_length = 65536,verbose_name='回答内容')
    photos = models.CharField(max_length = 1024,verbose_name='回答图片')
    avatar = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True,verbose_name='发布者')
    qid = models.ForeignKey(Question, on_delete=models.SET_NULL, null=True,verbose_name='问题id')
    cre_time = models.DateTimeField(verbose_name='创建日期', auto_now_add=True)
    upd_time = models.DateTimeField(verbose_name='更新日期', auto_now=True)

    class Meta:
        db_table = "answer"
