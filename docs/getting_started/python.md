Ok, let's create a Todo application in Python. We will be using Ubuntu 18.04, Python 3.6.8 and the following:

- [virtualenvwrapper](https://virtualenvwrapper.readthedocs.io/en/latest/) to create a virtual environment
- [Django](https://www.djangoproject.com/) to quickly build our web server
- [ngrok](https://ngrok.com) to expose our web server publicly so ONEm platform can communicate with it


So once virtualenvwrapper is installed we will create our virtual environment:

```
mkvirtualenv todo
```

The above will create the virtual environment and activate it at the same time.

Now let's install Django and start our project in our home folder:

```
pip install Django==2.2.3
cd ~
django-admin startproject todo
```

Next step is for us to create a Django app:

```
cd ~/todo/todo
django-admin startapp todo
```

Now open `settings.py` and add `todo.todo` to `INSTALLED_APPS`

Next step is to create a model for our Todos. We will place it in `~todo/todo/todo/models.py` and will call it `Task`

```
from django.db import models                                                    
from django.contrib.auth.models import User                                     
from django.urls import reverse                                                 
                                                                                
                                                                                
class Task(models.Model):                                                       
    user = models.ForeignKey(User, models.CASCADE)                                 
    descr = models.CharField(max_length=12)                                        
    due_date = models.DateField()                                                  
    done = models.BooleanField(default=False)                                      
                                                                                   
    HIGH = 'high'                                                                  
    LOW = 'low'                                                                    
    PRIO = (                                                                       
        (HIGH, HIGH),                                                              
        (LOW, LOW),                                                                
    )                                                                              
    prio = models.CharField(max_length=4, choices=PRIO, default=LOW)               
                                                                                   
    def get_absolute_url(self):                                                    
        return reverse('task_detail', args=(self.id,)) 
```

Now we need to create a migration for the above model and apply it:

```
cd ~/todo
python manage.py makemigrations todo.todo
python manage.py migrate
```

We are almost there. We need to add some urls and views to handle the urls.

Open `~/todo/todo/urls.py` and add `path('', include('todo.urls'))` to your existing `urlpatterns`

Your `~/todo/todo/todo/urls.py` should look like this:

```
from django.urls import path                                                    
from . import views                                                             
                                                                                
urlpatterns = [                                                                 
    path('', views.HomeView.as_view(), name='home'),                             
    path('task/create/', views.TaskCreateView.as_view(), name='task_create'),    
    path('task/list/done/', views.TaskListDoneView.as_view(), name='task_list_done'),
    path('task/<int:id>/', views.TaskDetailView.as_view(), name='task_detail'), 
]
```

Last step is to create the `views.py` file. 

This will be a rather larger file and the content is omitted here, but it can be found at this [link](https://raw.githubusercontent.com/mvnm/django-onem-todo/master/todo/todo/views.py)
