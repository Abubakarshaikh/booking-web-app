import random
import copy
import json
import operator
from unittest.mock import patch

from flask_jwt_extended import create_access_token
import pytest

from server.services import user_service


@pytest.fixture(scope='session')
def flask_app():
    from flask import request
    from main import app

    @app.before_request
    def print_request():
        print('----------- REQUEST -----------')
        j = request.get_json(silent=True)
        print('{} {}\n{}'.format(request.method,
                                 request.url,
                                 json.dumps(j, indent=2, sort_keys=True) if j is not None else 'None'))

    @app.after_request
    def print_response(response):
        if response.content_type == 'application/json':
            print('----------- RESPONSE -----------')
            print(json.dumps(json.loads(str(response.data, encoding='utf8')), indent=2, sort_keys=True))
        else:
            print('Response was not application/json')
        return response

    return app


@pytest.fixture(scope='function')
def test_client(flask_app):
    return flask_app.test_client()


@pytest.fixture(scope='function', autouse=True)
def app_context(flask_app, request):
    app_context = flask_app.app_context()
    app_context.push()
    request.addfinalizer(app_context.pop)


@pytest.fixture(scope='function')
def random_user(test_client):
    random_user = random.choice(user_service.all())
    assert random_user is not None, 'No users found'
    return random_user


@pytest.fixture(scope='function')
def access_token(test_client):
    random_employee = random.choice(user_service.all())
    access_token = create_access_token(identity=random_employee.email)
    return access_token
