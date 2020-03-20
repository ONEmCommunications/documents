## Introduction

In this article, I’ll show you how to build an example micro-app from scratch using our simple Node.js SDK. The tutorial assumes a basic knowledge of Node.js.

We’ll retrieve the movie details courtesy of the [free api](https://www.themoviedb.org/documentation/api) provided by http://themoviedb.org (please make sure to abide by their terms)

<img style="height:auto;width:100%" src="/assets/moviedb/backdrop.png"/>

The ONEm platform lets you host your micro-app anywhere on the Internet. For local testing, We’ll use ngrok to provide a publicly accessible URL so that we have a bridge between our app running on localhost and the ONEm Framework.

## Pre-requisites

1. Sign up for a free themoveidb api key [here](https://www.themoviedb.org/documentation/api)
2. Sign up for a free ONEm developer account [here]({{ links.portal }})
3. Install ngrok from [here](https://ngrok.com/)

## Micro-app basics

When a user makes a request from a web-widget or via SMS, the ONEm Framework will invoke an HTTP callback to the micro-app’s web server. The micro-app should respond with HTTP status code 200 and include, in the response body, some JSON which tells the ONEm Framework how to render the response to the user.

Our [Node.js SDK](https://www.npmjs.com/package/onemsdk) provides an abstraction of the JSON format so you don’t have to worry about the details. You have two options, you can use the SDK to produce JSON by passing parameters to the functions provided, or alternatively you can use a templating library and write your micro-app’s views in HTML :) In this tutorial, we’ll be using the second option and specifically [pug](https://pugjs.org/api/getting-started.html) as the templating language, you can use [ejs](https://ejs.co/) instead if you prefer.

Ok, enough chat, let’s get coding!

## Project Structure and Code

!!! info
    The code used in this tutorial can be accessed via the git repository [here](https://github.com/chrishornmem/movie-microapp).


Our project structure will look like this:

```
/
 index.js
 package.json
.env
/app_api
  /routes
    index.js
  /views
    landing.pug
    movieView.pug
/public
  index.html
```

Install Express and the project’s base dependencies:

```
$ npm install express dotenv jwt-simple request-promise url-join
```

We’ll also use the ONEm Framework’s Node.js SDK:

```
$ npm install onemsdk
```

Create an ```index.js``` in the project root with the following content:

```javascript
require('dotenv').config()
const express = require('express')
const api = require('./app_api/routes')

const app = express()
const PORT = process.env.PORT || 3000

app.use(express.json())
app.use(express.static(__dirname + '/public'));
app.use('/api', api)

app.get('/', function (req, res) {
    res.sendFile('/public/index.html', { root: __dirname })
})

app.get('*', function (req, res) {
    res.sendFile('/public/index.html', { root: __dirname })
})

app.get('/*', function (req, res) {
    res.sendFile('/public/index.html', { root: __dirname })
})

app.listen(PORT, () => console.log(`Example micro-app listening on port ${PORT}`))
```

When users make requests from our micro-app, such as selecting a menu option or submitting a form, the ONEm Framework will issue a HTTP request to the micro-app’s callback path. In the index.js we set /api as the ‘basepath’ for all requests coming from the ONEm Framework.

```javascript
app.use('/api', api)
```

When the micro-app is launched for the first time by a user, the ONEm Framework will display the micro-app’s “landing page”. This is a bit like the index.html of a typical web application. The landing page is invoked by the ONEm Framework issuing a request to the micro-app’s API base path, in our case **/api**.

So we’ll want our app to handle a basic call to ```GET /api``` and respond with some initial content that the user will see.

For our example, we’ll create a static menu, so that our users can view three different movies:

<div style="text-align:center">
    <img style="height:425;width:auto" src="/assets/moviedb/widget.png"/>
</div>

When the user clicks on a movie title, we’ll show the movie’s image and description.

First off, let’s create the landing menu options by creating a ```landing.pug``` in the **/views** folder:

```pug
section
  header Movie Menu
  ul
    li
        a(href='/movie/76341/') Mad max
    li
        a(href='/movie/419704/') Ad Astra
    li
        a(href='/movie/454626/') Sonic the Hedgehog
```

And let’s connect the base route in Express in ```/routes/index.js```:

```javascript
const jwt = require('jwt-simple')
const express = require('express')
const request = require('request-promise')
const urlJoin = require('url-join')
const { loadTemplate } = require('onemsdk').parser
const { Response } = require('onemsdk')

const api = express.Router()

// get this by signing up for an account at https://www.themoviedb.org/
const READ_ACCESS_TOKEN = process.env.READ_ACCESS_TOKEN

if (!READ_ACCESS_TOKEN) throw "themoviedb.org READ_ACCESS_TOKEN not found in environment variables"

const moviedbProps = {
    baseUrl: 'https://api.themoviedb.org',
    baseImagePath: 'http://image.tmdb.org/t/p/w185/'
}

const VIEWS_PATH = './app_api/views/'

/*
 *  Here we set the a path to the landing.pug file
 */
const views = {
    VIEW_LANDING: `${VIEWS_PATH}landing.pug`,
    VIEW_MOVIE: `${VIEWS_PATH}movieView.pug`,
}

/*
 * The api's base path is called when users hit our app for the
 * first time.  We'll use the onemsdk to parse the pug file and
 * generate the raw JSON response
 */
api.get('/', async (req, res) => {

    try {
        let rootTag = loadTemplate(views.VIEW_LANDING, {})
        let response = Response.fromTag(rootTag)
        res.json(response.toJSON())
    } catch (e) {
        console.log(e)
        res.status(500).json({ success: false, message: 'server error' })
    }
})

api.get('/movie/:id', async (req, res) => {

    let movieId = req.params.id

    try {
        let data = await request(urlJoin(moviedbProps.baseUrl, `/3/movie/${movieId}`), {
            json: true,
            headers: {
                'Authorization': 'Bearer ' + READ_ACCESS_TOKEN
            }
        })

        if (data.poster_path) {
            data.poster_path = urlJoin(moviedbProps.baseImagePath, data.poster_path)
        }

        let rootTag = loadTemplate(views.VIEW_MOVIE, data)
        let response = Response.fromTag(rootTag)
        res.json(response.toJSON())
    } catch (e) {
        console.log(e)
        res.status(500).json({ success: false, message: 'server error' })
    }
})

module.exports = api
```

```/routes/index.js``` contains a route for the movie view page, when the user clicks on a movie title, the ONEm Framework will issue an ```HTTP GET``` callback to the **href** associated with that option, eg in landing.pug we have the following line:

```pug
a(href='/movie/76341/') Mad max
```

!!! info
    Later in this tutorial, we will tell the ONEm Framework to use the base path of ```/api```, which will eventually translate into ```HTTP GET /api/movie/76341``` when the user selects to view Mad Max.

Ok, so a quick recap. We have created two views using pug. Our web server is ready to accept callbacks from ```/api``` and ```/api/movie/{:id}```.

So what’s remaining now is to complete the setup of our micro-app.

1. Create a ```.env``` file in the project root path:

```
PORT=3000
READ_ACCESS_TOKEN=<themoviedb API Read Access Token (v4 auth)
```

2. We’ll use [ngrok](http://ngrok.com) to give us a publicly accessible url to our micro-app at **localhost:3000**.


```
$ ngrok http 3000
```

Copy the link provided by ngrok, it will be something like ```https://6f1ca0d4.ngrok.io```

3. In the [ONEm Developer Portal]({{ links.portal }}), select *Create App* and set the callback path to your micro-app appending ```/api``` to the base path, eg: ```https://6f1ca0d4.ngrok.io/api```

4. In the [ONEm Developer Portal]({{ links.portal }}), select your new app and then select the *Web channel* tab. Copy/paste the javascript code shown in the tab, into the body section of the ```/public/index.html``` of your Micro-app:

```html
...
<body>
    <h1>Movie micro-app</h1>
    <script src="https://bot.onem.zone/bundle.js"></script>
    <script>
        ONEmStart({ app_id: "<<app_id>>" }).render('body');
    </script>
</body>
```

!!! tip
    This code snippet can be included in any website, if you have access to another website’s ```index.html```, then go ahead and try it.

## Running

Fire up your micro-app:

```bash
$ node index
```

In your browser, visit **localhost:3000** (or where ever your app is configured to listen)

The ONEm micro-app should be visible in bottom right-hand corner. Click the icon to open.

<img style="height:auto;width:100%" src="/assets/moviedb/fullscreen.png"/>

You can also view the SMS client from the [ONEm Developer Portal]({{ links.portal }}) test client. After registering your mobile number, you can test out the SMS interface by entering # followed by your micro-app name in the input box.

<div style="text-align:center">
    <img style="height:auto;width:400px" src="/assets/moviedb/sms-input.png">
</div>

Now head over to [part 2](/guides/moviedb/part2/) where things get a bit more interesting...
