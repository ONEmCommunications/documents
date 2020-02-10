## Running your app in production

### Choose a hosting platform

Your app will need to be hosted on the internet so that ONEm's platform can access it.  Choose a hosting provider.  

Hosting provider requirements:

* <mark>Public static IP or a permanent DNS host name</mark>
* Optional - access to local or cloud database services such as <a href="https://www.postgresql.org/" target="_blank">PostgreSQL</a>or <a href="https://www.mongodb.com/" target="_blank">MongoDB</a>

In general, ONEm apps can be hosted on any platform, it's entirely up to you which provider you use.

Some popular providers you might consider:

* <a href="https://www.heroku.com/" target="_blank">Heroku</a>
* <a href="www.digitalocean.com/" target="_blank">DigitalOcean</a>
* <a href="https://aws.amazon.com/websites/" target="_blank">Amazon Web Services (AWS)</a>
* <a href="azure.microsoft.com/Account/Free‎" target="_blank">Microsoft Azure</a>

### Install and deploy your app on production

Make sure your app is deployed and running on your favourite provider.  For example to deploy on heroku you would use:

```bash
$ heroku create
$ git push heroku master
```

<mark>Make a note of the IP address or fully qualified URL of your application from your provider together with the port.</mark>  For example with heroku, it might be something like: `https://example.herokuapp.com:8080` or with DigitalOcean it might be `http://63.x.y.z:8080`

### Register the app with ONEm Production Portal

You will need to edit your *App details* and update the *user_action* URL field, provide the fully qualified URL of your application's base API path. You can access your account <a href="{{links.portal}}" target="_blank">here</a>.

<mark>Remember to add the `/api` to your url so the ONEm platform can reach to your service.</mark>

### Verifying on production

Head over to our production verification site <a href="https://onem.zone" target="_blank">onem.zone</a> and verify that your app is responding as expected.  If you haven't already signed up you will need to have <mark>a mobile</mark> ands register using a google or facebook account.