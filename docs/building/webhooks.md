# Webhooks

App webhooks enable you to receive notifications when certain events happen.  Webhook notifications are sent as HTTP POST requests to a URL of your choosing. To integrate with webhooks, you need to implement a server endpoint that receives and handles these requests.

As a minimum, when you register your app on the [ONEm Developer Portal]({{ links.portal }}), you will need to define a *user_action* webhook so that your app can receive notifications whenever your users perform actions that your app must handle.

Currently, the *user_action* webhook is triggered when your users:

* Select a menu option
* Send a pre-defined *verb*
* Submit a form

In the future, more webhooks will be added, so stay tuned.
