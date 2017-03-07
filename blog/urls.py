# -*-coding:utf-8-*-#
from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^$', views.HomePage, name='home'),
    url(r'^blog/$', views.IndexView.as_view(), name='index'),
    url(r'^tag/(?P<tag_id>\d+)$', views.TagView.as_view(), name='tag'),
    url(r'^blog/article/(?P<article_id>\d+)$', views.ArticleDetailView.as_view(), name='detail'),
    url(r'^blog/category/(?P<cate_id>\d+)$', views.CategoryView.as_view(), name='category'),
    url(r'^archive/(?P<year>\d+)/(?P<month>\d+)$', views.ArchiveView.as_view(), name='archive'),
    url(r'^article/(?P<article_id>\d+)/comment/$', views.CommentPostView.as_view(), name='comment'),
    url(r'^article/comment2/(?P<comment_id>\d+)/$', views.CommentPostView2.as_view(), name='comment2'),
    url(r'^blog/del/(?P<comment_id>\d+)/$', views.DeleteComment.as_view(), name='comment_del'),
    url(r'^uploadfile/$', views.upLoad.as_view(), name='upLoadFile'),
    url(r'^csv/$', views.csv_view, name='csv_view'),
    url(r'^uploadfile_list/$', views.uploadfile_list.as_view(), name='uploadfile_list'),
]
