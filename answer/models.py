from django.db import models

# Create your models here.
from backend.choice import like_choice

class Answer(models.Model):
    aid = models.CharField(max_length = 10,unique=True)
    qid = models.CharField(max_length = 10)
    answer_content = models.CharField(max_length = 10000)
    add_time = models.DateTimeField(auto_now_add = True)
    uid = models.CharField(max_length = 10)
    browse_count = models.IntegerField(blank=True,default=0)
    like_count = models.IntegerField(default = 0)
    collect_count = models.IntegerField(default = 0)
    comment_count = models.IntegerField(default = 0)

class Comment(models.Model):
    aid = models.CharField(max_length = 10,unique=True)
    add_time = models.DateTimeField(auto_now_add = True)
    content = models.CharField(max_length = 40)
    like_count = models.IntegerField(default = 0)
    unlike_count = models.IntegerField(default = 0)
    from_uid = models.CharField(max_length = 10)
    to_uid = models.CharField(max_length = 10)

# class parent_child(models.Model):
#     parent_id = models.CharField(max_length = 10);
#     child_id = models.CharField(max_length = 10);

class like(models.Model):
    aid = models.CharField(max_length = 10,unique=True)
    uid = models.CharField(max_length = 10,unique=True)
    # FOLLOW_CHOICES = [()]
    status = models.IntegerField(choices = like_choice)
    create_at = models.DateTimeField(auto_now_add = True)
    update_at = models.DateTimeField(auto_now_add = True)