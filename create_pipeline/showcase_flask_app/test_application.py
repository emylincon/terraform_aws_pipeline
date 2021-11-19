import pytest
from app import app, members


@pytest.fixture
def client():
    return app.test_client()


def test_response(client):
    result = client.get('/')
    assert result.status_code == 200

def test_failed_page_redirection(client):
    result = client.get('/failed_url/')
    assert result.status_code == 404

def test_add_success(client):
    result = client.get('/Emeka/')
    assert result.status_code == 200

def test_four_in_team():
    assert len(members) == 4
