from server.tests.utils.request_helpers import get_json, put_json, validate_response


def test_ping(test_client):
    rv = get_json(test_client, '/ping')
    validate_response(rv, 200, {'pong': True})


def test_login_username(test_client, random_user):
    rv = put_json(test_client, '/login', {'email': 'test@test.com', 'password': 'test'})
    validate_response(rv, 200)
