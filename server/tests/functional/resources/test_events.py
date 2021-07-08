from server.tests.utils.request_helpers import get_json, validate_response


def test_events(test_client, access_token):
    rv = get_json(
        test_client,
        '/events', 
        headers={'Authorization': f'Bearer {access_token}'}
    )
    validate_response(rv, 200)
