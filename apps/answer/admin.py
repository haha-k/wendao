from django.contrib import admin

from answer.models import Answer,Comment,like
# Register your models here.
admin.site.register(Answer)
admin.site.register(Comment)
admin.site.register(like)