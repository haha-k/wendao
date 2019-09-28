from django.urls import path,re_path
from question.views import questions,question,QidExistenceView,QuestionExistenceView,AddQuestionView,userQuestions
from rest_framework_jwt.views import obtain_jwt_token

app_name='question'
urlpatterns =[
    path(r'all/',questions),
    re_path(r'^title/(?P<question_content>[\s\S]{0,40})/count/$',QuestionExistenceView.as_view()),
    re_path(r'^qid/(?P<qid>\d{0,10})/count/$',QidExistenceView.as_view()),
    path(r'q/',AddQuestionView.as_view()),
    re_path(r'^uid/(?P<uid>\d{0,10})/$',userQuestions),
    re_path(r'^qid/(?P<qid>\d{6,10})/$',question),


]