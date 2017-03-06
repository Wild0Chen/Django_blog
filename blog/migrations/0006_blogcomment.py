# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0005_delete_articlemanage'),
    ]

    operations = [
        migrations.CreateModel(
            name='BlogComment',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('user_name', models.CharField(max_length=100, verbose_name=b'\xe8\xaf\x84\xe8\xae\xba\xe8\x80\x85')),
                ('user_email', models.CharField(max_length=100, verbose_name=b'e-mail')),
                ('body', models.TextField(verbose_name=b'\xe5\x86\x85\xe5\xae\xb9:')),
                ('create_tim', models.DateTimeField(auto_now_add=True, verbose_name=b'\xe5\x8f\x91\xe8\xa1\xa8\xe6\x97\xb6\xe9\x97\xb4:')),
                ('article', models.ForeignKey(verbose_name=b'\xe6\x96\x87\xe7\xab\xa0', to='blog.Article')),
            ],
        ),
    ]
