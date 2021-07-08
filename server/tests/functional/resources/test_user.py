import random

from server.tests.utils.request_helpers import post_json, validate_response


def test_create_user(test_client, access_token):
    rv = post_json(test_client, '/user', {
        'email': f'test{random.randint(1, 10000)}@test.com',
        'first_name': 'first',
        'last_name': 'last',
        'address': '123 main st',
        'city': 'Boston',
        'state': 'MA',
        'country': 'USA',
        'phone_number': f'+123456{random.randint(1000, 9999)}',
    }, headers={'Authorization': f'Bearer {access_token}'})
    validate_response(rv, 200)
