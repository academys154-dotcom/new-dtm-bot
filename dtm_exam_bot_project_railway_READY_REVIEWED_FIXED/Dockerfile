FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    DB_PATH=/app/data/data.sqlite3

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends bash fonts-dejavu-core \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY app ./app
COPY start.sh .
COPY .env.example .

RUN chmod +x /app/start.sh && mkdir -p /app/data /app/exports

CMD ["/app/start.sh"]
