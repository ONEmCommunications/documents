The below diagram presents the high level overview of the ONEm Framework.


### Diagram

<div>
    <img src="/assets/onem_framework.jpg" />
</div>


So basically what happens is the follwing:

1. The user sends some sms to the ONEm platform number.
2. ONEm platform figures out there is a request for your micro app and performs an HTTP request towards the micro app web server. Certain information about this request is placed in the HTTP request headers.
3. The micro app webserver is responsible to return an HTTP json* response. At this point the micro app can query the ONEm API to fetch various data.
4. Once the ONEm platform receives the HTTP json response, it builds an sms based on it and sends it back to the user.

_* although the json response can be built however one sees fit, based on the ONEm [response](/building/response/) definition, it is highly recommended to use the official [ONEm SDK](/building/about_sdk/) to build the json response_

### Example

1. The user sends `#todo` to the ONEm platform number.
2. ONEm platform receives the sms and performs an HTTP GET request towards the callback path set in the developer portal.
3. The `todo` webserver handles the GET request and returns an HTTP json response.
4. ONEm platform takes the JSON and builds an sms. Finally the sms is sent back to the user.

This is similar to what is described [here](/getting_started/python_run_local/#run-it)

Then its a repeat phase:

1. The user sends `a` to select the first [menu item](/building/menu/#menuitem)
2. ONEm platform receives the sms and performs an HTTP request towards the callback path assigned to the first menu item.
3. The `todo` webserver handles the HTTP request and returns an HTTP json response. This json might indicate another [menu](/building/menu/) or a [form](/building/form/).
4. ONEm platform takes the JSON and builds the sms response to the request launched by the user at the first step of the cycle.
