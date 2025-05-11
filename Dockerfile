FROM python:3.13-slim

WORKDIR /app

ARG PORT=80

RUN python -m pip install --upgrade pip 

RUN python -m pip install uv

COPY . .

ENV UV_COMPILE_BYTECODE=1

ENV UV_LINK_MODE=copy

ENV PORT=$PORT

ENV FLASK_APP=app.py

ENV FLASK_RUN_PORT=$PORT

ENV PYTHONPATH=/app

EXPOSE 80

CMD ["uv", "run", "flask", "run", "--host=0.0.0.0", "--no-reload"]
