from flask import current_app, request, jsonify
from flask_jwt_extended import (
    current_user, jwt_required,
)
from flask_apispec.views import MethodResource
from flask_apispec import marshal_with, use_kwargs, doc
from flask_restful import Resource
from marshmallow import Schema, fields
from sqlalchemy import exc, or_, and_
from sqlalchemy.sql import exists
from sqlalchemy.sql.expression import literal
from werkzeug.exceptions import BadRequest

from server.models import User as UserModel
from server.services import (address_service, user_service)


class CreateUserRequestSchema(Schema):
    email = fields.Str()
    first_name = fields.Str()
    last_name = fields.Str()
    address = fields.Str()
    city = fields.Str()
    state = fields.Str()
    country = fields.Str()
    phone_number = fields.Str()


class CreateUserResponseSchema(Schema):
    success = fields.Bool()
    id = fields.Str()


@doc(tags=['user'], description='create new user')
class User(MethodResource, Resource):
    @use_kwargs(CreateUserRequestSchema, location='json')
    @marshal_with(CreateUserResponseSchema)
    @jwt_required()
    def post(
        self, email, first_name, last_name,
        address, city, state, country, phone_number
    ):
        mailing_address = address_service.create(
            street_address=address,
            city=city,
            state=state,
            country=country,
        )
        try:
            _u = user_service.create(
                email=email,
                first_name=first_name,
                last_name=last_name,
                mailing_address=mailing_address,
                phone_number=phone_number,
                created_by=current_user,
                # last_updated_by=current_user,
            )
        except exc.IntegrityError:
            raise BadRequest('Email already Registered')
        return {
            'success': True,
            'id': 1,
        }


class CreateUserRequestSchema(Schema):
    search_query = fields.Str()


class UserSchema(Schema):
    id = fields.Str()
    company = fields.Str()
    email = fields.Str()
    first_name = fields.Str(attribute='firstName')
    last_name = fields.Str(attribute='lastName')
    username = fields.Str()
    phone_number = fields.Str(attribute='phoneNumber')


class CreateUserResponseSchema(Schema):
    success = fields.Bool()
    users = fields.List(fields.Nested(UserSchema))


@doc(tags=['user'], description='create new user')
class Users(MethodResource, Resource):
    @use_kwargs(CreateUserRequestSchema, location='json')
    @marshal_with(CreateUserResponseSchema)
    @jwt_required()
    def get(self, search_query=None, limit=100):
        if search_query:
            return {
                'success': True,
                'users': user_service.filter(
                    or_(
                        UserModel.email.like(f'%{search_query}%'),
                        UserModel.phone_number.contains(search_query),
                        and_(
                            literal(search_query).ilike('%' + UserModel.first_name + '%'),
                            literal(search_query).ilike('%' + UserModel.last_name + '%'),
                        ),
                    ),
                ),
            }

        return {
            'success': True,
            'users': user_service.all(limit=limit),
        }

