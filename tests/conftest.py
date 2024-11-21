from __future__ import annotations

import pytest
from fastapi.testclient import TestClient

from server.main import app


@pytest.fixture
def test_client():
    return TestClient(app)
