from answer.views import answer
from django.urls import path,re_path
from answer.views import AddAnswerView,answers,userAnswer,answer,qAnswer,qaAnswer,AidExistenceView
from rest_framework_jwt.views import obtain_jwt_token
app_name='answer'
urlpatterns =[
    path(r'all/',answers),
    # re_path(r'^username/(?P<username>\w{2,20})/count/$',UsernameCountView.as_view()),
    # path(r'users/',RegisterUserView.as_view()),
    # re_path(r'^authorizations/$',obtain_jwt_token),
    path(r'a/',AddAnswerView.as_view()),
    re_path(r'^aid/(?P<aid>\d{0,10})/$',answer),
    re_path(r'^uid/(?P<uid>\d{0,10})/$',userAnswer),
    re_path(r'^qid/(?P<qid>\d{0,10})/$',qAnswer),
    re_path(r'^qid/(?P<qid>\d{0,10})/aid/(?P<aid>\d{0,10})$',qaAnswer),
    re_path(r'^aid/(?P<aid>\d{0,10})/count/$',AidExistenceView.as_view()),
]