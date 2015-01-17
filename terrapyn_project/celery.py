from __future__ import absolute_import

import os

from celery import Celery
from django.conf import settings

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'terrapyn_project.settings')
os.environ.setdefault('PYTHONPATH', '/home/docker/terrapyn_project/')

app = Celery('terrapyn_project')
app.config_from_object('django.conf:settings')
app.autodiscover_tasks(lambda: settings.INSTALLED_APPS)
