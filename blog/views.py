# -*-coding:utf-8-*-#
import sys

from django.forms.extras import SelectDateWidget
from django.forms.utils import ErrorList
from django.http import HttpResponse
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

sys.path.append('../')
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect
from django.shortcuts import render, get_object_or_404, render_to_response
from django.views.generic import DetailView
from django.views.generic.edit import FormView, DeleteView

from .forms import BlogCommentForm,  UpFile, RegUserForm, RegUserFormIn, ErrorListCfg
from .models import Article, Category, Tag, BlogComment, ficx, RegisterUsers
from django.views.generic.list import ListView
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
            if article.abstract == '':
                article.abstract = article.body[0:54] + '...'
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
            if article.abstract:
                article.abstract = article.body[0:54]
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


# def test(request):
#     comment = get_object_or_404(BlogComment, pk='comment_id')
#     comment.delete()
#     return HttpResponseRedirect(comment.article.get_absolute_url())


class DeleteComment(DeleteView):
    model = BlogComment
    pk_url_kwarg = 'comment_id'

    def delete(self, request, *args, **kwargs):
        return super(DeleteComment, self).delete(request, *args, **kwargs)

    # 我还不知道怎么传递method＝delete所以我重写delete没屌用－ －，留坑
    # http的method只能传送get
    def render_to_response(self, context, **response_kwargs):
        obj = self.get_object()
        # obj.delete()#删除测试注释点
        return HttpResponseRedirect(obj.article.get_absolute_url())


class File_del(DeleteView):
    model = ficx
    pk_url_kwarg = 'file_id'

    def render_to_response(self, context, **response_kwargs):
        obj = self.get_object()
        obj.delete()  # 删除测试注释点
        return HttpResponseRedirect(reverse('blog:upLoadFile_List'))


class CommentPostView(FormView):
    form_class = BlogCommentForm
    template_name = 'blog/detail.html'
    pu_url_kwarg = 'article_id'

    def form_valid(self, form):
        target_article = get_object_or_404(Article, pk=self.kwargs.get(self.pk_url_kwarg, None))
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


class UpLoad(FormView):
    form_class = UpFile
    context_object_name = 'form'
    template_name = 'blog/upLoadFile.html'

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
        up_file = form.save(commit=False)
        up_file.save()
        # 废弃,使用modelForm方式继承，不需要再使用通过创建模型的方式save
        # 保留这段注释，原来form从forms.Form继承，现在是从ModelForm继承，
        # 体现出两种继承方式中save的区别
        # modelform中直接创建model对象直接save，Form需要自己创建并初始化它
        # file = form.files['file']
        # f = ficx()
        # f.filex.save(file.name, file)
        return HttpResponseRedirect(reverse("blog:upLoadFile_List"))


class UpLoadFileList(ListView):
    model = ficx
    template_name = 'blog/file_list.html'
    context_object_name = 'file_list'


# 登陆
class SingIn(FormView):
    form_class = RegUserFormIn
    user_id = None

    def get(self, request, *args, **kwargs):
        form = self.get_form()
        return render(request, 'blog/singin.html', context={'form': form})

    def post(self, request, *args, **kwargs):
        form = self.get_form()
        if self.check_valid(form):
            return self.form_valid(form)
        else:
            return self.form_invalid(form)

    def form_valid(self, form):
        return HttpResponseRedirect(reverse('blog:user_admin', args=(self.user_id,)))

    def form_invalid(self, form):
        if form['email'].value():
            form.errors['email'] = ['用户名或者密码错误']
        return render(self.request, 'blog/singin.html', context={'form': form})

    def check_valid(self, form):
        if not form['pwd'].value(): return False  # 没密码就不检查后面
        email = form['email'].value()
        users = RegisterUsers.objects.filter(email=email)
        if not users: return False
        user = users[0]
        self.user_id = user.pk
        return form['pwd'].value() == user.pwd


# 注册
class SingUp(FormView):
    form_class = RegUserForm
    template_name = 'blog/singup.html'

    def get(self, request, *args, **kwargs):
        form = self.get_form_class()
        try:
            form.initial['referCoder'] = kwargs['refer_code']  # 如果有推荐码使用initial对他进行初始化
            # 如果form是绑定的那么form['key'].value()給的是data中的值，如果未绑定则给initial中的值
            # form['key'].field==form.fields['key']
            # field.form-》form
        finally:
            return render(self.request, self.get_template_names(), context={'form_singup': form})

    def post(self, request, *args, **kwargs):
        form = self.get_form()
        form.error_class = ErrorListCfg
        if form.is_valid():
            return self.form_valid(form)
        else:
            return self.form_invalid(form)

    def form_invalid(self, form):
        return render(self.request, self.get_template_names(), context={'form_singup': form})

    def form_valid(self, form):
        user = form.save(commit=False)
        user.get_referCode()
        if not user.checkReferCode_and_add_score(form.cleaned_data['referCoder']):
            return render(self.request, self.get_template_names(), context={'form_singup': form, 'input_error': 1})
        user.save()
        return HttpResponseRedirect(reverse('blog:user_admin', args=(user.id,)))


# 保留给后面扩展继续使用
def user_admin(request, user_id):
    user = RegisterUsers.objects.get(pk=user_id)
    referCode_url = 'http://' + request.META['HTTP_HOST'] + '/singup/' + str(user.referCode)
    return render_to_response('blog/user_admin.html', context={'referCode_url': referCode_url, 'user': user})


@csrf_exempt
def ajax_add(request):
    form = BlogCommentForm(data=request.POST)
    if form.is_valid():
        comment = form.save(commit=False)
        article = get_object_or_404(Article, pk=request.POST['article_id'])
        comment.article = article
        comment.save()
        return render_to_response('blog/comment2.html',
                                  context={'comment': comment, 'index': BlogComment.objects.count()})
    else:
        return HttpResponse('')


@csrf_exempt
def ajax_del(request):
    comment = get_object_or_404(BlogComment, pk=request.POST['comment_id'])
    # comment.delete()#测试完成
    return JsonResponse(data={'how': '1'})
