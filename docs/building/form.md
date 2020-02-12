A form is for collecting information from the user.

It is composed of a **header**, a **body** and a **footer**. The body consists of form items.

The form items are processed by the ONEm Platform in a successive manner. After all the form items have been processed, the user can confirm his choices or reset any of them.

## JSON Structure

<span style="font-size:13px;">_All fields prefixed with a star (*) are required_</span>

## Form
A top level component used to acquire information from the user

| KEY | TYPE | NOTES |
|-----|------|-------|
|*body|array|Sequence of [`FormItem`](#formitem) objects used to acquire information from user|
|footer|string|The footer of the form. It can be overwritten by each body component|
|header|string|The header of the form. It can be overwritten by each body component|
|meta|object|[`FormMeta`](#formmeta) object. Contains configuration flags|
|method|string|HTTP method indicating how to trigger the callback path. Defaults to `"POST"`<br> _available: `"GET", "POST", "PUT", "PATCH", "DELETE"|
|*path|string|The callback path used to send the serialized form data|
|*type|string|Indicates the type of the object, defaults to `"form"`|

### FormMeta
[`Form`](#form) related component holding configuration fields for the form

| KEY | TYPE | NOTES |
|-----|------|-------|
|skip_confirmation|boolean|If `true` will not ask for confirmation depending on the access channel. Defaults to `false`|

<!-- |completion_status_in_header|boolean|If `true` will indicate the status in the header. Defaults to `false`, which means it will be shown below header if the completion status is shown|
|completion_status_show|boolean|If `true` will show a completion status. Defaults to `false`| -->

### FormItem
[`Form`](#form) related component used to acquire certain information from
the user

| KEY | TYPE | NOTES |
|-----|------|-------|
|body|array|Composed of [`MenuItemFormItem`](#menuitemformitem) objects <br> _required only for `type=form-menu`_|
|chunking_footer|string|Shown in the footer of the sms chunks|
|*description|string|The description of this `FormItem`|
|footer|string|If provided will overwrite the `Form.footer`|
|header|string|If provided will overwrite the `Form.header`|
|max_length|integer|Validates the user input <br> _applies only for `type=string`_|
|max_length_error|string|Message to be shown on `max_length` error|
|max_value|number|Validates the user input <br> _applies only for `type=int|float`_|
|max_value_error|string|Message to be shown on `max_value` error|
|meta|object|[`MenuFormItemMeta`](#menuformitemmeta) object <br> _applies only for `type=form-menu`_|
|method|string|Http method, how the callback url should be triggered<br> _available: `"GET", "POST", "PUT", "PATCH", "DELETE", "HEAD", "OPTIONS", "TRACE"`_|
|min_length|integer|Validates the user input <br> _applies only for `type=string`_|
|min_length_error|string|Message to be shown on `min_length` error|
|min_value|number|Validates the user input <br> _applies only for `type=int|float`_|
|min_value_error|string|Message to be shown on `min_value` error|
|*name|string|The name of this `FormItem`, used in form serialization|
|required|boolean|User can `SKIP` this `FormItem` if set to `false`|
|*type|string|Indicates the type of the object<br> _available: `"string", "date", "datetime", "hidden", "int", "float", "form-menu", "email", "url", "location"`_|
|url|string|Callback url triggered right after the choice has been set for this form item|
|value|string|Value to pass in the form serialization data <br> _applies only for `type=hidden`_|

<!-- |status_exclude|boolean|If `true` this step will be excluded from the form completion status|
|status_prepend|boolean|If `true` this step will be prepended to the body of the response. Appended otherwise|
|confirmation_label|string|Shown in the confirmation menu|
|validate_type_error|string|An error message to be shown on basic type validation|
|validate_type_error_footer|string|Shown in the error message footer|
|validate_url|string|The callback url path `"GET"` triggered to validate user input. <br> A query string is sent by ONEm: `?form_item_name=user_input` <br> The validate_url must return a json response: `{"valid": true/false, "error": "Some message in case of validation errors"}`| -->

### MenuItemFormItem
[`FormItem`](#formitem) related component used to display menu items,
selectable or raw

| KEY | TYPE | NOTES |
|-----|------|-------|
|*description|string|The description for this `MenuItemFormItem`|
|*type|string|Indicates the type of the object<br> _available: `"option", "content"`_|
|value|string|The value for this `MenuItemFormItem`, used in form serialization <br> _required only for `type=option`_|

<!-- |text_search|string|If the user does not send a proper option marker and sends some input, this field will be used to search and narrow down the options against the user input <br> max 1000 chars| -->


### MenuFormItemMeta
[`FormItem`](#formitem) related component holding configuration field for
a menu inside a form item

| KEY | TYPE | NOTES |
|-----|------|-------|
|auto_select|boolean|Will be automatically selected if set to `true` and in case of a single option in the menu|
|multi_select|boolean|Allows multiple options to be selected|

<!-- |numbered|boolean|Displays numbers instead of letter option markers| -->


## Swagger

The schema can also be found on Swagger Hub [here]({{ links.schema_url }})

## JSON Example
<div style="max-height:300px;overflow:auto;">
```javascript
{
    "body": [
        {
            "type": "string",
            "name": "descr",
            "description": "Provide a description",
            "min_length": 5,
            "min_length_error": "Please write a longer description",
        },
        {
            "type": "date",
            "name": "due_date",
            "header": "due date",
            "description": "Provide a due date"
        },
        {
            "type": "form-menu",
            "name": "prio",
            "header": "priority",
            "body": [
                {
                    "type": "option",
                    "value": "high",
                    "description": "High priority"
                },
                {
                    "type": "option",
                    "value": "low",
                    "description": "Low priority"
                }
            ]
        }
    ],
    "header": "create task",
    "footer": null,
    "meta": {
        "skip_confirmation": true
    },
    "method": "POST",
    "path": "/task/create",
    "type": "form"
}
```
</div>


After all steps have been processed, as indicated through **method** and **path**, the form will be serialized and an HTTP POST will be sent to the path which is relative to the callback url: **http://your-callback.url/task/create/**

So the POST body will contain a JSON object with the named fields as properties, eg:

```javascript
{
    "desc": "Something todo",
    "due_date": "Tue Feb 11 2020 17:13:41 GMT+0000 (Greenwich Mean Time)"
}
```


### Type
The response **type** should be equal to **form** to indicate a form response.


### Header
The header of the form is indicated through **header** key. This value is not final and may be altered by the ONEm platform depending on the user's access channel.

### Body
The body holds an array of objects. Each object is called a FormItem and it is described in the [Json Structure](#json-structure)

### Footer
The footer of the form is indicated through **footer** key and like the header of the form, it is not final and may be altered by the ONEm platform or even omitted depending on the user's access channel. If no footer is specified, a default might be provided automatically depending on the circumstances.

### Path & Method
The path set in the Form object is triggered right after the form has been finished and confirmed by the user.

All the values will be sent to your callback path as a form serialized data, ie object with key value pairs: name_of_the_form_item = user_input

If there is a form-menu FormItem with multi_select set and the user chooses more than one option, then the value of the corresponding pair will be an array of the selected values.

### Meta
The meta key holds a FormMeta object used to indicate certain behaviors for the Form.
