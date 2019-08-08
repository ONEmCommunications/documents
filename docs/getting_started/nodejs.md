<!-- Inline <img src="/assets/nodejs-new-pantone-black.png" width=50> With Reference Link -->
## Introduction
This tutorial will have you deploying a Node.js app to ONEm in minutes.

In this tutorial items marked in <mark>yellow</mark> are essential and should be noted for completing certain processes.

The tutorial assumes that you have a free or paid [ONEm account]({{links.portal}}), and that you have the following prerequisites installed locally:

* <a href="https://nodejs.org/" target="_blank" rel="noopener noreferrer">Node.js</a>
* npm which is installed with Node.js
* <a href="https://github.com/" target="_blank" rel="noopener noreferrer">git</a>
* <a href="https://ngrok.com/download" target="_blank" rel="noopener noreferrer">ngrok</a>
* <a href="https://code.visualstudio.com/" target="_blank" rel="noopener noreferrer">Visual Studio Code</a>

## Set up on localhost

To start with, we will be running all commands locally on your own PC.  Your app will initially be hosted there for local development, then later you will learn how to host your app with a hosting provider for use on production.

Before you continue, check that you have the prerequisites installed properly. Type each command below and make sure it displays the version you have installed. Your versions might differ from the example. If an error is returned, go back check the installation before continuing.

This tutorial will work for any version of Node greater than 8 - check that it’s there:

```bash
$ node --version
v10.15.3
```

npm is installed with Node, so check that it’s there. If you don’t have it, install a more recent version of Node:

```bash
$ npm --version
6.9.0
```
Now check that you have git installed:

```bash
$ git --version
git version 2.15.1
```

We will use *ngrok* to provide a secure tunnel between your app running on *localhost* and the ONEm servers. Check it's installed:

```bash
$ ./ngrok --version
ngrok version 2.3.29
```

## Prepare the app

In this step, you will prepare a simple *Hello World* application.  To clone a local version of the sample application, execute the following command in your local command shell or terminal:

```bash
$ git clone https://github.com/chrishornmem/hello-world.git && cd hello-world
```

You now have a functioning git repository that contains the *Hello World* application as well as a `package.json` file, which is used by npm (Node’s dependency manager).

Install the package dependencies with npm:

```bash
$ npm install
```

## Configure the app

The *Hello World* example application listens on the HTTP port defined by the environment variable `PORT` or 8080 by default.  You can change the port by creating a `.env` file in your app's root directory and specifying the desired port value:

### Port
```
PORT=8080
```

### Token secret

Webhooks triggered by the ONEm platform contain a JWT token in the authorzation header.  The JWT token carries the unique identity of the ONEm user so that your app can differentiate requests from different users.  In order to verify jwt tokens that are sent by the ONEm platform, the token secret should be configured.  For the sandbox, this secret is `87654321`.  Configure the secret in the `.env` file:

```
TOKEN_SECRET=87654321
```

## Run the app

Start the app with:

```bash
$ npm run start
```

You should see output similar to the following in the console:

```
Listening on port 8080
```

Now run ngrok so that your app is visible to the ONEm servers.

```
$ ./ngrok http 8080
```

ngrok will launch a continuous display to the console.  Make a note of the http or https forwarding address.  In the example below the address is `http://6e3f3fce.ngrok.io`:

```
Forwarding                    http://6e3f3fce.ngrok.io -> http://localhost:8080
```

Navigate to the forwarding link on your browser and you should see a *Hello World* greeting.

The *Hello World* example app expects to receive HTTP requests as users perform certain actions.  We call this the *user_action* [webhook](../building/webhooks.md). The app expects to receive user action notifications on the base path: `/api`.  The ONEm platform will need to be configured with the fully qualified URL of this endpoint, including the base path.  In our example above, the *user_action* webhook URL would be `http://6e3f3fce.ngrok.io/api`

<mark>Make a note of your *user_action* URL, you will need it in the next step.</mark>

## Register the app with ONEm Sandbox Portal

If you have not already done so, sign-up for a <a href="{{links.portal}}" target="_blank" rel="noopener noreferrer">free ONEm developer account</a> on the sandbox.

Register your app on the ONEm Sandbox Portal.  You will need to provide:

1. A unique one-word name for your app, e.g *hello*
2. A description of your app
3. A link to your website
4. The *user_action* URL you obtained from the previous step

Don't worry about the other app details at this stage (verbs, permissions), we will use them later in the advanced tutorials.

Make sure the details are saved correctly in the portal.


## Test the app

Head over to our <a href="https://poc.onem.zone" target="_blank" rel="noopener noreferrer">sandbox test tool</a>, we call it *ONEm Zone*.  Sign-up and then in the input field, enter `#` followed by your app's name, for example `#HELLO` if your app is called *hello*.

If you have completed everything correctly, the ONEm system should respond with a menu, similar to the below:

```
#HELLO WORLD
A First option
B Second option
C Third option
--Reply A-C
```

If you see the above, congratulations, you have successfully installed your first app.  Give yourself a pat on the back and then head over to the advanced tutorials to get to know ONEm better.

If you don't see the above done worry, go back and check that each step has been followed properly and your program will soon be up and running.

## Running your app in production

### Choose a hosting platform

Your app will need to be hosted on the internet so that ONEm's platform can access it.  Choose a hosting provider.  

Hosting provider requirements:

* <mark>Public static IP or a permanent DNS host name</mark>
* Optional - access to local or cloud database services such as <a href="https://www.postgresql.org/" target="_blank" rel="noopener noreferrer">PostgreSQL</a>or <a href="https://www.mongodb.com/" target="_blank" rel="noopener noreferrer">MongoDB</a>

In general, ONEm apps can be hosted on any platform, it's entirely up to you which provider you use.

Some popular providers you might consider:

* <a href="https://www.heroku.com/" target="_blank" rel="noopener noreferrer">Heroku</a>
* <a href="www.digitalocean.com/" target="_blank" rel="noopener noreferrer">DigitalOcean</a>
* <a href="https://aws.amazon.com/websites/" target="_blank" rel="noopener noreferrer">Amazon Web Services (AWS)</a>
* <a href="azure.microsoft.com/Account/Free‎" target="_blank" rel="noopener noreferrer">Microsoft Azure</a>

### Install and deploy your app on production

Make sure your app is deployed and running on your favourite provider.  For example to deploy on heroku you would use:

```bash
$ heroku create
$ git push heroku master
```

<mark>Make a note of the IP address or fully qualified URL of your application from your provider together with the port.</mark>  For example with heroku, it might be something like: `https://example.herokuapp.com:8080` or with DigitalOcean it might be `http://63.x.y.z:8080`

### Register the app with ONEm Production Portal

You will need to edit your *App details* and update the *user_action* URL field, provide the fully qualified URL of your application's base API path. You can access your account <a href="{{links.portal}}" target="_blank" rel="noopener noreferrer">here</a>.

<mark>Remember to add `/api` to your url so the ONEm platform can reach to your app.</mark>

### Verifying on production

Head over to our production verification site <a href="https://onem.zone" target="_blank">onem.zone</a> and verify that your app is responding as expected.  If you haven't already signed up you will need to have <mark>a mobile</mark> ands register using a google or facebook account.
