FROM ubuntu:18.04 as base

RUN apt-get update \
    && apt-get -y upgrade
    
RUN apt-get install -y bash gcc musl-dev libffi-dev python-dev python3.7-dev python3-pip python3-dev mysql-server default-libmysqlclient-dev libssl-dev software-properties-common

ENV DJANGO_PROJECT_NAME core

# install pypi packages
COPY requirements.txt /requirements.txt
RUN pip3 install -r requirements.txt

WORKDIR /src 
EXPOSE 8888:8888

CMD python3 manage.py migrate ; python3 manage.py collectstatic; gunicorn --reload $DJANGO_PROJECT_NAME.wsgi -c gunicorn.py -b 0.0.0.0:8888
