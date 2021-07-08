from functools import wraps

from flask import json, Response

from server.db import db


def request_helper(f):
    @wraps(f)
    def wrapper(*args, **kwargs):
        rv = f(*args, **kwargs)
        db.session.rollback()
        # assert rv.content_type == 'application/json'
        # rv.json = json.loads(str(rv.data, encoding='utf8'))
        return rv
    return wrapper


@request_helper
def post_data(test_client, path, data, **kwargs):
    return test_client.post(path, data=data, **kwargs)


@request_helper
def post_json(test_client, path, data, **kwargs):
    return test_client.post(path, data=json.dumps(data), content_type='application/json', **kwargs)


@request_helper
def get_json(test_client, path, **kwargs):
    return test_client.get(path, content_type='application/json', **kwargs)


@request_helper
def put_json(test_client, path, data, **kwargs):
    return test_client.put(path, data=json.dumps(data), content_type='application/json', **kwargs)


@request_helper
def put_data(test_client, path, data, **kwargs):
    return test_client.put(path, data=data, **kwargs)


@request_helper
def delete(test_client, path, **kwargs):
    return test_client.delete(path, **kwargs)


def validate_response(rv, success_status=None, success_object=None, failure_status=None, failure_string=None):
    assert (success_status is None) ^ (failure_status is None)
    print(rv.data)
    if failure_status is not None:
        assert failure_status >= 400
    if success_status is not None:
        assert 200 <= success_status <= 399
    assert isinstance(rv, Response)

    if success_status is not None:
        assert rv.status_code == success_status
        if success_object is not None:
            assert rv.json == success_object
    elif failure_status is not None:
        assert rv.status_code == failure_status
        if 'status' in rv.json:
            assert rv.json['status'] == failure_status
        assert rv.json['message'] is not None
        if failure_string is not None:
            assert failure_string in str(rv.data, encoding='utf8')


# def login_as_user(test_client, user, use_username=True, success_status=None, failure_status=None):
#     assert user is not None
#     rv = post_json(test_client, '/v1/auth/login', {
#         'usernameOrEmail': user.user_data.username if use_username else user.email,
#         'password'       : 'asdfasdfasdf'
#     })
#     validate_response(rv, success_status, failure_status=failure_status)
#     return rv
