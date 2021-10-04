FROM python
WORKDIR /home/django-app


# install dependencies
COPY . /home/django-app
RUN pip install --upgrade pip 
RUN pip install -r requirements.txt

# Django app Migration 
RUN python manage.py makemigrations
RUN python manage.py migrate

EXPOSE 8000
RUN  python manage.py runserver 0.0.0.0:8000

