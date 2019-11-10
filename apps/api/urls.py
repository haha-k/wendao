from django.urls import path,include
from django.urls import re_path,include
from account.views import *
from answer.views import *
from article.views import *
from column.views import *
from favlists.views import *
from comment.views import *
from imgs.views import *
from report.views import *
from votes.views import *
from question.views import *
from rest_framework.routers import DefaultRouter
# from rest_framework_jwt.views import obtain_jwt_token, verify_jwt_token
from .views import obtain_jwt_token

# app_name='api'
router = DefaultRouter()

router.register(r'users',UserViewSet)
router.register(r'question',QuestionViewSet)
router.register(r'answer',AnswerViewSet)
router.register(r'article',ArticleViewSet)
router.register(r'column',ColumnViewSet)
router.register(r'comment',CommentViewSet)
router.register(r'favlists',FavlistsViewSet)
router.register(r'imgs',ImgsViewSet)
router.register(r'report',ReportViewSet)
router.register(r'votes',VotesViewSet)
# urlpatterns =[
#     path(r'question/',include('question.urls')),
#     path(r'answer/',include('answer.urls')),
#     path(r'article/',include('article.urls')),
#     path(r'column/',include('column.urls')),
#     path(r'comment/',include('comment.urls')),
#     path(r'favlists/',include('favlists.urls')),
#     path(r'imgs/',include('imgs.urls')),
#     path(r'report/',include('report.urls')),
#     path(r'votes/',include('votes.urls')),
# ]

all_api = [

    re_path(r'',include(router.urls)),
    # re_path(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework'))
    re_path(r'^login/', obtain_jwt_token),
    # re_path(r'^login/', LoginView.as_view()),
]

api_v1 = [re_path(r'',include(all_api))]

api_versions = [re_path(r'v1/',include(api_v1))]

urlpatterns = [re_path(r'api/',include(api_versions))]