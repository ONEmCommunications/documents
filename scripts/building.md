## MenuItem
[`Menu`](#menu) related component used to display menu items, selectable or
raw

| KEY | TYPE | NOTES |
|-----|------|-------|
|*description|string|The displayed text for this `MenuItem`|
|method|string|HTTP method indicating how to trigger the callback path. Defaults to `"GET"`<br> _available: `"GET", "POST", "PUT", "PATCH", "DELETE", "HEAD", "OPTIONS", "TRACE"`_|
|path|string|Next route callback path, accessed upon user selection <br> _required only for `type=option`_|
|text_search|string|If the user does not send a proper option marker and sends some input, this field will be used to search and narrow down the options against the user input. <br> max 1000 chars|
|*type|string|Indicates the type of the object<br> _available: `"option", "content"`_|

## MenuMeta
[`Menu`](#menu) related component holding configuration fields for the menu
 

| KEY | TYPE | NOTES |
|-----|------|-------|
|auto_select|boolean|Will be automatically selected if set to `true` and in case of a single option in the menu|

## Menu
A top level component used to display a menu or raw text

| KEY | TYPE | NOTES |
|-----|------|-------|
|*body|array|Composed of [`MenuItem`](#menuitem) objects|
|footer|string|The header of the menu|
|header|string|The header of the menu|
|meta|object|[`MenuMeta`](#menumeta) object. Contains configuration flags|
|*type|string|Indicates the type of the object, defaults to `"menu"`|

## MenuItemFormItem
[`FormItem`](#formitem) related component used to display menu items,
selectable or raw

| KEY | TYPE | NOTES |
|-----|------|-------|
|*description|string|The description for this `MenuItemFormItem`|
|text_search|string|If the user does not send a proper option marker and sends some input, this field will be used to search and narrow down the options against the user input <br> max 1000 chars|
|*type|string|Indicates the type of the object<br> _available: `"option", "content"`_|
|value|string|The value for this `MenuItemFormItem`, used in form serialization <br> _required only for `type=option`_|

## MenuFormItemMeta
[`FormItem`](#formitem) related component holding configuration field for
a menu inside a form item

| KEY | TYPE | NOTES |
|-----|------|-------|
|auto_select|boolean|Will be automatically selected if set to `true` and in case of a single option in the menu|
|multi_select|boolean|Allows multiple options to be selected|
|numbered|boolean|Displays numbers instead of letter option markers|

## FormItem
[`Form`](#form) related component used to acquire certain information from
the user

| KEY | TYPE | NOTES |
|-----|------|-------|
|body|array|Composed of [`MenuItemFormItem`](#menuitemformitem) objects <br> _required only for `type=form-menu`_|
|chunking_footer|string|Shown in the footer of the sms chunks|
|confirmation_label|string|Shown in the confirmation menu|
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
|status_exclude|boolean|If `true` this step will be excluded from the form completion status|
|status_prepend|boolean|If `true` this step will be prepended to the body of the response. Appended otherwise|
|*type|string|Indicates the type of the object<br> _available: `"string", "date", "datetime", "hidden", "int", "float", "form-menu", "email", "url", "location"`_|
|url|string|Callback url triggered right after the choice has been set for this form item|
|validate_type_error|string|An error message to be shown on basic type validation|
|validate_type_error_footer|string|Shown in the error message footer|
|validate_url|string|The callback url path `"GET"` triggered to validate user input. <br> A query string is sent by ONEm: `?form_item_name=user_input` <br> The validate_url must return a json response: `{"valid": true/false, "error": "Some message in case of validation errors"}`|
|value|string|Value to pass in the form serialization data <br> _applies only for `type=hidden`_|

## FormMeta
[`Form`](#form) related component holding configuration fields for the form

| KEY | TYPE | NOTES |
|-----|------|-------|
|completion_status_in_header|boolean|If `true` will indicate the status in the header. Defaults to `false`, which means it will be shown below header if the completion status is shown|
|completion_status_show|boolean|If `true` will show a completion status. Defaults to `false`|
|confirmation_needed|boolean|If `false` will not ask for confirmation. Defaults to `true`|

## Form
A top level component used to acquire information from the user

| KEY | TYPE | NOTES |
|-----|------|-------|
|*body|array|Sequence of [`FormItem`](#formitem) objects used to acquire information from user|
|footer|string|The footer of the form. It can be overwritten by each body component|
|header|string|The header of the form. It can be overwritten by each body component|
|meta|object|[`FormMeta`](#formmeta) object. Contains configuration flags|
|method|string|HTTP method indicating how to trigger the callback path. Defaults to `"POST"`<br> _available: `"GET", "POST", "PUT", "PATCH", "DELETE", "HEAD", "OPTIONS", "TRACE"`_|
|*path|string|The callback path used to send the serialized form data|
|*type|string|Indicates the type of the object, defaults to `"form"`|

## Response
Root component wrapping a `Menu` or a `Form`

| KEY | TYPE | NOTES |
|-----|------|-------|
|*content|object|The content of the response. Either `Form` or a `Menu`|
|*content_type|string|The content type of the response<br> _available: `"form", "menu"`_|

