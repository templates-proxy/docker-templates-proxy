from django import template

register = template.Library()


@register.simple_tag()
def test_proxy():
    return 'It works!'
