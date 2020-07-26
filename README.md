### django-docker-compose
Scenario: django and nginx running inside a docker container, mysql running on host machine

### Project setup commands

#### Create virtual environment
virtualenv -p python3.6 venv

#### Create Django Project
python3 venv/bin/django-admin.py startproject core

#### requirements.txt
```
Django==3.0.8
mysqlclient==1.3.13
gunicorn==20.0.4
```

#### create a Database
django_learning

#### DB settings in settings.py
```DATABASES = {
  'default': {
      'ENGINE': 'django.db.backends.mysql',
      'NAME': 'django_learning',
      'USER': 'root',
      'PASSWORD': 'root',
      'HOST': '192.168.1.103',
      'OPTIONS': {
          'init_command': "set sql_mode='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION'"
      },
  }
}
```

#### apply migrations
python manage.py migrate

#### create superuser
python manage.py createsuperuser

```
Username: admin
Password: admin
```

#### runserver
python manage.py runserver


#### docker-compose comands
docker-compose up -d
