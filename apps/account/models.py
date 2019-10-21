from django.db import models

# Create your models here.
from django.contrib.auth.models import BaseUserManager,AbstractUser,AbstractUser
from backend.choice import gender_choice
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

    def create_superuser(self,username,password,**extra_fields):
        extra_fields.setdefault('is_staff',True)
        extra_fields.setdefault('is_superuser',True)

        if extra_fields.get('is_staff') is not True:
            raise ValueError('Superuser must have is_staff=True.')
        if extra_fields.get('is_superuser') is not True:
            raise ValueError('Superuser must have is_admin=True.')

        return self._create_user(username,password,**extra_fields)

class Account(AbstractBaseUser):


class Account(AbstractUser):
    username = models.CharField(
        max_length=40,
        unique=True,
        help_text='',
        error_messages={
            'unique':'已经有人抢先了哦'
        },
        )
    telephone = models.CharField(max_length=20,blank=True,null=True)
    register_time = models.DateTimeField(auto_now_add=True,verbose_name="注册时间")
    nickname=models.CharField(max_length=20,blank=True,null=True)
    gender=models.IntegerField(blank=True,null=True,choices=gender_choice)
    birthdate=models.DateField(blank=True,null=True);
    avator_url=models.CharField(max_length=255,blank=True,null=True)

    object = AccountManager()

    REQUIRED_FIELDS = ['telephone','email']
    USERNAME_FIELD = 'username'

    def __str__(self):
        return '<User%d,%s>'%(self.id,self.username)

