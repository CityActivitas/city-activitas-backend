from __future__ import annotations


def test_health_check(test_client):
    response = test_client.get("/api/v1/system/health")
    assert response.status_code == 200
    assert response.json()["status"] == "healthy"
