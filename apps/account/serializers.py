from rest_framework import serializers
from rest_framework_jwt.settings import api_settings
from account.models import Account

class RegisterUserSerializer(serializers.ModelSerializer):
    token = serializers.CharField(read_only=True)
    class Meta:
        model = Account
        fields = '__all__'
        extra_kwargs={
            'username': {
                'min_length': 2,
                'max_length': 20,
                'error_messages': {
                    'min_length': '仅允许2-20个字符的用户名',
                    'max_length': '仅允许2-20个字符的用户名',
                }
            },
            'password': {
                'write_only': True,
                'min_length': 6,
                'max_length': 20,
                'error_messages': {
                    'min_length': '仅允许6-20个字符的密码',
                    'max_length': '仅允许6-20个字符的密码',
                }
            }
        }


    def create(self,validated_data):
        user = Account.object.create_user(
            validated_data['username'],
            validated_data['email'],
            validated_data['telephone'],
            validated_data['password'],
        )

        jwt_payload_handler = api_settings.JWT_PAYLOAD_HANDLER
        jwt_encode_handler = api_settings.JWT_ENCODE_HANDLER
        payload = jwt_payload_handler(user)
        token = jwt_encode_handler(payload)

        user.token = token

        return user



