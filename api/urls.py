from django.urls import path,include
from django.contrib.auth.views import logout_then_login

app_name='api'
urlpatterns =[
    path(r'question/',include('question.urls')),
    path(r'answer/',include('answer.urls')),
    # path(r'comment/',comment),
    path(r'account/',include('account.urls')),

]