from django.db import models
from account.models import Account

class Report(models.Model):
    report_id = models.AutoField(verbose_name='举报id',primary_key=True)
    creator = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True,verbose_name='创建者')
    desc = models.CharField(max_length = 1024)
    report_type = models.CharField(max_length = 2)
    resource_id = models.IntegerField(max_length = 11,unique=True)
    resource_type = models.CharField(max_length = 2)
    crt_time = models.DateTimeField(auto_now_add = True)
    upd_time = models.DateTimeField(auto_now = True)