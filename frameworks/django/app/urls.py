# noinspection PyUnresolvedReferences
from app.app.views import Proxy
from django.conf import settings
from django.conf.urls import url

if settings.DJANGO_VERSION <= '1.7':
    from django.conf.urls import patterns

    urlpatterns = patterns(
            '',
            url(r'(?P<path>.*)', Proxy.as_view())
    )
else:
    urlpatterns = [
        url(r'(?P<path>.*)', Proxy.as_view())
    ]
