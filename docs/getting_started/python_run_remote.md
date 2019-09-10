To run the application remotely we will have to deploy our webserver on a publicly accessible machine.

There are multiple ways to do that:

- [Nginx](https://nginx.org/) with [Gunicorn](https://gunicorn.org/) and [Supervisor](http://supervisord.org/)
- [Apache](https://httpd.apache.org/) and [mod_wsgi](https://modwsgi.readthedocs.io/en/develop/)
- etc ...

However, the easiest way is to use Heroku. Just head over to [Github]({{ todo_app.github_py_url }}), fork the project and hit the Deploy to Heroku button.

You will first have to register for a free [Heroku](https://www.heroku.com/) account.
