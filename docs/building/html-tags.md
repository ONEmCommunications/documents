## **`<a>`**

It is used for redirection to other locations.

### Constraints
- cannot be empty
- allowed children: text, `<img>`, `<video>`

### Attributes
- `href` (string) - a path in your app to redirect the user to
- `method` (string) - the HTTP method used for redirection. Possible values:
"POST", "GET", "PATCH", "PUT", "DELETE"

### Example

```html
<section>
  <ul>
    <li>
      <a href="/menu" method="GET">Main menu</a>
    </li>
  </ul>
</section>
```

## **`<br>`**

Renders a new line.

### Constraints
- allowed children: no

### Example

```html
<section>
  ...
  <br/>
  ...
</section>
```

## **`<footer>`**

Declares the footer of a message. It overwrites the footer attribute from `<section>`. It
should be relative short line of text and it is shown in the last chunk of a message,
preceded by `--`.

### Constraints
- cannot be empty
- allowed children: text
- if used, it must be the last child of a `<section>` tag

### Example

```html
<section>
  ...
  <footer>Reply A-D</footer>
</section>
```

## **`<form>`**

The `<form>` tag is used to capture user input.

### Constraints
- cannot be empty
- allowed children: `<section>`

### Attributes

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

### Example

```html
<form action="/callback/form1" method="POST" skip-confirmation>
  <section>...</section>
  <section>...</section>
</form>
```

## **`<header>`**

Declares the header of a message. It overwrites the `header` attribute from
`<section>`. It is formatted automatically before is sent to the user.

### Constraints
- cannot be empty
- allowed children: text
- if used, it must be the first child of a `<section>` tag

### Example

```html
<section>
  <header>MY APP</header>
  ...
</section>
```

## **`<img>`**

The `<img>` tag is used to render an image.  If the `<img>` tag is enclosed within an `<li>` and `<a>` tags, then it becomes a selectable menu option.

### Constraints

- allowed children: no

### Attributes

- `src` (string) - fully qualified public path to the image file to be rendered
- `alt` (string) - alt text to be displayed when the src cannot be downloaded.  This is ignored for some access channels

### Example

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

## **`<input>`**

Used inside forms to request specific input types from user. Only one
`<input/>` tag is permitted per section. If many are present, only the
first one is considered. Outside `<form>` tags, the `<input/>` tag is
ignored.

For asking the user to select from a predefined list of options, the
`<ul>...</ul>` tag must be used instead of `<input/>`.

### Constraints
- allowed children: no

### Attributes

#### Standard HTML5:
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

#### Non-standard
- `min_error` (string) - message to be shown on min error
- `minlength_error` (string) - message to be shown on minlength error
- `max_error` (string) - message to be shown on max error
- `maxlength_error` (string) - message to be shown on maxlength error

### Example
```html
<section>
  ...
  <input type="text"/>
  ...
</section>
```

## **`<label>`**

Text to describe an input. It has the same behavior as `<p>` tag.

### Constraints

- cannot be empty
- allowed children: text

### Example
```html
<section>
  ...
  <label>Please send your name</label>
  ...
</section>
```

## **`<li>`**

Declares a list item. If it contains an `<a>` tag, it will be selectable,
prefixed with a letter or a number. Otherwise it’s just an unselectable
separator item.

### Constraints
- cannot be empty
- allowed children: text, `<a>`

### Attributes
- `value` - the value used for a form item response. It is ignored outside of
a form context
<!-- - `text-search` - field to add more context for searching in options -->

### Example

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

## **`<login>`**

Renders a login button.  Currently this is only supported in Menus (not Forms).

### Constraints
- supported as menu list items or standalone element within a section menu
- allowed children: none

### Attributes
- `on-success` - the path to redirect to when the user has logged in successfully
- `on-failure` - the path to redirect to when the user has failed to login
<!-- - `text-search` - field to add more context for searching in options -->

### Example

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

## **`<logout>`**

Renders a logout button.  Currently this is only supported in Menus (not Forms).

### Constraints
- supported as menu list items or standalone element within a section menu
- allowed children: none

### Attributes
- `on-success` - the path to redirect to when the user has logged out successfully
- `on-failure` - the path to redirect to when the user has failed to logout
<!-- - `text-search` - field to add more context for searching in options -->

### Example

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

## **`<p>`**

A paragraph.

### Constraints
- cannot be empty
- allowed children: text

### Example

```html
<section>
  ...
  <p>Hi there!</p>
  ...
</section>
```

## **`<section>`**

A `<section>` body represents the SMS sent to the user by a micro-app.

### Constraints

- cannot be empty
- allowed children: text, `<p>`, `<br/>`, `<header>`, `<footer>`, `<ul>`,
`<input>`, `<label>`, `<img>`, `<video>`

### Attributes

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

### Example

```html
<section>
  ...
</section>
```

## **`<textarea>`**

The `<textarea>` tag is used as an alterntive to `<input type="textarea" />`.  It is used to faciltate input of text spanning multiple lines (if supported by the device and user's access channel).  If the `<textarea>` tag has a text child, then this becomes the default value for the field.

### Constraints

- allowed children: text
- it is ignored outside of a form context

### Example

```html
<form>
  ...
  <section name="address">
    ...
    <textarea>default value</textarea>
  </section>
</form>
```

## **`<ul>`**

Declares a list. When rendered, it will be a selectable list, list elements are represented by <li> tags.

### Constraints
- cannot be empty
- allowed children: `<li>`

### Example
```html
<section>
  ...
  <ul>
    ...
  </ul>
  ...
</section>
```

## **`<video>`**

The `<video>` tag is used to render an image.  If the `<video>` tag is enclosed within an `<li>` and `<a>` tags, then it becomes a selectable menu option.

### Constraints

- allowed children: children are ignored

### Attributes

- `src` (string) - fully qualified public path to the video file to be rendered
- `alt` (string) - alt text to be displayed when the src cannot be downloaded.  This is ignored for some access channels

### Example

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
