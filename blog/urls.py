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
    url(r'^blog/del/(?P<comment_id>\d+)/$', views.DeleteComment.as_view(), name='comment_del'),
    url(r'^uploadfile/$', views.UpLoad.as_view(), name='upLoadFile'),
    url(r'^uploadfile_list/$', views.UpLoadFileList.as_view(), name='upLoadFile_List'),
    url(r'^uploadfile_list/(?P<file_id>\d+)/$', views.File_del.as_view(), name='file_del'),
    url(r'^singin/$', views.SingIn.as_view(), name='singin'),  # 登陆
    url(r'^singup/$', views.SingUp.as_view(), name='singup'),  # 注册
    url(r'^singup/(?P<refer_code>\d+)/$', views.SingUp.as_view(), name='singup_refer'),  # 注册
    url(r'^user_admin/(?P<user_id>\d+)/$', views.user_admin, name='user_admin'),  #推荐码注册
    url(r'^ajax_add_comment/$', views.ajax_add),
    url(r'^ajax_del_comment/$', views.ajax_del),
]
