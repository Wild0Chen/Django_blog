# -*-coding:utf-8-*-#
import random
from collections import defaultdict

from django.core.files.storage import FileSystemStorage, get_storage_class
from django.core.urlresolvers import reverse
from django.db import models
import datetime


# Create your models here.
# first day


class ArticleManage(models.Manager):
    def archive(self):
        date_list = Article.objects.datetimes('create_time', 'month', order='DESC')
        date_dic = defaultdict(list)
        for d in date_list:
            date_dic[d.year].append(d.month)
        return sorted(date_dic.items(), reverse=True)


class Article(models.Model):
    # title = models.CharField('标题', max_lenght=70)
    objects = ArticleManage()
    title = models.CharField('标题', max_length=70)
    body = models.TextField('正文')
    create_time = models.DateTimeField('创建时间', auto_now_add=True)
    last_modified_time = models.DateTimeField('修改时间', auto_now=True)
    status = models.CharField('文章状态', max_length=1, choices=(('d', '编辑中'), ('p', '已发布')))
    abstract = models.CharField('摘要', max_length=54, blank=True, null=True,
                                help_text='可选,为空摘取钱54个字符')
    views = models.PositiveIntegerField('浏览量', default=0)  # 正数
    likes = models.PositiveIntegerField('点赞', default=0)
    topped = models.BooleanField('置顶', default=False)
    # 应该让他加入到为分类这个地方去
    category = models.ForeignKey('Category', verbose_name='分类', null=True, on_delete=models.SET_NULL)
    tags = models.ManyToManyField('Tag', verbose_name='标签集合', blank=True)

    def __unicode__(self):
        return self.title

    def get_absolute_url(self):
        return reverse('blog:detail', kwargs={'article_id': self.pk})

    class Meta:
        ordering = ['-last_modified_time']  # 逆排序


class Category(models.Model):
    name = models.CharField('类名', max_length=20)
    created_time = models.DateTimeField('创建时间', auto_now_add=True)
    last_modified_time = models.DateTimeField('修改时间', auto_now=True)

    def __str__(self):
        return self.name

    def __unicode__(self):
        return self.name


class Tag(models.Model):
    name = models.CharField('标签名', max_length=20)
    create_time = models.DateTimeField('创建时间', auto_now_add=True)
    last_modified = models.DateTimeField('修改时间', auto_now=True)

    class Meat:
        ordering = ['-id']

    def __str__(self):
        return self.name

    def __unicode__(self):
        return self.name


class BlogComment(models.Model):
    user_name = models.CharField('评论者', max_length=100)
    user_email = models.CharField('e-mail', max_length=100)
    body = models.TextField('内容:')
    create_tim = models.DateTimeField('发表时间:', auto_now_add=True)
    article = models.ForeignKey('Article', verbose_name='文章', on_delete=models.CASCADE)

    def __str__(self):
        return self.body[:20]

    def __unicode__(self):
        return self.body[:20]


class BlogComment2(models.Model):
    body = models.TextField('内容:')
    create_tim = models.DateTimeField('发表时间:', auto_now_add=True)
    comment = models.ForeignKey('BlogComment', verbose_name='comment', null=True, on_delete=models.SET_NULL)

    def __str__(self):
        return self.body[:20]

    def __unicode__(self):
        return self.body[:20]


fs = FileSystemStorage()


class ficx(models.Model):
    filex = models.FileField(storage=fs)

    def __str__(self):
        if hasattr(self.filex, 'name'):
            return self.filex.name
        return 'None'


class RegisterUsers(models.Model):
    email = models.EmailField('邮箱', max_length=40, null=False, unique=True)
    pwd = models.CharField('密码', max_length=20, null=False)
    score = models.IntegerField(default=0)
    referCode = models.IntegerField('推荐码', unique=True)

    def __has_referCode(self, num):
        if RegisterUsers.objects.filter(referCode=num):
            return True
        else:
            return False

    def get_referCode(self):
        num = 0
        while 0 == num or self.__has_referCode(num):
            num = random.randint(1000, 9999)
        return num

    def checkReferCode_and_add_score(self, num):
        try:
            user = RegisterUsers.objects.filter(referCode=num)[0]
            user.score += 100
            user.save()
            return True
        except IndexError:
            return False
