from django.contrib import admin

# Register your models here.

from index.models import Book

admin.site.register(Book)