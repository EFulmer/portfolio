from django.shortcuts import get_object_or_404, render
from .models import Post


def home(request):
    posts = Post.objects.all()
    return render(request, 'core/home.html', {'posts': posts})


def post_detail(request, pk):
    post = get_object_or_404(post, pk=pk)
    return render(request, 'core/post_detail.html', {'post': post})


def about(request):
    return render(request, 'core/about.html')
