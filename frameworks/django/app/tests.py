from django.template import Template, Context
from django.template.loader import get_template
from django.test import TestCase




class ProxyTest(TestCase):
    def test_template_loader(self):
        tpl = get_template('test.html')

        self.assertIn('works', tpl.render(Context()))
