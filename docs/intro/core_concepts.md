# Core concepts

Let's start with the basics.
Follow along the steps to ramp up or watch as we create a working Todo application.
<!-- video here on how to create an app -->

## Developer Account

Head over to the [developer portal](http://developer-portal-poc.onem.zone) and create your account. Once you have an account, go to **Applications** section and create your app.
<!-- tutorial? -->
As a ONEm developer, after you create and register your application on the developer portal you should follow the necessary steps to configure it to return standardised JSON responses upon ONEm requests. These requests are launched by the ONEm platform on behalf of your users.
<!-- Link to Building section, how to register an application  -->

## Your app

Your app is identified by the name you give it and it can be accessed through the ONEm platform by prefixing it with a hashtag.
When your app is being accessed by the user, ONEm platform is performing an **HTTP GET** request to the **callback_url** defined in the developer portal.
This must return a JSON http response and will be used by ONEm platform to compute an sms and send it to the user as a response from your app.
<!-- Link to Building section, how to structure an application  -->

## SDK
<!-- TBD short description and purpose -->
<!-- Link to Building section, SDK  -->

## Framework
<!-- TBD short description and purpose -->
<!-- Link to Building section, Framework  -->

## API
<!-- TBD short description and purpose -->
<!-- Link to API section  -->

