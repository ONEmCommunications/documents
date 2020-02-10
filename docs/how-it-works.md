# How it works

For those completely new to ONEm app development, it can be helpful to get a high-level understanding of the core philosophy, concepts and capabilities. Before diving in, we'll cover the basics of the ONEm Framework, and how it works.

A micro-app is a web server, hosted anywhere on the Internet, which receives HTTP(S) requests triggered upon requests from end-users and forwarded by the ONEm Platform.  The micro-app is responsible for handling each request and generating a timely HTTP response according to ONEm's [OpenAPI JSON specification]({{ links.schema_url }}).

<figure style="text-align:center">
    <img src="/assets/onem_platform_diagram.png"/>
  <figcaption>ONEm Platform Overview</figcaption>
</figure>

!!! tip
    Take care that each incoming HTTP request must have a matching HTTP response.  If you do not provide a response, the user's request will timeout and the ONEm Framework will generate an error.

So that you don't have to be too concerned about the JSON format, we provide a number of SDKs in various languages that produce correctly formatted JSON for you to send back in your response.

No matter what language you are developing in, the SDK will provide you with two ways of creating user interfaces by:

- Pure programming
- HTML based templates (see [supported HTML tags](/building/html)). We support several templating engines depending on the language variant:
    - NodeJS SDK:
        - [Pug](https://pugjs.org/api/getting-started.html)
        - [Ejs](https://ejs.co/#install)
    - Python SDK:
        - [Jinja](https://palletsprojects.com/p/jinja/)

Now, head over to the [Getting started](/getting-started) section to start building the example Hello World application.
