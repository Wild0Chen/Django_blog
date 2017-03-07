# -*-coding:utf-8-*-#
import sys

sys.path.append('../')
import csv
from django.conf.global_settings import MEDIA_ROOT
from django.core.files.storage import FileSystemStorage, DefaultStorage, default_storage, get_storage_class, Storage
from django.core.urlresolvers import reverse
from django.forms import forms
from django.http import HttpResponse
from django.http import HttpResponseForbidden
from django.http import HttpResponseNotModified
from django.http import HttpResponseRedirect
from django.shortcuts import render, get_object_or_404, render_to_response, redirect
from django.template import Context
from django.template.loader import get_template
from django.template.response import TemplateResponse, SimpleTemplateResponse
from django.views.generic import DetailView
from django.views.generic import TemplateView
from django.views.generic.edit import FormView, DeleteView

from mysite import settings
from .forms import BlogCommentForm, BlogCommentForm2, upfile
from .models import Article, Category, Tag, BlogComment, ficx
from django.views.generic.list import ListView, BaseListView
import markdown2


# Create your views here.

def HomePage(request):
    return render(request, 'blog/home.html')


class IndexView(ListView):
    template_name = 'blog/index.html'
    context_object_name = 'article_list'
    model = Article

    def get_queryset(self):
        article_list = Article.objects.filter(status='p')
        for article in article_list:
            article.body = markdown2.markdown(article.body, extras=['fenced-code-blocks'], )
        return article_list

    def get_context_data(self, **kwargs):
        kwargs['category_list'] = Category.objects.all().order_by('name')
        kwargs['date_archive'] = Article.objects.archive()
        kwargs['tag_list'] = Tag.objects.all().order_by()
        return super(IndexView, self).get_context_data(**kwargs)


class ArticleDetailView(DetailView):
    model = Article
    template_name = 'blog/detail.html'
    context_object_name = 'article'
    pk_url_kwarg = 'article_id'  # 接收URL主键url(r'.../<?P<article_id>...),

    def get_object(self):
        obj = super(ArticleDetailView, self).get_object()
        obj.body = markdown2.markdown(obj.body, extras=['fenced-code-blocks'], )
        return obj

    def get_context_data(self, **kwargs):
        kwargs['comment_list'] = self.object.blogcomment_set.all()
        kwargs['form'] = BlogCommentForm()
        kwargs['form2'] = BlogCommentForm2()
        return super(ArticleDetailView, self).get_context_data(**kwargs)


class CategoryView(ListView):
    template_name = 'blog/index.html'
    context_object_name = 'article_list'

    def get_queryset(self):
        article_list = Article.objects.filter(category=self.kwargs['cate_id'], status='p')
        for article in article_list:
            article.body = markdown2.markdown(article.body, extras=['fenced-code-blocks'], )
        return article_list

    def get_context_data(self, **kwargs):
        kwargs['category_list'] = Category.objects.all().order_by('name')
        return super(CategoryView, self).get_context_data(**kwargs)


class TagView(ListView):
    template_name = 'blog/index.html'
    context_object_name = 'article_list'

    def get_queryset(self):
        article_list = Article.objects.filter(tags=self.kwargs['tag_id'], status='p')
        for article in article_list:
            article.body = markdown2.markdown(article.body, extras=['fenced-code-block'])
        return article_list

    def get_context_data(self, **kwargs):
        kwargs['tag_list'] = Tag.objects.all().order_by('id')
        return super(TagView, self).get_context_data(**kwargs)


class ArchiveView(ListView):
    template_name = "blog/index.html"
    context_object_name = 'article_list'

    def get_queryset(self):
        year = int(self.kwargs['year'])
        month = int(self.kwargs['month'])
        article_list = Article.objects.filter(create_time__year=year, create_time__month=month)
        for article in article_list:
            article.body = markdown2.markdown(article.body, extras=['fenced-code-block'])
        return article_list

    def get_context_data(self, **kwargs):
        kwargs['tag_list'] = Tag.objects.all().order_by('name')
        return super(ArchiveView, self).get_context_data(**kwargs)


def test(request):
    comment = get_object_or_404(BlogComment, pk='comment_id')
    comment.delete()
    return HttpResponseRedirect(comment.article.get_absolute_url())


class DeleteComment(DeleteView):
    model = BlogComment
    pk_url_kwarg = 'comment_id'

    def delete(self, request, *args, **kwargs):
        return super(DeleteView, self).delete(request, args, kwargs)

        # def render_to_response(self, context, **response_kwargs):
        #     return HttpResponseRedirect(context['object'].article.get_absolute_url())


class CommentPostView(FormView):
    form_class = BlogCommentForm
    template_name = 'blog/detail.html'

    def form_valid(self, form):
        target_article = get_object_or_404(Article, pk=self.kwargs['article_id'])
        comment = form.save(commit=False)
        comment.article = target_article
        comment.save()
        self.success_url = target_article.get_absolute_url()
        return HttpResponseRedirect(self.success_url)

    def form_invalid(self, form):
        target_article = get_object_or_404(Article, pk=self.kwargs['article_id'])
        return render(self.request, 'blog/detail.html', {
            'form': form,
            'article': target_article,
            'comment_list': target_article.blogcomment_set.all()
        })


class CommentPostView2(FormView):
    form_class = BlogCommentForm2
    template_name = 'blog/detail.html'

    def form_valid(self, form):
        target_comment = get_object_or_404(BlogComment, pk=self.kwargs['comment_id'])
        target_article = get_object_or_404(Article, pk=target_comment.id)
        comment = form.save(commit=False)
        comment.comment = target_comment
        comment.save()
        self.success_url = target_article.get_absolute_url()
        print(comment.body)
        return HttpResponseRedirect(self.success_url)

    def form_invalid(self, form):
        comment = get_object_or_404(BlogComment, pk=self.kwargs['comment_id'])
        article = get_object_or_404(Article, pk=comment.id)
        return render(self.request, 'blog/detail.html', {
            'form': form,
            'article': article,
            'comment_list': article.blogcomment_set.all()
        })


def none_page(request):
    x = reverse('index')
    print x
    return HttpResponseRedirect(x)


def saveFile(f):
    file = f.files['file']
    f = ficx()
    f.filex.save(file.name, file)
    # i = get_storage_class()('blog/up_load_file')
    # i.save(file.name, file)


class upLoad(FormView):
    form_class = upfile
    context_object_name = 'form'
    template_name = 'upLoadFile.html'

    def get(self, request, *args, **kwargs):
        form = self.get_form()
        return render(self.request, self.get_template_names(), context={'form': form})

    def post(self, request, *args, **kwargs):
        form = self.get_form()
        if form.is_valid():
            return self.form_valid(form)
        else:
            return self.form_invalid(form)

    def form_invalid(self, form):
        return render(self.request, self.get_template_names(), context={'form': form})

    def form_valid(self, form):
        saveFile(form)
        return HttpResponseRedirect(reverse("blog:uploadfile_list"))


def csv_view(request):
    response = HttpResponse(content_type='text/csv')
    response['Content-Disposition'] = 'attachment; filename=file_name.csv'  # 附加Content－Disposition协议头，包含文件名
    writer = csv.writer(response)
    writer.writerow(['First row', 'f', 'b', 'z'])
    writer.writerow(['Second row', 'f', 'b', 'z', 'a', 'b', 'c'])
    writer.writerow(['是'])
    return response


class uploadfile_list(ListView):
    model = ficx
    template_name = 'blog/file_list.html'
    context_object_name = 'file_list'

