#-*-coding:utf8-*-#
from django.conf.urls import include, url
from django.conf.urls.static import static
from django.contrib import admin

from . import settings

urlpatterns = [
    # Examples:
    # url(r'^$', 'mysite.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'', include('blog.urls', namespace='blog', app_name='blog2')),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)#静态文件处理
#静态文件可能有3中情况 1静态文件和网站在同一服务器上2静态文件在别的服务器上。3静态文件在cdn或云上
#这种static的方式只适用与开发模式，在真正的部署上不能适用，因为在真正的部署的时候，静态文件的管理应该交给服务器如apache nginx等
#static上一种低效，不安全的调试方式，仅用于本地开发。
#STATICFILES_DIRS = ()存在一个这样的目录用来记录文件的目录
#MEDIA_ROOT它的行为和STATIC_FILE基本一致
#STATIC_ROOT是文件的储存位置，STATIC_URL会与只对应，到专门到地方去STATIC_ROOT上去，这部分基本属于服务器管理的

