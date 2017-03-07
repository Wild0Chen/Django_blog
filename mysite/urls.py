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

