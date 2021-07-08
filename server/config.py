import datetime
import os

from apispec import APISpec
from apispec.ext.marshmallow import MarshmallowPlugin
from flask_apispec.extension import FlaskApiSpec


class Config:
    APISPEC_SPEC = APISpec(
        title='Solomon',
        version='v0.0',
        plugins=[MarshmallowPlugin()],
        openapi_version='2.0.0'
    )
    APISPEC_SWAGGER_URL = '/swagger/'
    APISPEC_SWAGGER_UI_URL = '/swagger-ui/'
    SECRET_KEY = os.environ.get('FLASK_SECRET_KEY') or 'PLZCHNGME!!!'
    JWT_SECRET_KEY = os.environ.get('SECRET') or 'PLZCHANGEME2!!!'
    JWT_ACCESS_TOKEN_EXPIRES = datetime.timedelta(days=10)
    SQLALCHEMY_DATABASE_URI = os.environ.get(
        'DATABASE_URL', 'sqlite:///app.sqlite3')
    SQLALCHEMY_TRACK_MODIFICATIONS = False

    TWILIO_ACCOUNT_SID = os.environ.get('TWILIO_ACCOUNT_SID')
    TWILIO_AUTH_TOKEN = os.environ.get('TWILIO_AUTH_TOKEN')

    JWT_BLACKLIST_ENABLED = True
    JWT_BLACKLIST_TOKEN_CHECKS = ['access', 'refresh']
