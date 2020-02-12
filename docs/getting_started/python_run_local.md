If you are an absolute beginner please read the [prerequisites](/getting_started/python_prereq/) first.

## Run an existing application

### Download source code

Clone the project from github.com:

```bash
onem@local:~$ git clone {{ todo_app.github_py_url }}
```

Now let's create our virtual environment. We will be using Ubuntu 18.04 in this tutorial.

```bash
onem@local:~$ cd django-onem-todo ; pipenv shell --python 3.7
```

The above will create the virtual environment and activate it at the same time.


### Install dependencies

We first need to install the dependencies and create the database.

```bash
(django-onem-todo) onem@local:~/django-onem-todo$ pip install -r requirements.txt
(django-onem-todo) onem@local:~/django-onem-todo$ python manage.py migrate
```

!!! Note
    The `migrate` command will create a local sqlite database.


!!! Info
    On MacOS you might get a pg_config related error that’s solved by installing postgresql package:

        brew install postgresql

    Once you've installed it, install the requirements again.


### Start the server

```bash
(django-onem-todo) onem@local:~/django-onem-todo$ python manage.py runserver
```

The above command will run the server locally at `http://127.0.0.1:8000`

!!! Info
    If you try to access that link you will get a `403` error forbidden response, which is totally fine, since the server is looking into the HTTP headers for specific information sent by ONEm platform.

### Expose the server publicly

Since our server is now running on your local interface, ONEm platform cannot reach it. But we can work around this by using ngrok.

Open a new terminal, go to the folder where your ngrok is and start it up on localhost port 8000. 

```bash
onem@local:~$ ./ngrok http 8000
```

The above command will start ngrok tool, which is basically creating a VPN tunnel so our webserver can be publicly reachable.

The output should be something like:

<pre>
Session Status                online
Session Expires               7 hours, 59 minutes
Update                        update available (version 2.3.34, Ctrl-U to update)
Version                       2.3.30
Region                        United States (us)
Web Interface                 http://127.0.0.1:4040
Forwarding                    http://5d283db8.ngrok.io -> http://localhost:8000
Forwarding                    https://5d283db8.ngrok.io -> http://localhost:8000
</pre>

!!! important
    The important bit here is the `http://5d283db8.ngrok.io` link. We will be using this as our callback url when we will register our app in the [ONEm Developer Portal]({{ links.portal }}).

### Register the application

To register your application please open [ONEm Developer Portal]({{ links.portal }}) and register for a free account.

Once that is done, you will have an option to create an app. Hit that button and place `http://5d283db8.ngrok.io` as the callback url.

!!! success
    That is it. We can now access the application by placing a hashtag in front of the name.

### Run it

In the [Developer Portal]({{ links.portal }}) there is a `Test Client` section. This is a phone simulator from where you can test the app.

Head on to the test client, register your mobile number and send `#name-of-your-app`. At this point ONEm will request the callback url we've set previously, so if you check the ngrok logs you will see the request there.

<pre>
HTTP Requests
-------------
GET /                          200 OK
</pre>

In the test client you can see the below response:

<pre>
#TODO MENU
A New todo
B Done(0)
Todo(0)
--Reply A-B
</pre>

!!! important
    The name of your app will be different as shown in the Developer Portal

The above SMS response is rendered based on the HTTP/JSON response returned by our `/` url.

If we look in the `todo.todo.views` we can see that `HomeView` view which is handling the `/` route is basically returning a [Menu](/building/menus/) json object.

Every menu item contains a callback path, as described in the JSON structure [here]({{ links.schema_url }}) and once the user selects one of the menu items, an HTTP request will be made towards that callback path, a new json structure is returned by our web server, so a different sms response is presented to the user.


## Tweak the application

Let's tweak the application a little bit. Say we want to allow the user to set the priority for the todo item and at the same time not enforce this.

We first need to ask the user for the priority, when creating the todo item. We do that by adding an extra step in the body form returned by our `TaskCreateView.get` method.

The form item looks like the one below.

```python
onem.FormItem(
    type=onem.FormItemType.form_menu,
    name='prio',
    description='Set priority or SKIP',
    required=False,
    body=[
        onem.MenuItemFormItem('High priority', Task.HIGH),
        onem.MenuItemFormItem('Low priority', Task.LOW)
    ]
)
```

Explained:

- represents a menu inside a form as indicated in the `type` argument
- the `name` of the item is `prio` and it matches how our `Task` model is defined
- by making it not `required` the user can skip this step by sending `SKIP` to the platform
- the `body` contains two menu items mapped to values `Task.HIGH` and `Task.LOW`, strings defined on our `Task` model

The form item should be rendered as follows:

<pre>
#TODO
Set priority or SKIP
A High priority
B Low priority
--Reply A-B
</pre>

Now the user can set the priority for a todo item or skip this step altogether.

Once the form is confirmed, the serialized data is sent to our `/task/create/` callback path through an HTTP POST as mentioned in the form definition.

This means that we need to edit our `TaskCreateView.post` method to take into account the `prio` step.

It should look like this:

```python
def post(self, request):
    descr = request.POST['descr']
    due_date = request.POST['due_date']
    prio = request.POST.get('prio') or Task.LOW

    Task.objects.create(
        user=self.get_user(),
        descr=descr,
        due_date=datetime.datetime.strptime(due_date, '%Y-%m-%d').date(),
        prio=prio
    )
    return HttpResponseRedirect(reverse('home'))
```

Explained:

- we've added the 4th line in order to take into account the `prio` step ... if the step is skipped we default to `Task.LOW`
- we place the `prio` when creating a `Task` (line 10)

The final code for our `TaskCreateView` should look like:

```python
class TaskCreateView(View):
    http_method_names = ['get', 'post']

    def get(self, request):
        body = [
            onem.FormItem(
                type=onem.FormItemType.string,
                name='descr',
                description='Please provide a description for the task',
                header='description',
            ),
            onem.FormItem(
                type=onem.FormItemType.date,
                name='due_date',
                description='Provide a due date',
                header='due date',
            ),
            onem.FormItem(
                type=onem.FormItemType.form_menu,
                name='prio',
                description='Set priority or SKIP',
                required=False,
                body=[
                    onem.MenuItemFormItem('High priority', Task.HIGH),
                    onem.MenuItemFormItem('Low priority', Task.LOW)
                ]
            )
        ]
        return self.to_response(
            onem.Form(body=body, path=reverse('task_create'), method='POST')
        )

    def post(self, request):
        descr = request.POST['descr']
        due_date = request.POST['due_date']
        prio = request.POST.get('prio') or Task.LOW

        Task.objects.create(
            user=self.get_user(),
            descr=descr,
            due_date=datetime.datetime.strptime(due_date, '%Y-%m-%d').date(),
            prio=prio
        )
        return HttpResponseRedirect(reverse('home'))
```

!!! Info
    All the above changes should be available immediately, there is no need for a server restart.
