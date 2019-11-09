from django.db import models
from account.models import Account
from column.models import Column

# Create your models here.
class Article(models.Model):
    article_id = models.AutoField(verbose_name='文章id',primary_key=True)
    creator = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True,verbose_name='创建者')
    title = models.CharField(max_length = 40)
    photos = models.CharField(max_length = 1024)
    cover = models.CharField(max_length = 1024)
    content = models.CharField(max_length = 65536)
    crt_time = models.DateTimeField(auto_now_add = True)
    upd_time = models.DateTimeField(auto_now = True)
    column_id = models.ForeignKey(Column, on_delete=models.SET_NULL, null=True,verbose_name='专栏id')