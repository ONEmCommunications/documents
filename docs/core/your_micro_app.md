Head over to the [ONEm Developer Portal]({{ links.portal }}) and create your account. Once you have an account, go to **Applications** section and create your app.

Your app is identified by the name you give it and it can be accessed through the ONEm platform by prefixing it with a hashtag.

As a ONEm developer, after you create and register your application on the developer portal you should follow the necessary steps to configure it to return standardised JSON responses upon ONEm requests. These requests are launched by the ONEm platform on behalf of your users.

When your app is being accessed by the user, ONEm platform is performing an **HTTP GET** request to the **callback_url** defined in the [ONEm Developer Portal]({{ links.portal }}).

This must return a JSON http response and will be used by ONEm platform to compute an sms and send it to the user as a response from your app.
