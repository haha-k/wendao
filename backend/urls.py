from django.contrib import admin
from django.urls import path
from django.urls import re_path,include
from django.views.static import serve
from .settings import base
import os

print(os.path.join(base.MEDIA_ROOT,'static\images'))

urlpatterns = [
    re_path(r'', include('api.urls')),
    re_path(r'', include('account.urls')),
    path(r'admin/', admin.site.urls),
    re_path('^media/(?P<path>.*)$', serve, {"document_root": base.MEDIA_ROOT})
]
