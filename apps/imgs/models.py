from django.db import models

class Picture(models.Model):
    pic_id = models.AutoField(verbose_name='图片id',primary_key=True)
    crt_time = models.DateTimeField(auto_now_add = True)
    upd_time = models.DateTimeField(auto_now = True)
    creator = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True,verbose_name='创建者')
    url = models.CharField(max_length = 256)
