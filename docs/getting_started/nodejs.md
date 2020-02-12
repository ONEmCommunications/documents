# Getting Started with Node.js

<!-- 1. Create a free [ONEm Developer Account](https://developer-portal.onem.zone/login) which requires a [Github](https://github.com/) account to login
1. Create a micro-app
<img src="/assets/create_app.jpg" width=350 style="float:right;margin-right:15px;" />

1. Setup app and user profile   
1. Clone a [Github](https://github.com/onem-developer) node.js template
1. To host your app use either [Heroku](https://heroku.com/) (online) or [ngrok](https://ngrok.com/) (local)

### Node.js templates contain

1. Node.js app folder
1. [Express](https://expressjs.com/en/starter/installing.html)
1. [PUG](https://pugjs.org/api/getting-started.html)
1. [onemsdk@latest](https://www.npmjs.com/package/onemsdk)
1. `.env` and `config.js` for port and other settings -->

<!-- Inline <img src="/assets/nodejs-new-pantone-black.png" width=50> With Reference Link -->
## Introduction
This tutorial will have you deploying a Node.js app in minutes.

The tutorial assumes that you have a free or paid [ONEm account]({{links.portal}}), and that you have the following prerequisites installed locally:

* <a href="https://nodejs.org/" target="_blank">Node.js</a>
* npm which is installed with Node.js
* <a href="https://github.com/" target="_blank">git</a>
* <a href="https://ngrok.com/download" target="_blank">ngrok</a>
* Code editor/IDE such as <a href="https://code.visualstudio.com/" target="_blank">Visual Studio Code</a>

## Set up on localhost

To start with, we will be running all commands locally on your own PC.  Your app will initially be hosted there for local development, then later you will learn how to host your app using a cloud provider such as <a href="https://https://devcenter.heroku.com/articles/getting-started-with-nodejs/" target="_blank">Heroku</a> for use on production.

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

### Port

The *Hello World* example application listens on the HTTP port defined by the environment variable `PORT` or 8080 by default.  You can change the port by creating a `.env` file in your app's root directory and specifying the desired port value, like this:

```
PORT=8080
```

### Token secret

Callbacks triggered by the ONEm platform contain a [jwt token](https://tools.ietf.org/html/rfc7519) in the authorzation header.  The jwt token carries the unique identity of the ONEm user so that your app can differentiate requests from different users.  In order to verify jwt tokens that are sent by the ONEm platform, the token secret should be configured.  For test purposes you may use the secret is *87654321*.  Configure the secret in the `.env` file:

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

Now run ngrok to create a secure tunnel to your local computer so that your app is visible to the ONEm servers.

```
$ ngrok http 8080
```

ngrok will launch a continuous display to the console.  Make a note of the HTTP or HTTPS forwarding address.  In the example below the address is `http://6e3f3fce.ngrok.io`:

```
Forwarding        http://6e3f3fce.ngrok.io -> http://localhost:8080
```

Navigate to the forwarding link in your browser and you should see a *Hello World* greeting.

The *Hello World* example app expects to receive HTTP requests as users perform certain actions.  We call these callback notifications. The *Hello World* example app expects to receive callback notifications on the base path: `/api`.  The ONEm platform will need to be configured with the fully qualified URL of this endpoint, including the base path.  In our example above, the *callback url* would be `http://6e3f3fce.ngrok.io/api`.  We shall configure this callback url in the next step.

!!! tip
    Make a note of your *callback url*, you will need it in the next step.

## Register the app with Developer Portal

If you have not already done so, sign-up for a <a href="{{links.portal}}" target="_blank">free ONEm developer account</a>.

Register your app on the [ONEm Developer Portal]({{ links.portal }}) by selecting the *Create app* option.  You will need to provide:

1. A short description of your app
1. The app category, just select "Business"
1. The *callback url* you obtained from the previous step

Make sure the details are saved correctly in the portal.

!!! info
    Don't worry about the other app details at this stage (verbs, permissions), we will use them later in the advanced tutorials.

## Test the app

In the [ONEm Developer Portal]({{ links.portal }}), select the *Test Client* tab and register your mobile number. Then in the input field, enter `#` followed by your app's name, for example `#HELLO.WORLD` if your app is called *hello.world*.

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


