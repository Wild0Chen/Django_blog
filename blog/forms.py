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
    title = forms.CharField(max_length=50)
    file = forms.FileField()

