## Verbs

As a ONEm developer, you can implement particular ways for your users to access specific areas of your micro-app. We call these `verbs`.  Verbs are like shortcuts to specific callback paths you define in the Developer Portal.


!!! attention
    There are some [reserved verbs](/core/reserved_verbs/) you cannot use.

## Example

To understand this better, let's take an example:

We have a micro-app named `barbershop`. Our users can:

1. Access it directly by sending `#barbershop` to the ONEm platform.
2. Access a list of appointments by sending `#barbershop appointments`.

For point 2 above to work, we need to define in the Developer Portal a verb named `appointments` and map it to a callback path.

If our callback path looks like `/appointment/list` and the user sends parameters, as mentioned in the third point above, then ONEm platform will launch an `HTTP GET` request with a query string: `/appointment/list`

## Synopsis

Accessing a micro app:

`#app [verb]`

- `verb` is optional
    - if not present an `HTTP GET` request will be made against the 'root' `/app-callback-path` defined in the Developer Portal
    - if a verb is supplied, an `HTTP GET` request will be made against `/verb-callback-path` defined in the Developer Portal

