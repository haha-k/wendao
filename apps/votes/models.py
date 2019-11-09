from django.db import models

class votes(models.Model):
    vote_id = models.AutoField(verbose_name='投票id',primary_key=True)
    resource_id = models.IntegerField(max_length = 11,unique=True)
    resource_type = models.CharField(max_length = 2)
    creator = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True,verbose_name='发布者')
    status = models.IntegerField(choices = like_choice)
    cre_time = models.DateTimeField(verbose_name='创建日期', auto_now_add=True)
    upd_time = models.DateTimeField(verbose_name='更新日期', auto_now=True)

    class Meta:
        db_table = "votes"


# class Message(models.Model):
#     msg_id = models.IntegerField(max_length = 11,unique=True)
#     user_id = models.IntegerField(max_length = 11,unique=True)
#     friend_id = models.IntegerField(max_length = 11,unique=True)
#     sender_id = models.IntegerField(max_length = 11,unique=True)
#     receiver_id = models.IntegerField(max_length = 11,unique=True)
#     msg_type = models.CharField(max_length = 2)
#     msg_content = models.CharField(max_length = 65536)
#     send_time = models.DateTimeField(auto_now_add = True)
#     status = models.CharField(max_length = 2,choices = follow_choice)

