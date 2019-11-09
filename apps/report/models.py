from django.db import models
from account.models import Account

class Report(models.Model):
    report_id = models.AutoField(verbose_name='举报id',primary_key=True)
    creator = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True,verbose_name='创建者')
    desc = models.CharField(max_length = 1024,verbose_name='举报详情描述')
    report_type = models.CharField(max_length = 2,verbose_name='举报类型')
    resource_id = models.IntegerField(unique=True,verbose_name='举报资源id')
    resource_type = models.CharField(max_length = 2,verbose_name='举报资源类型')
    crt_time = models.DateTimeField(auto_now_add = True,verbose_name='创建时间')
    upd_time = models.DateTimeField(auto_now = True,verbose_name='更新时间')

    class Meta:
        db_table = "report"