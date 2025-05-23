from django.urls import path
from . import views


urlpatterns = [
    path('', views.home, name='home'),
    path('post/<slug:slug>/', views.post_detail, name='post_detail'),
    path('about', views.about, name='about'),
    path('todo', views.todo, name='todo'),
]
