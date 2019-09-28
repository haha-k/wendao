from .base import *

DEBUG = True
ALLOWED_HOSTS = []

JWT_AUTH ={
    'JWT_EXPIRATION_DELTA':datetime.timedelta(days=7),
    'JWT_RESPONSE_PAYLOAD_HANDLER':'account.utils.jwt_response_payload_handler'
}

DATABASES = {
    'default': {
        'ENGINE':'django.db.backends.mysql',#设置数据库为mysql
        'NAME':'wendao',#数据库名为wendao
        'USER':'root',#数据库用户名
        'PASSWORD':'123',#数据库用户密码
        'OPTIONS':{
            'autocommit':True,
             'init_command': "SET sql_mode='STRICT_TRANS_TABLES'",
        }
    }
}