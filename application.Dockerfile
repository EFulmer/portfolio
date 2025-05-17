FROM python:3.13-slim

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY pyproject.toml poetry.lock ./
RUN pip install --upgrade pip && \
    pip install poetry && \
    poetry config virtualenvs.create false && \
    poetry install --no-root

COPY . .

# Collect static files at build time if needed
RUN python manage.py collectstatic --noinput

CMD ["bash", "./entrypoint.sh", "gunicorn", "portfolio.wsgi:application", "--bind", "0.0.0.0:8000"]
