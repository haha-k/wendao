from django.db import models
from account.models import Account

# Create your models here.

class Comment(models.Model):
    comment_id = models.AutoField(verbose_name='评论id',primary_key=True)
    content = models.TextField(max_length = 1024)
    resource_id = models.IntegerField(max_length = 11)
    resource_type = models.CharField(max_length = 2)
    avatar = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True,verbose_name='发布者')
    cre_time = models.DateTimeField(verbose_name='创建日期', auto_now_add=True)
    upd_time = models.DateTimeField(verbose_name='更新日期', auto_now=True)


class Reply(models.Model):
    reply_id = models.IntegerField(max_length = 8,unique=True)
    content = models.TextField(max_length = 1024)
    reply_type = models.CharField(max_length = 2)
    from_user_id = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True,verbose_name='回复用户id')
    to_user_id = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True,verbose_name='目标用户id')
    comment_id = models.ForeignKey(Comment, on_delete=models.SET_NULL, null=True,verbose_name='评论id')
    cre_time = models.DateTimeField(verbose_name='创建日期', auto_now_add=True)
    upd_time = models.DateTimeField(verbose_name='更新日期', auto_now=True)