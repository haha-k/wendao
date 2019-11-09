from django.urls import path,re_path
# from account.views import UsernameCountView,RegisterUserView,accounts,account
from rest_framework_jwt.views import obtain_jwt_token

app_name='account'
urlpatterns =[
    # path(r'all/',accounts),
    # re_path(r'^username/(?P<username>\w{2,20})/count/$',UsernameCountView.as_view()),
    # re_path(r'^uid/(?P<uid>\d{0,10})/$',account),
    # path(r'users/',RegisterUserView.as_view()),
    # re_path(r'^authorizations/$',obtain_jwt_token),

]