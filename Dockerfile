
FROM python:3.6
WORKDIR /home/django-app


# install dependencies
COPY ./requirements.txt /home/django-app
COPY ./manage.py /home/django-app
COPY ./simpleApp /home/django-app
RUN pip install --upgrade pip 
RUN pip install -r requirements.txt

# Django app Migration 
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate

EXPOSE 8000
RUN  python3.6 manage.py runserver 0.0.0.0:8000

