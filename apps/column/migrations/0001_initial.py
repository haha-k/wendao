# Generated by Django 2.2 on 2019-11-09 14:24

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
            name='Column',
            fields=[
                ('column_id', models.AutoField(primary_key=True, serialize=False, verbose_name='专栏id')),
                ('title', models.CharField(max_length=40, verbose_name='专栏标题')),
                ('desc', models.CharField(max_length=1024, verbose_name='- 专栏简介')),
                ('crt_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('upd_time', models.DateTimeField(auto_now=True, verbose_name='更新时间')),
                ('topics', models.CharField(max_length=1024, verbose_name='专栏相关话题')),
                ('cover', models.CharField(max_length=1024, verbose_name='专栏封面')),
                ('creator', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL, verbose_name='创建者')),
            ],
            options={
                'db_table': 'column',
            },
        ),
    ]