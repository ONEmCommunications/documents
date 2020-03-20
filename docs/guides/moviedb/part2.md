## Introduction

This is part 2 of a series of guides walking you through the development of an interactive micro-app that can be easily deployed a website or even accessed via SMS.

If you missed [part 1](/guides/moviedb/part1/), then please go back and read that one article first :) You can find it [here](/guides/moviedb/part1/).

In [part 1](/guides/moviedb/part1/), we created a simple micro-app that, allowed the user to view three movie titles. However, unless you only wanted to list those three movies, the micro app wasn’t much good :)

<div style="text-align:center">
    <img style="height:425px;width:auto" src="/assets/moviedb/widget.png"/>
</div>

In this article, I’ll show you how to extend the functionality to allow the user to search for a movie and list the results.

All the code for this can be found on [Github](https://github.com/chrishornmem/movie-microapp). We’ve named the branches “part1”, and “part2” so you can see what changed where.

First, off we’ll change the landing page, so that we’ll ask the user for a search query when they launch the app, like so:

<div style="text-align:center">
    <img style="height:425px;width:auto" src="/assets/moviedb/searchlanding.png"/>
</div>

## Creating a form

So if we're going to capture input, we need a form. So let’s go ahead and update our ```landing.pug``` file in the ```/app_api/views folder```:

We use the [form tag](/building/html-tags/#ltformgt), just like in any web form and use the action and method attributes to associate a route to our backend. When the user submits the form, the ONEm Framework will issue an ```HTTP GET /api/movies/search```.

```pug
form(action="/movies/search", skip-confirmation, method="get")
    section(name="query_text" required)
        header query text
        p Search for a movie using themoviedb.org
        input(type="text")
```

Few things to note about forms.

1. Each form must contain at least one section tag. Each section describes an element of the form together with an input tag as a child. Many form types are supported, you can find the full list of supported types here. We’re just using the basic type of text for our example.

2. A form field can be marked as required so that the user is forced to provide a value, we’ve used the required property in our form in the section tag.

3. When the user submits the form, the request body will contain the field name and value as an object, like this:

```json
{
  "query_text": "mad max"
}
```

Ok, so now we’ve created our form, we need to create an associated route for it in the backend. We’ll take the user’s ```query_text``` and then hit [the moviedb API](https://www.themoviedb.org/documentation/api) to get a list of movies matching our search. Then we’ll send the list back to the user in the form of an item list of movies:

```javascript
api.get('/movies/search', async (req, res) => {

    const query_text = req.body.query_text

    try {
        let data = await searchMovie(query_text)
        let rootTag = loadTemplate(views.VIEW_MOVIE_LIST, { movies: data })
        let response = Response.fromTag(rootTag)
        res.json(response.toJSON())
    } catch (e) {
        console.log(e)
        res.status(500).json({ success: false, message: 'server error' })
    }
})
```

!!! note
    We’ve moved all [themoviedb.org api](https://www.themoviedb.org/documentation/api) calls to a separate module in ```/app_api/movieApi/index.js``` just to keep things clean.

## Presenting the results

In the following line, we compile the movie list view by passing the search results to the template. So after calling *searchMovie*, we’ll pass in the results contained in the *data* variable:

```javascript
let rootTag = loadTemplate(views.VIEW_MOVIE_LIST, { movies: data })
```

The response back to the user containing the search results will look like this:

<div style="text-align:center">
    <img style="height:425px;width:auto" src="/assets/moviedb/searchresults.png"/>
</div>

We’ll need to create the view for that screen as well.

So our views object in ```/app_api/routes/index.js``` will need to reference the new search results [pug](https://pugjs.org/api/getting-started.html) template:

```javascript
const views = {
   ...
   VIEW_MOVIE_LIST: `${VIEWS_PATH}movieList.pug`,
}
```

And here’s the ```movieList.pug``` that will handle the display of the menu to the user:

```pug
section
  header Movies
  img(src="https://www.themoviedb.org/assets/2/v4/logos/408x161-powered-by-rectangle-green-bb4301c10ddc749b4e79463811a68afebeae66ef43d17bcfd8ff0e60ded7ce99.png" alt="powered by themoviedb.org")
  if movies.length
    ul
      each movie in movies
        li
          a(href='/movie/'+movie.id) #{movie.original_title}
  else
    ul
      li No results found
      li
        a(href="/") Search again
```

!!! note
    Take care here that we’re also checking here in the view if we actually have any search results to display. If movies.length is zero (false), then we’ll give a *No results found* message instead.

    We could have checked for the empty movie list within the actual code of the request handler instead of the pug (and gave a different response entirely), this is a matter of personal preference. I’ve kept it this way to keep the example simple.

When the user selects a movie, the ONEm Framework will call the movie’s associated route as indicated by this line in ```movieList.pug```:

```pug
a(href='/movie/'+movie.id) #{movie.original_title}
```

In this case, the ONEm Framework will issue an ```HTTP GET``` to eg ```/movie/1234```.

The good news is we already created the view for that page in [part 1](/guides/moviedb/part1/) of this tutorial. We’ve just renamed the button from *Main Menu* to *Search again*.

<div style="text-align:center">
    <img style="height:425px;width:auto" src="/assets/moviedb/movieview.png"/>
</div>

Don’t forget that as you’ve been coding along, you’ve also been creating an application that is capable of running over SMS with exactly the same code.

<div style="text-align:center">
    <img style="height:425px;width:auto" src="/assets/moviedb/sms2.png"/>
</div>

Go ahead and give the SMS interface a try using the Test Client tab of the [ONEm Developer Portal]({{ links.portal }}).

That’s it for part2.




