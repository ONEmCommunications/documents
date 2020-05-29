## **&lt;a&gt;**
It is used for redirection to other locations.

<h4>Constraints</h4>
- cannot be empty
- allowed children: text, `<img>`, `<video>`

<h4>Attributes</h4>
- `href` (string) - a path in your app to redirect the user to
- `method` (string) - the HTTP method used for redirection. Possible values:
"POST", "GET", "PATCH", "PUT", "DELETE"

<h4>Example</h4>
```html
<section>
  <ul>
    <li>
      <a href="/menu" method="GET">Main menu</a>
    </li>
  </ul>
</section>
```

## **&lt;br&gt;**

Renders a new line.

<h4>Constraints</h4>
- allowed children: no

<h4>Example</h4>
```html
<section>
  ...
  <br/>
  ...
</section>
```

## **&lt;Card&gt;**

Top level tag used to describe a card within a section.

<h4>Constraints</h4>
- not supported as children of `<form>` tags
- allowed children: `<CardActions>`, `<CardContent>`, `<CardHeader>`, `<CardMedia>` 

<h4>Attributes</h4>
- `action` (string) - a path in your app to redirect the user when if the top level card element is selected
- `action-label` (string) - Menu label used in SMS channels to indicate to the user that this card can be selected, default is "Select"
- `method` (string) - the HTTP method used for redirection. Possible values:
"POST", "GET", "PATCH", "PUT", "DELETE"

<h4>Example</h4>

```html
<section>
  <Card>
    <CardHeader title="Our new product line" subtitle="2 hours ago">
      <CardAvatar src="https://example.com/image.png" name="John Smith"></CardAvatar>
    </CardHeader>
    <CardMedia src="https://i.ibb.co/GMX8Q6v/motorbike.png"></CardMedia>
    <CardContent title="Our new product line" content="A motorcycle, often called a motorbike, bike, or cycle, is a two- or three-wheel..."></CardContent>
    <CardActions>
      <CardAction name="Read more" method="post" path="/readmore"></CardAction>
      <CardAction name="Like (1)" method="put" path="/like"></CardAction>
    </CardActions>
  </Card>
</section>
```

## **&lt;CardAction&gt;**

Describes a card action option within a `<Card>`.

<h4>Constraints</h4>
- must be a child of `<CardActions>`
- allowed children: none

<h4>Attributes</h4>

- `method` (string) - the HTTP method used for redirection. Possible values:
- `name` (string) - Name/label of the action button
- `path` (string) - Callback path to use when the action is selected by the user
"POST", "GET", "PATCH", "PUT", "DELETE"


<h4>Example</h4>

