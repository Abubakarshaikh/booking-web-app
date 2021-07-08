from flask import current_app, request, jsonify
from flask_jwt_extended import (
    current_user, get_jwt, jwt_required, create_access_token,
    create_refresh_token
)
from flask_apispec.views import MethodResource
from flask_apispec import marshal_with, use_kwargs, doc
from flask_restful import Resource
from marshmallow import Schema, fields
from werkzeug.exceptions import BadRequest

from server.models import User
from server.services import (
    section_service, seat_service)


class CreatePaymentRequestSchema(Schema):
    cart_id = fields.Str()
    payment_method = fields.Str()
    amount_received = fields.Float()
    first_name = fields.Str()
    last_name = fields.Str()
    postal_code = fields.Str()


class CreatePaymentResponseSchema(Schema):
    success = fields.Bool()
    message = fields.Str()


@doc(tags=['payments'], description='submit payment for cart')
class Payment(MethodResource, Resource):
    @use_kwargs(CreatePaymentRequestSchema, location='json')
    @marshal_with(CreatePaymentResponseSchema)
    @jwt_required()
    def post(self, **kwargs):
        return {
            'success': True,
            'message': '',
        }
