## Running your app in production

### Choose a hosting platform

Your app will need to be hosted on the Internet so that the ONEm Platform can access it.  Choose a hosting provider.  

Hosting provider requirements:

* Public static IP or a permanent DNS host name
* Optional - access to local or cloud database services such as <a href="https://www.postgresql.org/" target="_blank">PostgreSQL</a>or <a href="https://www.mongodb.com/" target="_blank">MongoDB</a>

In general, ONEm apps can be hosted on any platform, it's entirely up to you which provider you use.

Some popular providers you might consider:

* <a href="https://www.heroku.com/" target="_blank">Heroku</a>
* <a href="www.digitalocean.com/" target="_blank">DigitalOcean</a>
* <a href="https://aws.amazon.com/websites/" target="_blank">Amazon Web Services (AWS)</a>
* <a href="azure.microsoft.com/Account/Free‎" target="_blank">Microsoft Azure</a>

### Install and deploy your app in production

Make sure your app is deployed and running on your favourite provider.  For example to deploy on Heroku you would use:

```bash
$ heroku create
$ git push heroku master
```

Make a note of the IP address or fully qualified URL of your application from your provider together with the port.  For example with Heroku, it might be something like: `https://hello-world.herokuapp.com` or with DigitalOcean it might be `http://63.x.y.z:8080`

### Register the app with ONEm Developer Portal

You will need to edit your *App details* and update the *Callback URL* field, provide the fully qualified URL of your application's base API path. You can access your account <a href="{{links.portal}}" target="_blank">here</a>.

### Verifying on production

In the Developer Portal, click on the *Test Client* tab and verify that your app is responding as expected by sending ```#<app name>```.