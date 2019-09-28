from .base import *

DEBUG = False
ALLOWED_HOSTS = ["*"]

JWT_AUTH ={
    'JWT_EXPIRATION_DELTA':datetime.timedelta(days=1),
    'JWT_RESPONSE_PAYLOAD_HANDLER':'account.utils.jwt_response_payload_handler'
}

DATABASES = {
    'default': {
        'ENGINE':'django.db.backends.mysql',#设置数据库为mysql
        'NAME':'alldb',#数据库名为alldb
        'USER':'root',#数据库用户名
        'PASSWORD':'123',#数据库用户密码
        'HOST':'39.96.221.167',
        'PORT':'3306',
        'OPTIONS':{
            'autocommit':True,
             'init_command': "SET sql_mode='STRICT_TRANS_TABLES'",
        }
    }
}

STATIC_ROOT = os.path.join(BASE_DIR,FRONTEND_ROOT+STATIC_URL)
STATICFILES_DIRS = (
    os.path.join(BASE_DIR,FRONTEND_ROOT+STATIC_URL),
)
STATICFILES_DIRS = (
    os.path.join(BASE_DIR,FRONTEND_ROOT+STATIC_URL),
)