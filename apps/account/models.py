from django.db import models
from django.contrib.auth.models import BaseUserManager,AbstractUser,AbstractUser
from backend.choice import *

class AccountManager(BaseUserManager):
    def _create_user(self,username,password,email,phone,**extra_fields):
        if not username:
            raise ValueError('****The given username must be set****')
        username = self.model.normalize_username(username)
        user = self.model(username=username,email=email,telephone=phone,**extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_user(self,username,email,phone,password=None,**extra_fields):
        extra_fields.setdefault('is_staff',False)
        extra_fields.setdefault('is_superuser',False)
        return self._create_user(username,password,email,phone,**extra_fields)

    def create_superuser(self,username,email,telephone,password=None,**extra_fields):
        extra_fields.setdefault('is_staff',True)
        extra_fields.setdefault('is_superuser',True)

        if extra_fields.get('is_staff') is not True:
            raise ValueError('****Superuser must have is_staff=True.****')
        if extra_fields.get('is_superuser') is not True:
            raise ValueError('****Superuser must have is_admin=True.****')

        return self._create_user(username,password,email,telephone,**extra_fields)

class Account(AbstractUser):
    username = models.CharField(
        max_length=40,
        unique=True,
        help_text='',
        error_messages={
            'unique':'已经有人抢先了哦'
        },
        verbose_name="用户名",
        )
    telephone = models.CharField(max_length=20,verbose_name="电话号码",blank=True,null=True)
    register_time = models.DateTimeField(auto_now_add=True,verbose_name="注册时间")
    nickname=models.CharField(max_length=20,blank=True,null=True,verbose_name="昵称")
    gender=models.IntegerField(blank=True,null=True,choices=gender_choice,verbose_name="性别")
    birthdate=models.DateField(blank=True,null=True,verbose_name="生日")
    avator_url=models.CharField(max_length=255,blank=True,null=True,verbose_name="头像")
    sub_desc=models.CharField(max_length=40,blank=True,null=True,verbose_name="一句话介绍")

    object = AccountManager()

    REQUIRED_FIELDS = ['telephone','email']
    USERNAME_FIELD = 'username'

    def __str__(self):
        return '<User%d,%s>'%(self.id,self.username)

    class Meta:
        db_table = "account"
        verbose_name = "用户"
        verbose_name_plural = "用户管理"


class Attention(models.Model):
    attention_id = models.AutoField(verbose_name='关注id',primary_key=True)
    user = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True,verbose_name='用户id', editable=False,db_column='user_id',related_name="user")
    followed_user = models.ForeignKey(Account, on_delete=models.SET_NULL, null=True,verbose_name='关注的人id', editable=False,db_column='followed_user_id',related_name="followed_user")
    crt_time = models.DateTimeField(verbose_name='创建日期', auto_now_add=True)
    upd_time = models.DateTimeField(verbose_name='更新日期', auto_now=True)
    status = models.CharField(max_length = 2,choices = follow_choice,verbose_name='点赞状态')

    class Meta:
        verbose_name = "关注"
        verbose_name_plural = "关注管理"
        db_table = "attention"