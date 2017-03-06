# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.core.files.storage


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0007_blogcomment2'),
    ]

    operations = [
        migrations.CreateModel(
            name='ficx',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('filex', models.FileField(storage=django.core.files.storage.FileSystemStorage(), upload_to=b'')),
            ],
        ),
    ]
