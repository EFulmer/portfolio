from django.shortcuts import get_object_or_404, render
from .models import Post


def home(request):
    posts = Post.objects.order_by('-created_at')  # Descending order.
    return render(request, 'core/home.html', {'posts': posts})


def post_detail(request, slug):
    post = get_object_or_404(Post, slug=slug)
    return render(request, 'core/post_detail.html', {'post': post})


def about(request):
    return render(request, 'core/about.html')
