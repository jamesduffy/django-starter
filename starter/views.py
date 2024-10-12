from django.shortcuts import render

from django.http import HttpResponse

from .tasks import add


def home(request):
    return render(request, 'starter/home.html')


def trigger_task(request):
    result = add.delay(10, 20)  # Queue the task
    return HttpResponse(f"Task triggered! Task ID: {result.task_id}")
