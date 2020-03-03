FROM python:3.8-rc-slim

# install pipenv
RUN pip install --upgrade pip
RUN pip install poetry

# switch to directory
WORKDIR /usr/src/app

# copy poetry files and install dependencies
COPY pyproject.toml poetry.lock ./
RUN poetry export -f requirements.txt -o requirements.txt

# Copy in everything else:
COPY . .
RUN pip install -r requirements.txt

# assign app to FLASK_APP
ENV FLASK_APP=app