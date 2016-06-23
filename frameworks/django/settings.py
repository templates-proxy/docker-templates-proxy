import os
from distutils.version import LooseVersion

import django
# noinspection PyUnresolvedReferences
from proxy.settings import *

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite'),
    }
}

DJANGO_VERSION = LooseVersion(django.get_version())

# noinspection PyUnresolvedReferences,PyUnboundLocalVariable
# install proxy app
INSTALLED_APPS += ('app.app',)

_templates_dir = os.path.join(BASE_DIR, 'app/app/templates')
if DJANGO_VERSION >= '1.8':
    # noinspection PyUnresolvedReferences
    TEMPLATES[0]['DIRS'].append(_templates_dir)

else:
    TEMPLATE_DIRS = (_templates_dir,)

ROOT_URLCONF = 'app.app.urls'

# we allow to build image without any extra requirements
if not os.environ.get('DOCKER_BUILD'):
    _proxy_requires = tuple()
