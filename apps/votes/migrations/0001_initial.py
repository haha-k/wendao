# Generated by Django 2.2 on 2019-11-10 15:05

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Votes',
            fields=[
                ('vote_id', models.AutoField(primary_key=True, serialize=False, verbose_name='投票id')),
                ('resource_id', models.IntegerField(unique=True, verbose_name='投票资源id')),
                ('resource_type', models.CharField(max_length=2, verbose_name='投票资源类型')),
                ('status', models.IntegerField(choices=[('like', '1'), ('unlike', '0')], verbose_name='投票状态')),
                ('cre_time', models.DateTimeField(auto_now_add=True, verbose_name='创建日期')),
                ('upd_time', models.DateTimeField(auto_now=True, verbose_name='更新日期')),
                ('creator', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL, verbose_name='发布者')),
            ],
            options={
                'db_table': 'votes',
            },
        ),
    ]
