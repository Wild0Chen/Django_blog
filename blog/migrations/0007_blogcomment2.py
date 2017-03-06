# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0006_blogcomment'),
    ]

    operations = [
        migrations.CreateModel(
            name='BlogComment2',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('body', models.TextField(verbose_name=b'\xe5\x86\x85\xe5\xae\xb9:')),
                ('create_tim', models.DateTimeField(auto_now_add=True, verbose_name=b'\xe5\x8f\x91\xe8\xa1\xa8\xe6\x97\xb6\xe9\x97\xb4:')),
                ('comment', models.ForeignKey(on_delete=django.db.models.deletion.SET_NULL, verbose_name=b'comment', to='blog.BlogComment', null=True)),
            ],
        ),
    ]
