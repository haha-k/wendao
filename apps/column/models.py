from django.db import models
from account.models import Account

# Create your models here.

class Column(models.Model):
    column_id = models.AutoField(verbose_name='专栏id',primary_key=True)
    title = models.CharField(max_length = 40,verbose_name='专栏标题')
    desc = models.CharField(max_length = 1024,verbose_name='- 专栏简介')
    crt_time = models.DateTimeField(auto_now_add = True,verbose_name='创建时间')
    upd_time = models.DateTimeField(auto_now = True,verbose_name='更新时间')
    creator = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True,verbose_name='创建者')
    topics = models.CharField(max_length = 1024,verbose_name='专栏相关话题')
    cover = models.CharField(max_length = 1024,verbose_name='专栏封面')