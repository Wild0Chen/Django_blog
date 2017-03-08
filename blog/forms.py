# coding:utf-8
from django import forms
from django.core.files.uploadedfile import UploadedFile

from .models import BlogComment, BlogComment2


class BlogCommentForm(forms.ModelForm):
    class Meta:
        model = BlogComment
        fields = ['user_name', 'user_email', 'body']
        widgets = {
            'user_name': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': '昵称',
                'aria-describedby': 'sizing-addon1',
            }),
            'user_email': forms.TextInput(attrs={
                'class': 'form-control',
                'placeholder': '邮箱',
                'aria-describedby': 'sizing-addon1',
            }),
            'body': forms.Textarea(attrs={'placeholder': 'i say~'}),
        }


class BlogCommentForm2(forms.ModelForm):
    class Meta:
        model = BlogComment2
        fields = ['body']
        widgets = {
            'body': forms.Textarea(attrs={'placeholder': 'i say2~'}),
        }


class upfile(forms.Form):
    title = forms.CharField(max_length=50, label_suffix=':', label='自定义文件名-没用',required=False,
                            widget=forms.TextInput(attrs={'class': 'form-control',
                                                          'placeholder': '可以为空'}))
    file = forms.FileField(label='选择文件', label_suffix=':', error_messages={'required': '文件不能为空'})

    def as_div(self):
        "Returns this form rendered as HTML <p>s."
        return self._html_output(
            normal_row='<div class="form-group">%(label)s %(field)s%(help_text)s</div>',
            error_row='%s',
            row_ender='</div>',
            help_text_html=' <span class="helptext">%s</span>',
            errors_on_separate_row=True)
