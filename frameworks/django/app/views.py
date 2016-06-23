from django.views.generic import View


class Proxy(View):
    def get(self, request, *args, **kwargs):
        print args, kwargs
