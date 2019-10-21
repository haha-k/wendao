from django.db import models

# Create your models here.
class Collection(models.Model):
    collection_id = models.UUIDField(primary_key=True,verbose_name='收藏id', default=uuid.uuid1, editable=False)
    resource_id = models.IntegerField(max_length = 8,unique=True)
    resource_type = models.CharField(max_length = 2)
    crt_time = models.DateTimeField(auto_now_add = True)
    upd_time = models.DateTimeField(auto_now_add = True)
    creator = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True,verbose_name='创建者')
    favlists = models.ForeignKey(Favorites, on_delete=models.SET_NULL, null=True,verbose_name='收藏夹')

class Favorites(models.Model):
    favorites_id = models.AutoField(verbose_name='收藏夹id',primary_key=True)
    title = models.CharField(max_length = 40)
    desc = models.CharField(max_length = 1024)
    crt_time = models.DateTimeField(auto_now_add = True)
    upd_time = models.DateTimeField(auto_now = True)
    creator = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True,verbose_name='创建者')