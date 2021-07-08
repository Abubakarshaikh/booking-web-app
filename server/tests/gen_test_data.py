from flask_migrate import upgrade

from server.db import db
from server.models.user import Role, User
from server.services import role_service, user_service

from .factories import EventFactory, UserFactory


def reset_db():
    meta = db.metadata
    meta.reflect(bind=db.engine)
    meta.drop_all(
        bind=db.engine,
        tables=[t for t in reversed(meta.sorted_tables)]
    )
    upgrade()


def init_test_data():
    reset_db()
    my_admin = UserFactory(
        email='test@test.com',
        password_hash=User.hash_password('test'),
        is_confirmed=True,
        roles=[role_service.find(name='admin').first(), role_service.find(name='employee').first()],
    )
    user_service.save(my_admin)

    for _ in range(5):
        e = EventFactory()

    for _ in range(5):
        user = UserFactory(roles=[role_service.find(name='user').first()])
        user_service.save(user)
    db.session.commit()
