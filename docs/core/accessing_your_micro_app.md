Ok, so we've mentioned that your app is identified by the name you give it and it can be accessed through the ONEm platform by prefixing it with a hashtag. This is the general way to access your micro app.

## Verbs and parameters

As a ONEm developer, you can implement particular ways for your users to access specific areas of your micro-app. We call these `verbs` and, in a nutshell, they are shortcuts to specific callback paths you define in the developer portal.

Also, `parameters` can be sent to the `verbs` so even more specific areas can be accessed.

<span style="font-size:13px;"><i>There are some [reserved verbs](/core/reserved_verbs/) you cannot use</i></span>

## Example

To understand this better, let's take an example:

We have a micro-app named `barbershop`. Our users can:

1. Access it directly by sending `#barbershop` to the ONEm platform.
2. Access a list of appointments by sending `#barbershop appointments`.
3. Access a list of narrowed down appointments by sending `#barbershop appointments today`.

For points 2 and 3 above to work, we need to define in the developer portal a verb named `appointments` and map it to a callback path.

If our callback path looks like `/appointment/list` and the user sends parameters, as mentioned in the third point above, then ONEm platform will launch an `HTTP GET` request with a query string: `/appointment/list?params=today`

## Synopsis

Accessing a micro app:

`#app [verb] [parameters]`

- `verb` is optional
    - if not present an `HTTP GET` request will be made against `/app-callback-path` defined in the developer portal
    - if present an `HTTP GET` request will be made against `/verb-callback-path` defined in the developer portal
- `parameters` is optional and if present will be sent url encoded to the relative callback url path: `/app-or-verb-callback-path/?params=parameters`
