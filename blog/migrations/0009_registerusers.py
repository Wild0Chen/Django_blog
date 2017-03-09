# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0008_ficx'),
    ]

    operations = [
        migrations.CreateModel(
            name='RegisterUsers',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('email', models.EmailField(max_length=40, verbose_name=b'\xe9\x82\xae\xe7\xae\xb1')),
                ('pwd', models.CharField(max_length=20, verbose_name=b'\xe5\xaf\x86\xe7\xa0\x81')),
                ('score', models.IntegerField(default=0)),
                ('referCode', models.IntegerField(unique=True, verbose_name=b'\xe6\x8e\xa8\xe8\x8d\x90\xe7\xa0\x81')),
            ],
        ),
    ]
