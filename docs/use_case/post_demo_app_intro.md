In this tutorial we are going to present 3 versions of ONEm's #post application. The apps are written using the Django framework ONEm's Python SDK.

- **postv1** - a stripped down version of the service; we will be able to create, store and view posts
- **postv2** - on top of v1, we will now add a Search wizard so we can search by keyword/code in all saved posts (ours or others)
- **postv3** - on top of v2, we will enable interactions with ONEm's restdAPI

For prerequisites and running any of the 3 apps locally please refer to: [prerequisites](/getting_started/python_prereq) and [run locally](/getting_started/python_run_local/) tutorials.


Notes: 

1) The project containing these 3 apps can be cloned from here: [**post-demo-app**](https://github.com/ONEmCommunications/post-demo-app)
or
```bash
onem@local:~$ git clone https://github.com/ONEmCommunications/post-demo-app
```

2) We will only need to create one virtualenv, containing the packages listed in the requirements.txt file in the project's root folder and this virtual env will be used by all 3 versions of the app.

All 3 versions of the #post application contained in this repo(**postv1**, **v2** & **v3**) are Django apps. Below you can find a few details on the structure of a Django project, its key files and their purpose.

The root folder of a Django project:
```bash
[projectname]/
├── [projectname]/
│   ├── __init__.py
│   ├── settings.py
│   ├── urls.py
│   └── wsgi.py
└── manage.py
```

- the **manage.py** file is the command line utility of the project. This file contains the code for starting the server, migrating and controlling the project through command-line.
- the **settings.py** is the main file where we will be adding all our applications and middleware applications. As the name suggests this is the main settings file of the Django project. This file contains the installed applications and middleware information.
- the **urls.py** file contains the project level URL information. The main purpose of this file is to connect the web-apps with the project. Anything you will be typing in the URL bar will be processed by this urls.py file. Then, it will correspond your request to the designated app you connected to it.

The inner [projectname] folder contains the following files:

```bash
\[projectname]
    \migrations
    __init__.py
    admin.py
    apps.py
    models.py
    tests.py
    views.py
```

For our postv1, v2 and v3 apps it is worth mentioning about:

- the **models.py** file - the model for a `post` enitity is described here. Django models define the structure of stored data. We will be using this in **postv2** and **postv3** to store our posts in a local database.
- the **views.py** file - it is here where most of the code interacting with the ONEm platform and the ONEm SDK will reside. At their simplest, the views are a Python function or class that takes a web request and return a web response. They are used to do things like fetch objects from the database, modify those objects if needed, render forms, return HTML, and much more.
