from django.contrib import admin

# Register your models here.
from .models import Category, Article, Tag


class Article_add(admin.TabularInline):
    model = Article
    extra = 3


class Category_add(admin.ModelAdmin):
    inlines = [Article_add]


admin.site.register(Category, Category_add)
admin.site.register(Tag)
