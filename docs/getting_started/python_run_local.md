If you are an absolute beginner please read the [prerequisites](/getting_started/python_prereq/) first.

First let's create our virtual environment. We will be using Ubuntu 18.04 in this tutorial.

```bash
onem@local:~$ mkvirtualenv todo
...  # skipped for brevity
(todo) onem@local:~$ 

```
The above will create the virtual environment and activate it at the same time.

### Download source code

Clone the project from github.com:

```bash
(todo) onem@local:~$ git clone {{ todo_app.github_py_url }}
```

### Dependencies

We first need to install the dependencies and create the database.

```bash
(todo) onem@local:~$ cd django-onem-todo
(todo) onem@local:~$ pip install -r requirements.txt
(todo) onem@local:~$ python manage.py migrate
```

### Start the server

```bash
(todo) onem@local:~$ python manage.py runserver
```

The above command will run the server locally at `http://127.0.0.1:8000`

If you try to access that link you will get a `403` error forbidden response, which is totally fine, since the server is looking into the HTTP headers for specific information sent by ONEm platform.

### Expose the server publicly

Since our server is now running on your local interface, ONEm platform cannot reach it. But we can work around this by using ngrok.

Open a new terminal and start up ngrok on localhost port 8000.

```bash
onem@local:~$ ngrok http 8000
```

The above command will start ngrok tool, which is basically creating a VPN tunnel so our webserver can be publicly reachable.

The output should be something like:

```bash
Session Status                online
Session Expires               7 hours, 59 minutes
Update                        update available (version 2.3.34, Ctrl-U to update)
Version                       2.3.30
Region                        United States (us)
Web Interface                 http://127.0.0.1:4040
Forwarding                    http://5d283db8.ngrok.io -> http://localhost:8000
Forwarding                    https://5d283db8.ngrok.io -> http://localhost:8000
```

The important bit here is the `http://5d283db8.ngrok.io` link. We will be using this as our callback url when we will register our app on ONEm developer portal.

### Register the application

To register your application please open [ONEm Developer Portal]({{ links.portal }}) and register for a free account.

Once that is done, you will have an option to create an app. Hit that button and place `http://5d283db8.ngrok.io` as the callback url.

That is it. We can now access the application by placing a hashtag in front of the name.

### Run it

In the developer portal there is a `Test Client` section. This is a phone simulator from where you can test the app.

Head on to the test client and send `#name-of-your-app`. At this point ONEm will request the callback url we've set previously, so if you check the ngrok logs you will see the request there.

```bash
HTTP Requests
-------------
GET /                          200 OK   
```

In the test client you can see the below response:

```bash
#TODO MENU
A New todo
B Done(0)
Todo(0)
--Reply A-B
```

_*the name of your app will be different, as chosen in the developer portal_

The above sms response is rendered based on the HTTP json response returned by our `/` url.

If we look in the `todo.todo.views` we can see that `HomeView` view which is handling the `/` route is basically returning a [Menu](/building/menus/) json object.

Every menu item contains a callback path, as described in the json structure [here](/building/menus/#json-structure) and once the user selects one of the menu items, an HTTP request will be made towards that callback path, a new json structure is returned by our web server, so a different sms response is presented to the user.
