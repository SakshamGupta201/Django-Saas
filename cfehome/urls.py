from django.contrib import admin
from django.urls import path
from cfehome.views import home_page_view

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', home_page_view),
]
