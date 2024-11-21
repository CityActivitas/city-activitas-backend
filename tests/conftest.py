from __future__ import annotations

import os
from unittest import mock

import pytest
from fastapi.testclient import TestClient


async def _mock_verify_token():
    return {}


@pytest.fixture
@mock.patch.dict(os.environ, {"SUPABASE_URL": "url"})
@mock.patch.dict(os.environ, {"SUPABASE_ANON_KEY": "key"})
@mock.patch("server.dependencies.auth.get_auth_dependency", return_value=_mock_verify_token)
@mock.patch("supabase.create_client")
def test_client(supabase_client, get_auth):
    from server.main import app

    return TestClient(app)
