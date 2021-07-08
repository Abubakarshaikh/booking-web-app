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
    token_blacklist, user_service)


@doc(tags=['auth'], description='check to ensure server is running')
class Ping(MethodResource, Resource):
    def get(self):
        return {'pong': True}


class LoginRequestSchema(Schema):
    email = fields.Str()
    password = fields.Str()


class LoginResponseSchema(Schema):
    success = fields.Bool()
    access_token = fields.Str()
    refresh_token = fields.Str()
    isConfirmed = fields.Bool()


@doc(tags=['auth'], description='login endpoint')
class Login(MethodResource, Resource):
    @use_kwargs(LoginRequestSchema, location='json')
    @marshal_with(LoginResponseSchema)
    def put(self, **kwargs):
        user_data = request.json
        user = User.query.filter_by(email=user_data['email']).first()
        if user and user.check_password(user_data['password'].encode('utf-8')):
            access_token = create_access_token(identity=user.email)
            refresh_token = create_refresh_token(identity=user.email)
            if user.is_confirmed == False:
                return {
                    'isConfirmed': False,
                }
            return jsonify(success=True, access_token=access_token, refresh_token=refresh_token, isConfirmed=True)
        # TODO: better error handling
        return 'Invalid Credentials', 401


class RefreshResponseSchema(Schema):
    access_token = fields.Str()


@doc(tags=['auth'], description='refresh access_token')
class Refresh(MethodResource, Resource):
    @marshal_with(RefreshResponseSchema)
    @jwt_required(refresh=True)
    def post(self, **kwargs):
        ret = {
            'access_token': create_access_token(identity=current_user.email)
        }
        return jsonify(ret)


class CheckResponseSchema(Schema):
    isLoggedIn = fields.Bool()

@doc(tags=['auth'], description='checks to make sure access_token is still valid')
class Check(MethodResource, Resource):
    @marshal_with(CheckResponseSchema)
    @jwt_required()
    def get(self):
        return {'isLoggedIn': bool(current_user)}


@doc(tags=['auth'], description='logout user and invalidate auth token')
class Logout(MethodResource, Resource):
    @jwt_required()
    def post(self):
        jti = get_jwt()['jti']
        token_blacklist.create(token=jti)
        return jsonify(isLoggedIn=False)


class ConfirmTwoFactorResponseSchema(Schema):
    msg = fields.Str()
    success = fields.Bool()
    access_token = fields.Str()
    refresh_token = fields.Str()


class ConfirmTwoFactorRequestSchema(Schema):
    code = fields.Str(description='two factor 4 digit code')
    email = fields.Str()
    password = fields.Str()


@doc(tags=['auth'], description='confirm two factor code')
class ConfirmTwoFactor(Resource, MethodResource):
    @marshal_with(ConfirmTwoFactorResponseSchema)
    @use_kwargs(ConfirmTwoFactorRequestSchema)
    def put(self, **kwargs):
        user_data = request.json
        user = User.query.filter_by(email=user_data['email']).first()
        if user and user.check_password(user_data['password'].encode('utf-8')):
            if user.is_confirmed == False:
                if user.confirmation == request.json['code']:
                    user_service.update(user, is_confirmed=True, commit=True)
                else:
                    return 'Invalid Credentials', 401
            access_token = create_access_token(identity=user.email)
            refresh_token = create_refresh_token(identity=user.email)
            return jsonify(success=True, access_token=access_token, refresh_token=refresh_token)
        # TODO: better error handling
        return 'Invalid Credentials', 401
