# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0004_articlemanage'),
    ]

    operations = [
        migrations.DeleteModel(
            name='ArticleManage',
        ),
    ]
