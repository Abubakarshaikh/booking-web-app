import click
from flask.cli import with_appcontext

from server.db import db
from server.tests.gen_test_data import reset_db, init_test_data


@click.command(name='createdb')
@with_appcontext
def cli_create_db():
    db.create_all()
    db.session.commit()
    print('Database tables created')


@click.command(name='resetdb')
@with_appcontext
@click.option('--testdata', '-t', is_flag=True)
def cli_reset_db(testdata):
    reset_db()
    print('Reset DB')
    if testdata:
        init_test_data()
        print('generating test data')


def add_commands(app):
    app.cli.add_command(cli_create_db)
    app.cli.add_command(cli_reset_db)
