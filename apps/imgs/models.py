from django.db import models
from account.models import Account

class Picture(models.Model):
    pic_id = models.AutoField(verbose_name='图片id',primary_key=True)
    crt_time = models.DateTimeField(auto_now_add = True,verbose_name='创建时间')
    upd_time = models.DateTimeField(auto_now = True,verbose_name='更新时间')
    creator = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True,verbose_name='创建者')
    url = models.CharField(max_length = 256,verbose_name='图片地址')

    class Meta:
        db_table = "img"
