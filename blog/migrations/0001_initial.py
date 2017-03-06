# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Article',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('title', models.CharField(max_length=70, verbose_name=b'\xe6\xa0\x87\xe9\xa2\x98')),
                ('body', models.TextField(verbose_name=b'\xe6\xad\xa3\xe6\x96\x87')),
                ('create_time', models.DateTimeField(auto_now_add=True, verbose_name=b'\xe5\x88\x9b\xe5\xbb\xba\xe6\x97\xb6\xe9\x97\xb4')),
                ('last_modified_time', models.DateTimeField(auto_now=True, verbose_name=b'\xe4\xbf\xae\xe6\x94\xb9\xe6\x97\xb6\xe9\x97\xb4')),
                ('status', models.CharField(max_length=1, verbose_name=b'\xe6\x96\x87\xe7\xab\xa0\xe7\x8a\xb6\xe6\x80\x81', choices=[(b'd', b'Draft'), (b'p', b'Published')])),
                ('abstract', models.CharField(help_text=b'\xe5\x8f\xaf\xe9\x80\x89,\xe4\xb8\xba\xe7\xa9\xba\xe6\x91\x98\xe5\x8f\x96\xe9\x92\xb154\xe4\xb8\xaa\xe5\xad\x97\xe7\xac\xa6', max_length=54, null=True, verbose_name=b'\xe6\x91\x98\xe8\xa6\x81', blank=True)),
                ('views', models.PositiveIntegerField(default=0, verbose_name=b'\xe6\xb5\x8f\xe8\xa7\x88\xe9\x87\x8f')),
                ('likes', models.PositiveIntegerField(default=0, verbose_name=b'\xe7\x82\xb9\xe8\xb5\x9e')),
                ('topped', models.BooleanField(default=False, verbose_name=b'\xe7\xbd\xae\xe9\xa1\xb6')),
            ],
            options={
                'ordering': ['-last_modified_time'],
            },
        ),
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=20, verbose_name=b'\xe7\xb1\xbb\xe5\x90\x8d')),
                ('created_time', models.DateTimeField(auto_now_add=True, verbose_name=b'\xe5\x88\x9b\xe5\xbb\xba\xe6\x97\xb6\xe9\x97\xb4')),
                ('last_modified_time', models.DateTimeField(auto_now=True, verbose_name=b'\xe4\xbf\xae\xe6\x94\xb9\xe6\x97\xb6\xe9\x97\xb4')),
            ],
        ),
        migrations.AddField(
            model_name='article',
            name='category',
            field=models.ForeignKey(on_delete=django.db.models.deletion.SET_NULL, verbose_name=b'\xe5\x88\x86\xe7\xb1\xbb', to='blog.Category', null=True),
        ),
    ]
