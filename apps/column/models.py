from django.db import models
from account.models import Account

# Create your models here.

class Column(models.Model):
    column_id = models.AutoField(verbose_name='专栏id',primary_key=True)
    title = models.CharField(max_length = 40)
    desc = models.CharField(max_length = 1024)
    crt_time = models.DateTimeField(auto_now_add = True)
    upd_time = models.DateTimeField(auto_now = True)
    creator = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True,verbose_name='创建者')
    topics = models.CharField(max_length = 1024)
    cover = models.CharField(max_length = 1024)