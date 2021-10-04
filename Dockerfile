
FROM python:3.6
WORKDIR /home/django-app
COPY . /home/djano-app

# install dependencies
RUN pip install --upgrade pip 
COPY ./requirements.txt /usr/src/app
RUN pip install -r requirements.txt

# Migration django app
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
