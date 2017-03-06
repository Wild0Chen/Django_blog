# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='article',
            name='status',
            field=models.CharField(max_length=1, verbose_name=b'\xe6\x96\x87\xe7\xab\xa0\xe7\x8a\xb6\xe6\x80\x81', choices=[(b'd', b'\xe7\xbc\x96\xe8\xbe\x91\xe4\xb8\xad'), (b'p', b'\xe5\xb7\xb2\xe5\x8f\x91\xe5\xb8\x83')]),
        ),
    ]
