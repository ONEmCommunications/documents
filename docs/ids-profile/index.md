Identify is an important feature of any successful microapp.  ONEm Framework makes it easy for you to identify, authenticate and manage your user state within your application.  In addition, we provide a limited set of user profile data allowing you to provide a more personalized look and feel to your microapp.

## Authorization Token

When you created your microapp in the [ONEm Developer Portal]({{ links.portal }}), you will have specified a callback path for your app to receive requests originating from users.

All requests made to the callback path contain an [JWT token](https://tools.ietf.org/html/rfc7519) in the Authorization header, for example:

```
  'Authorization':'Bearer {access-token}'
```

Your microapp can decode this token using freely available open source software to obtain details about the user and the session.

The table below details the fields that maybe included in the decoded token.

<span style="font-size:13px;">_All fields prefixed with a star (*) are always provided</span>


| KEY | TYPE | NOTES |
|-----|------|-------|
|*iss|string|The issuer of the token this will be set to `https://www.onem.com`|
|*sub|string|An id which you can use to uniquely identify the user in the ONEM ecosystem|
|*iat|number|Issued At Timestamp according to RFC7519|
|*exp|number|Token expiry timestamp according to RFC7519|
|email|string|User's email address|
|email_verified|boolean|Indicates if the email address has been verififed|
|name|string|User's full name|
|given_name|string|User's first name|
|family_name|string|User's family name|
|picture|string|Fully qualified path to the the user's avatar image|
|locale|string|User's language and country in the format `ll-CC` where `ll` is according to ISO-632-2 and `CC` confirming to ISO-3166|
|is_authenticated|boolean|Indicates if the user's session has been authenticated|
|is_authentication_supported|boolean|Indicates if user's channel supports authentication|
|is_admin|boolean|Indicates if the user making the request can be identified as the app owner|

##Example

```javascript
{
    "iss": "https://www.onem.com",
    "sub": "5e5f9effd61017bb849a59c2",
    "email": "joe.bloggs@gmail.com",
    "email_verified": true,
    "name": "Joe Bloggs",
    "picture": "https://lh3.googleusercontent.com/a-/AOh14GgFZDsMdRt3noADQ1k4Ra0GPCMF7DC_WAvGC2P40w=s96-d",
    "given_name": "Joe",
    "family_name": "Bloggs",
    "locale": "en-GB",
    "iat": 1583396235,
    "exp": 1584605835,
    "is_authenticated": true,
    "is_authentication_supported": true,
    "is_admin": false
}
```