See [`<Card>`](#card)


## **&lt;CardActions&gt;**

Container tag used to hold one or more [`<CardAction>`](#cardaction) tags.

<h4>Constraints</h4>
- must be a child of `<Card>`
- can only be one `<CardActions>` in each `<Card>`
- allowed children: `<CardAction>` 

<h4>Attributes</h4>

None

<h4>Example</h4>

See [`<Card>`](#card)


## **&lt;CardAvatar&gt;**

Describes a user avatar within a `<CardHeader>`.

<h4>Constraints</h4>
- must be a child of `<CardHeader>`
- allowed children: none

<h4>Attributes</h4>

- `name` (string) - Name of the user
- `src` (string) - Url to public accessible image for the avatar

<h4>Example</h4>

See [`<Card>`](#card)


## **&lt;CardContent&gt;**

Used to describe a card content within a card.

<h4>Constraints</h4>
- must be a child of `<Card>`
- can only be one `<CardContent>` in each `<Card>`
- allowed children: none

<h4>Attributes</h4>
- `content` (string) - Content text to be displayed usually appearing underneath the card subtitle
- `subtitle` (string) - Subtitle text usually appearing underneath the card title
- `title` (string) required - Title usually appearing underneath the card media or card header

<h4>Example</h4>
See [`<Card>`](#card)

## **&lt;CardHeader&gt;**

Used to describe a card header within a card.

<h4>Constraints</h4>
- must be a child of `<Card>`
- can only be one `<CardHeader>` in each `<Card>`
- allowed children: `<CardAvatar>` 

<h4>Attributes</h4>
- `subtitle` (string) - Subtitle text usually appearing underneath the card title within the header
- `title` (string) required - Content of the card title within the header

<h4>Example</h4>

See [`<Card>`](#card)



## **&lt;footer&gt;**

Declares the footer of a message. It overwrites the footer attribute from `<section>`. It
should be relative short line of text and it is shown in the last chunk of a message,
preceded by `--`.

<h4>Constraints</h4>
- cannot be empty
- allowed children: text
- if used, it must be the last child of a `<section>` tag

<h4>Example</h4>

```html
<section>
  ...
  <footer>Reply A-D</footer>
</section>
```

## **&lt;form&gt;**

The `<form>` tag is used to capture user input.

<h4>Constraints</h4>
- cannot be empty
- allowed children: `<section>`

<h4>Attributes</h4>

- `action` (string) - a path in the app where the result of the form is sent
- `method` (string) - the HTTP method used for sending the result of the form.
Allowed values: `POST`, `GET`, `PATCH`, `PUT`.
- `header` (string) - the header displayed in all the form's items that do not
declare a header
- `footer` (string) - the footer displayed in all the form's items that do not
declare a footer
<!-- - `completion-status-show` (boolean) - whether to show the user's progress
within the form
- `completion-status-in-header` (boolean) - if `true`, show the user's
progress in header, otherwise in body; ignored if `completion-status-show` is
false. -->
- `skip-confirmation` (boolean) - If `true` will not ask for confirmation, depending on the user's access channel.

<h4>Example</h4>

```html
<form action="/callback/form1" method="POST" skip-confirmation>
  <section>...</section>
  <section>...</section>
</form>
```

## **&lt;header&gt;**

Declares the header of a message. It overwrites the `header` attribute from
`<section>`. It is formatted automatically before is sent to the user.

<h4>Constraints</h4>
- cannot be empty
- allowed children: text
- if used, it must be the first child of a `<section>` tag

<h4>Example</h4>

```html
<section>
  <header>MY APP</header>
  ...
</section>
```

## **&lt;img&gt;**

The `<img>` tag is used to render an image.  If the `<img>` tag is enclosed within an `<li>` and `<a>` tags, then it becomes a selectable menu option.

<h4>Constraints</h4>

- allowed children: no

<h4>Attributes</h4>

- `src` (string) - fully qualified public path to the image file to be rendered
- `alt` (string) - alt text to be displayed when the src cannot be downloaded.  This is ignored for some access channels

<h4>Example</h4>

```html
<section>
  <img src="https://example.com/assets/image.png" alt="alt text" />
  <ul>
    <li>
      <a href="/form/new/">New todo
        <img src="https://placekitten.com/600/600" alt="alt text 2" />
      </a>
    </li>
  </ul>
</section>
```

## **&lt;input&gt;**

Used inside forms to request specific input types from user. Only one
`<input/>` tag is permitted per section. If many are present, only the
first one is considered. Outside `<form>` tags, the `<input/>` tag is
ignored.

For asking the user to select from a predefined list of options, the
`<ul>...</ul>` tag must be used instead of `<input/>`.

<h4>Constraints</h4>
- allowed children: no

<h4>Attributes</h4>

<h4>Standard HTML5:</h4>
- `type` (string) - describes the data type expected by the app as response from the user. The platform will convert the text input to the specified type. The supported values are:
    - Standard HTML5:
        - `"date"` - the user input is validated as date
        - `"email"` - the user input is validated as email address
        - `"hidden"` - won't be displayed
        - `"number"` - the user input is validated as any number (if integer is wanted, use `type="number"` with `step="1"`)
        - `"range"` - user input is validated as range in combination with min, max and step.  When default value has type array of multiple items, then multiple values are required in the user's input (eg `default="[1000, 100000]"`)
        - `"text"` - the user input is validated as text with only a single line allowed
        - `"textarea"` - the user input is validated as text with multiple lines allowed (depending on the input device being used)
        - `"tel"` - validated as text, for web browsers the standard keyboard is replaced with the dialpad
        - `"url"` - the user input is validated as url    
    - Non-standard:
        - `"datetime"` - the user input is validated as datetime
        - `"phone"` - the user input is validated as an international phone number. For web browsers the standard keyboard is replaced with the dialpad

- `min` (number) - validates the user input - for type=number
- `minlength` (integer) - validates the user input - for type=text
- `max` (number) - validates the user input - for type=number
- `maxlength` (integer) - validates the user input - for type=text
- `step` (integer) - specifies the legal number intervals for input field
- `value` (string) - required for type=hidden
<!-- - `pattern` (string) - defines a regex. `type` is ignored and considered `text`. -->
<!-- - `"location"` - the user input is validated as location -->

<h4>Non-standard</h4>
- `min_error` (string) - message to be shown on min error
- `minlength_error` (string) - message to be shown on minlength error
- `max_error` (string) - message to be shown on max error
- `maxlength_error` (string) - message to be shown on maxlength error

<h4>Example</h4>
```html
<section>
  ...
  <input type="text"/>
  ...
</section>
```

## **&lt;label&gt;**

Text to describe an input. It has the same behavior as `<p>` tag.

<h4>Constraints</h4>

- cannot be empty
- allowed children: text

<h4>Example</h4>
```html
<section>
  ...
  <label>Please send your name</label>
  ...
</section>
```

## **&lt;li&gt;**

Declares a list item. If it contains an `<a>` tag, it will be selectable,
prefixed with a letter or a number. Otherwise it’s just an unselectable
separator item.

<h4>Constraints</h4>
- cannot be empty
- allowed children: text, `<a>`

<h4>Attributes</h4>
- `value` - the value used for a form item response. It is ignored outside of
a form context
<!-- - `text-search` - field to add more context for searching in options -->

<h4>Example</h4>

```html
<section>
  ...
  <ul>
    <li>Item 1</li>
    <li>Item 2</li>
    <li>Item 3</li>
  </ul>
  ...
</section>
```

## **&lt;login&gt;**

Renders a login button.  Currently this is only supported in Menus (not Forms).

<h4>Constraints</h4>
- supported as menu list items or standalone element within a section menu
- allowed children: none

<h4>Attributes</h4>
- `on-success` - the path to redirect to when the user has logged in successfully
- `on-failure` - the path to redirect to when the user has failed to login
<!-- - `text-search` - field to add more context for searching in options -->

<h4>Example</h4>

```html
<section>
  ...
  <login on-success="/successPath" on-failure="/failurePath" />
  <ul>
    <li>Item 1</li>
    <li>Item 2</li>
    <li>Item 3</li>
  </ul>
  ...
</section>
```

## **&lt;logout&gt;**

Renders a logout button.  Currently this is only supported in Menus (not Forms).

<h4>Constraints</h4>
- supported as menu list items or standalone element within a section menu
- allowed children: none

<h4>Attributes</h4>
- `on-success` - the path to redirect to when the user has logged out successfully
- `on-failure` - the path to redirect to when the user has failed to logout
<!-- - `text-search` - field to add more context for searching in options -->

<h4>Example</h4>

```html
<section>
  ...
  <logout on-success="/successPath" on-failure="/failurePath" />
  <ul>
    <li>Item 1</li>
    <li>Item 2</li>
    <li>Item 3</li>
  </ul>
  ...
</section>
```

## **&lt;p&gt;**

A paragraph.

<h4>Constraints</h4>
- cannot be empty
- allowed children: text

<h4>Example</h4>

```html
<section>
  ...
  <p>Hi there!</p>
  ...
</section>
```

## **&lt;section&gt;**

A `<section>` body represents the SMS sent to the user by a micro-app.

<h4>Constraints</h4>

- cannot be empty
- allowed children: text, `<p>`, `<br/>`, `<header>`, `<footer>`, `<ul>`,
`<input>`, `<label>`, `<img>`, `<video>`

<h4>Attributes</h4>

- `header` (string) - alternative to `<header>` child
- `footer` (string) - alternative to `<footer>` child
- `name` (string) - identifier within a `<form>`. Ignored if not inside a
`<form>`.
- `auto-select` (boolean) - whether to select automatically the single option
in a menu if it's the case
- `multi-select` (boolean) - whether to allow selecting multiple items in a
list. Ignored if not inside a `<form>`.
- `numbered` (boolean) - whether to prefix the options with numbers (otherwise
the prefixes will be letters). Ignored if not inside a `<form>`.
- `chunking-footer` (string) - shown in the footer of the sms chunks. Ignored if
not inside a `<form>`.
- `confirmation-label` (string) - shown in the confirmation menu. Ignored if
not inside a `<form>`.
- `method` (string) - http method, how the callback url should be triggered.
Ignored if not inside a `<form>`.
- `required` (boolean) - can be skipped if set to false. Ignored if not inside a
`<form>`.
- `default` (string) - used for not required form items, providing a default 
value when the item is skipped.
- `url` (string) - callback url triggered right after the choice has been set
for this form item. Ignored if not inside a `<form>`.

<!-- - `validate-type-error` (string) - an error message to be shown on basic type
validation. Ignored if not inside a `<form>`.
- `validate-type-error-footer` (string) - shown in the error message footer.
Ignored if not inside a `<form>`.
- `validate-url` (string) - the callback url path (GET) triggered to validate
user input with query string `?name=user_input` - url must return JSON content
{"valid": true/false, "error": "Some validation error message"}. Ignored if
not inside a `<form>`. -->
<!-- - `status-exclude` (boolean) - if true this step will be excluded from the form
completion status.Ignored if not inside a `<form>`.
- `status-prepend` (boolean) - if true this step will be prepended to the body
pre of the response - appended otherwise. Ignored if not inside a `<form>`. -->

<h4>Example</h4>

```html
<section>
  ...
</section>
```

## **&lt;Snackbar&gt;**

Top level tag used to describe a snackbar within a `<section>` or `<form>`.

<h4>Constraints</h4>
- Must be a child of a `<section>` or `<form>`
- Only one snackbar tag allowed per section/form
- allowed children: none

<h4>Attributes</h4>
- `message` (string) - Required.  The main text content of the snackbar
- `severity` (string) - Default `info`.  Possible values `info`, `warn`, `error` or `success`
- `name` (string) - Name of the action button
- `path` (string) - Path for the callback action
- `method` (string) - the HTTP method used for redirection. Possible values:
"POST", "GET", "PATCH", "PUT", "DELETE"
- `auto-hide-duration` (number) - Time to wait (in ms) until the Snackbar should be automatically closed.  If not supplied, zero or null, the default system value applies (usually 7s)

<h4>Example</h4>

```html
<section>
  <snackbar message="Marked as done" name="undo" path="/todo/1234/undodone" method="post"></snackbar>
  <ul>
    <li><a href="/todo/1234/done" method="put">Mark as done</a></li>
    <li><a href="/todo/1234" method="delete">Delete</a></li>
  </ul>
</section>
```

## **&lt;textarea&gt;**

The `<textarea>` tag is used as an alterntive to `<input type="textarea" />`.  It is used to faciltate input of text spanning multiple lines (if supported by the device and user's access channel).  If the `<textarea>` tag has a text child, then this becomes the default value for the field.

<h4>Constraints</h4>

- allowed children: text
- it is ignored outside of a form context

<h4>Example</h4>

```html
<form>
  ...
  <section name="address">
    ...
    <textarea>default value</textarea>
  </section>
</form>
```

## **&lt;ul&gt;**

Declares a list. When rendered, it will be a selectable list, list elements are represented by <li> tags.

<h4>Constraints</h4>
- cannot be empty
- allowed children: `<li>`

<h4>Example</h4>
```html
<section>
  ...
  <ul>
    ...
  </ul>
  ...
</section>
```

## **&lt;video&gt;**

The `<video>` tag is used to render an image.  If the `<video>` tag is enclosed within an `<li>` and `<a>` tags, then it becomes a selectable menu option.

<h4>Constraints</h4>

- allowed children: children are ignored

<h4>Attributes</h4>

- `src` (string) - fully qualified public path to the video file to be rendered
- `alt` (string) - alt text to be displayed when the src cannot be downloaded.  This is ignored for some access channels

<h4>Example</h4>

```html
<section>
  <video src="https://example.com/assets/image.png" alt="alt text"></video>
  <ul>
    <li>
      <a href="/form/new/">New todo
        <video src="https://placekitten.com/600/600" alt="alt text 2"></video>
      </a>
    </li>
  </ul>
</section>
```
