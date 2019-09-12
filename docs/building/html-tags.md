## **`<section>`**

A `<section>` body represents the SMS sent to the user by a micro-app.

### Constraints

- cannot be empty
- allowed children: text, `<p>`, `<br/>`, `<header>`, `<footer>`, `<ul>`,
`<input>`, `<label>`

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
- `status-exclude` (boolean) - if true this step will be excluded from the form
completion status.Ignored if not inside a `<form>`.
- `status-prepend` (boolean) - if true this step will be prepended to the body
pre of the response - appended otherwise. Ignored if not inside a `<form>`.
- `url` (string) - callback url triggered right after the choice has been set
for this form item. Ignored if not inside a `<form>`.
- `validate-type-error` (string) - an error message to be shown on basic type
validation. Ignored if not inside a `<form>`.
- `validate-type-error-footer` (string) - shown in the error message footer.
Ignored if not inside a `<form>`.
- `validate-url` (string) - the callback url path (GET) triggered to validate
user input with query string `?name=user_input` - url must return JSON content
{"valid": true/false, "error": "Some validation error message"}. Ignored if
not inside a `<form>`.

### Example

```html
<section>
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

## **`<footer>`**

Declares the footer of a message. It overwrites the footer attribute from <section>. It
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

## **`<ul>`**

Declares a list. When rendered, it will be a selectable list, list elements are
automatically prefixed  by a letter or a number. See <li> tag.

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
- `text-search` - field to add more context for searching in options

### Example

```html
<section>
  ...
  <ul>
    <li text-search="More context for item 1">Item 1</li>
    <li>Item 2</li>
    <li>Item 3</li>
  </ul>
  ...
</section>
```

## **`<a>`**

It is used for redirection to other locations.

### Constraints
- cannot be empty
- allowed children: text

### Attributes
- `href` (string) - a path in your app to redirect the user to
- `method` (string) - the HTTP method used for redirection. Possible values:
"POST", "GET", "PATCH", "PUT"

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
- `type` (string) - describes the data type expected by the app as response
from the user. The platform will convert the text input to the specified type.
Supported values:
    - "text" - the user input is validated as text
    - "date" - the user input is validated as date
    - "datetime" - the user input is validated as datetime
    - "number" - the user input is validated as any number (if integer is wanted,
    use `type="number"` with `step="1"`)
    - "hidden" - won't be displayed
- `min` (number) - validates the user input - for type=number
- `min_error` (string) - message to be shown on min error
- `minlength` (integer) - validates the user input - for type=text
- `minlength_error` (string) - message to be shown on minlength error
- `max` (number) - validates the user input - for type=number
- `max_error` (string) - message to be shown on max error
- `maxlength` (integer) - validates the user input - for type=text
- `maxlength_error` (string) - message to be shown on maxlength error
- `step` (integer) - specifies the legal number intervals for input field
- `value` (string) - required for type=hidden

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

## **`<form>`**

The `<form>` tag is used to capture user input.

## Constraints
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
- `completion-status-show` (boolean) - whether to show the user's progress
within the form
- `completion-status-in-header` (boolean) - if `true`, show the user's
progress in header, otherwise in body; ignored if `completion-status-show` is
false.
- `confirmation-needed` (boolean) - whether to add an additional form item for
confirmation.

### Example

```html
<form action="/callback/form1" method="POST" confirmation-needed>
  <section>...</section>
  <section>...</section>
</form>
```
