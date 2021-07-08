import random

from server.tests.utils.request_helpers import post_json, validate_response


def test_payments(test_client, access_token):
    rv = post_json(test_client, '/payment', {
        'cart_id': '1',
        'payment_method': 'card',
        'amount_received': 100.02,
        'first_name': 'first',
        'last_name': 'last',
        'postal_code': '01111',
    }, headers={'Authorization': f'Bearer {access_token}'})
    validate_response(rv, 200)
