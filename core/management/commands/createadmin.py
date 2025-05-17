import os

from django.core.management.base import BaseCommand
from django.contrib.auth.models import User


class Command(BaseCommand):
    help = 'Create admin user if it does not exist'

    def handle(self, *args, **kwargs):
        # Using os.environ to fail early.
        username = os.environ["ADMIN_USERNAME"]
        email = os.environ["ADMIN_EMAIL"]
        password =  os.environ["ADMIN_PASSWORD"]

        if not User.objects.filter(username=username).exists():
            User.objects.create_superuser(username=username, email=email, password=password)
            self.stdout.write(self.style.SUCCESS(f'Admin user "{username}" created.'))
        else:
            self.stdout.write(self.style.WARNING(f'Admin user "{username}" already exists.'))

