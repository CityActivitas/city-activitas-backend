FROM python:3.12-slim

ARG USERNAME=cityactivitas

ENV PYTHONUNBUFFERED=1 \
    PYTHONFAULTHANDLER=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONPATH=/app

RUN apt-get update && \
    apt-get install -y sqlite3=3.40.1-2+deb12u1 --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN useradd --create-home $USERNAME
USER $USERNAME
WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt && \
    mkdir -p /app/data

COPY server /app/server


EXPOSE 8000

CMD ["fastapi", "run", "server/main.py", "--host", "0.0.0.0", "--port", "8000"]
