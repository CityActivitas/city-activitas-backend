from __future__ import annotations

import os
from unittest import mock

import pytest
from fastapi.testclient import TestClient


@pytest.fixture
@mock.patch.dict(os.environ, {"SUPABASE_URL": "url"})
@mock.patch.dict(os.environ, {"SUPABASE_ANON_KEY": "key"})
@mock.patch("supabase.create_client")
def test_client(create_client):
    from server.main import app

    return TestClient(app)
