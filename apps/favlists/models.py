from django.db import models
from account.models import Account


# Create your models here.

class Favorites(models.Model):
    favorites_id = models.AutoField(verbose_name='收藏夹id',primary_key=True)
    title = models.CharField(max_length = 40,verbose_name='收藏夹名称')
    desc = models.CharField(max_length = 1024,verbose_name='收藏夹描述')
    crt_time = models.DateTimeField(auto_now_add = True,verbose_name='创建时间')
    upd_time = models.DateTimeField(auto_now = True,verbose_name='更新时间')
    creator = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True,verbose_name='创建者')

    class Meta:
        db_table = "favorites"

class Collection(models.Model):
    # collection_id = models.UUIDField(primary_key=True,verbose_name='收藏id', default=uuid.uuid1, editable=False)
    collection_id = models.AutoField(primary_key=True,verbose_name='收藏id')
    resource_id = models.IntegerField(unique=True,verbose_name='收藏资源id')
    resource_type = models.CharField(max_length = 2,verbose_name='收藏资源类型')
    crt_time = models.DateTimeField(auto_now_add = True,verbose_name='创建时间')
    upd_time = models.DateTimeField(auto_now = True,verbose_name='更新时间')
    creator = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True,verbose_name='创建者')
    favlists = models.ForeignKey(Favorites, on_delete=models.SET_NULL, null=True,verbose_name='收藏夹')

    class Meta:
        db_table = "collection"