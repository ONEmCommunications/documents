You will need to register your app on the developer portal and make it return standardized JSON responses upon ONEm requests. These requests are launched by the ONEm platform on behalf of your users.

## Developer Account

Head over to the [ONEm Developer Portal]({{ links.portal }}) and create your account. Once you have an account, go to **Applications** section and create your app.


## Your app

Your app is identified by the name you give it and it can be accessed through the ONEm platform by prefixing it with a hashtag. So if your app name is **todo** then users will be able to access it by sending an SMS with **#todo** content.


## Request & Response

When your app is being accessed by the user, ONEm platform is performing an **HTTP GET** request to the **callback_url** defined in the [ONEm Developer Portal]({{ links.portal }}).
This must return a JSON http response and will be used by ONEm platform to compute an sms and send it to the user as a response from your app.

Your app can reply with a [menu](/building/menus/), a [form](/building/forms/) or a [raw](/building/raw/) response type.
