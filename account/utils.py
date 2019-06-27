
def jwt_response_payload_handler(token,user=None,request=None):
    '''
    自定义jwt认证成功返回数据
    '''
    return{
        'token':token,
        'user_id':user.id,
        'username':user.username,
    }

# def get_user_by_account(account):
#     '''
#     根据账号获取user对象
#     '''
#     try:
#         if re.match('^1[3-9]\d{9}$',account):
#             user = Account.object.get(telephone = account)
#         else:
#             user = Account.object.get(username = account)
#     except User.DoesNotExist:
#         return None
#     else:
#         return user