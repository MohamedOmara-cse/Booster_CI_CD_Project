FROM python:3.6
WORKDIR /home/django-app


# install dependencies
COPY . /home/django-app
ENV PYTHONUNBUFFERED=1
RUN pip install --upgrade pip 
RUN pip install -r requirements.txt

# Django app Migration 
RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
