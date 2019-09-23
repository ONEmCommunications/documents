For a quick start, try one of our demo applications.
To run the application remotely you will have to deploy the webserver on a publicly accessible machine.

There are multiple ways to do that:

- [Nginx](https://nginx.org/) with [Gunicorn](https://gunicorn.org/) and [Supervisor](http://supervisord.org/)
- [Apache](https://httpd.apache.org/) and [mod_wsgi](https://modwsgi.readthedocs.io/en/develop/)
- etc ...

However, the easiest way we chose to do this, is using Heroku. This is what you need to do:

- Register for a free [Heroku](https://www.heroku.com/) account
- Head over to our [Github]({{ todo_app.github_py_url }}) repo, according to your preferred programming language   
- Fork the project 
- Hit the `Deploy to Heroku` button and follow the steps
- Create an application in [Developer portal]({{ links.portal }}) and make sure you add the application link from Heroku in the Callback URL field

Done!

Go to Test Client section and access your application using `#app_name`.
