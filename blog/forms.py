# coding:utf-8
from django import forms
from django.forms.utils import ErrorList

from .models import BlogComment, BlogComment2, RegisterUsers, ficx


class AsDivBlock:
    def as_div(self):
        return self._html_output(
            normal_row='<div class="form-group">%(label)s %(field)s%(help_text)s</div>',
            error_row='%s',
            row_ender='</div>',
            help_text_html=' <span class="helptext">%s</span>',
            errors_on_separate_row=True)


class BlogCommentForm(AsDivBlock, forms.ModelForm):
    required_css_class = 'form-group'

    class Meta:
        model = BlogComment
        fields = ['user_name', 'user_email', 'body']
        widgets = {
            'user_name': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': '昵称',
            }),
            'user_email': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': '邮箱',
            }),
            'body': forms.Textarea(attrs={'class': 'form-control', 'placeholder': 'i say~'}),
        }


class BlogCommentForm2(forms.ModelForm):
    class Meta:
        model = BlogComment2
        fields = ['body']
        widgets = {
            'body': forms.Textarea(attrs={'placeholder': 'i say2~'}),
        }


class upfile(AsDivBlock, forms.ModelForm):
    title = forms.CharField(max_length=50, label_suffix=':', label='自定义文件名-没用', required=False,
                            widget=forms.TextInput(attrs={'class': 'form-control',
                                                          'placeholder': '可以为空'}))

    # file = forms.FileField(label='选择文件', label_suffix=':', error_messages={'required': '文件不能为空'})
    class Meta:
        model = ficx
        fields = ['title', 'filex']
        error_messages = {
            'filex': {'required': "文件不能为空"},
        }
        labels = {
            'filex': '选择文件',
        }


# 重置errorList，添加自定义的class类型 同时可以重载到as_div上，将错误改成div
class ErrorListCfg(ErrorList):
    def __init__(self, initlist=None):
        super(ErrorListCfg, self).__init__(initlist, error_class='yes')

    def __str__(self):
        return self.as_div()

    def __unicode__(self):
        return self.as_div()

    def as_div(self):
        if not self: return ''
        return '<div class="ist fky">%s</div>' % ''.join(['<div class="error">%s</div>' % e for e in self])


class RegUserForm(AsDivBlock, forms.ModelForm):
    required_css_class = 'form-group sr-only'
    # required不能再Meta中指定
    referCoder = forms.IntegerField(label=False, required=False,  # 推荐码
                                    widget=forms.NumberInput(attrs={'class': 'form-control center-block',
                                                                    'type': 'tel', 'name': 'referCode',
                                                                    'placeholder': '推荐码,可以为空'}))

    # __new__会改变成员的接口形式为OrderDict，细节不用看
    class Meta:
        model = RegisterUsers
        fields = ['email', 'pwd']
        widgets = {
            'email': forms.TextInput(
                attrs={'class': 'form-control', 'placeholder': 'name@example.com',
                       'type': 'email', 'autofocus': 'true'}),
            'pwd': forms.PasswordInput(attrs={'class': 'form-control', 'placeholder': '********'}),
        }
        error_messages = {
            'email': {'required': "用户名不能为空", 'unique': '用户名不能重复'},
            'pwd': {'required': "密码不能为空"},
        }


# meta这些东西会在fields中以OrderDict的形式存在，渲染的时候调用他们对应的field中的clean生成检查数据正确性
# 如果错误那么会通过抛出ValidationError,通过add_eeror添加到error_message中，使用ErrorList渲染
# 在他调用__str__的时候进行渲染
# getitem被重载掉了返回的是bound_fields_cache中的值它与fields中一样
# bound 中有一个form指回这个form
# 只有Is_bound 和 errors为空时候is_vaild为TRUE，那么说明只有form是bound的情况下才可行
# fields不为空只有在data有值的时候is_bound为true
# 在viewForm中在get_form的时候会从request中自动取出一些值传递给viewForm绑定的form_class，生成绑定的form数据，并且验证他的有效性
# 在form中有一个errors的东西是对self._selfs装饰而来的，在其内部会执行full_clean  -->到第二天处执行

#偷懒的方法
class RegUserFormIn(RegUserForm):
    referCoder = None#取消掉父类的属性

    class Meta(RegUserForm.Meta):
        fields = ['email', 'pwd']
        exclude = ['referCode']
# 如果上面的referCoder是在Meta中的，那么我可以通过这种形式对他排除
#或者将referCoder进行空引用
#如果不想继承在form。fields中去掉它也可以，因为它不是表单必须数据，且它不是require数据
#不是required的表单数据是可以不完整提交的
# form.fields.pop('referCoder')  # 去掉推荐码
