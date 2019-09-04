A form is like a collection of menus or raw responses and it is basically collecting information from the user.

It is composed by a **header**, a **body** and a **footer**. The body represents form items and these can be slightly modified menus or raw responses.

The form items are being processed in a successive manner. After all the form items have been processed, the user can confirm his choices or reset any of them.

## <a name="json-structure"></a> Json Structure

Your server must return a JSON response with the following structure:

```
Form
    type   - (string) defaults to "form"
    header - (string) The header of the firn
    body   - (array) FormItem or FormItemMenu objects - see below
    footer - (string) The footer of the form
    path   - (string) Next route callback path, accessed after form is finished
    method - (string) Http method indicating how to trigger the path
    meta   - (object) FormMeta object - see below

FormMeta
    completion_status_show      - (bool) indicates a form completion status
    completion_status_in_header - (bool) indicates the status in the header
    confirmation_needed         - (bool) shows a menu at the end of the form so user can confirm the choices
    
FormItem
    type - (string) enum: "string", "hidden", "int", "float", "date", "datetime", "form-menu"
        "string"    - the user should enter a string during this step
        "hidden"    - will not be displayed to the user
        "int"       - the user should enter a valid number
        "float"     - the user could enter a floating number
        "date"      - the user should enter a date
        "datetime"  - the user should enter a date and time
        "form-menu" - the user should choose an option from the menu

    name                       - (string) the name of this FormItem, used in form serialization

    body                       - (array of objects) MenuItemFormItem objects - see below - required only for type=form-menu
    chunking_footer            - (string) shown in the footer of the sms chunks
    confirmation_label         - (string) shown in the confirmation menu
    description                - (string) the description of this FormItem
    footer                     - (string) if provided will overwrite the Form.footer
    header                     - (string) if provided will overwrite the Form.header
    max_length                 - (int) validates the user input - for type=string
    max_length_error           - (string) message to be shown on max_length error
    max_value                  - (int) validates the user input - for type=int|float
    max_value_error            - (string) message to be shown on max_value error
    meta                       - (object) MenuFormItemMeta object - see below - applies only for type=form-menu
    method                     - (string) http method, how the callback url should be triggered
    min_length                 - (int) validates the user input - for type=string
    min_length_error           - (string) message to be shown on min_length error
    min_value                  - (int) validates the user input - for type=int|float
    min_value_error            - (string) message to be shown on min_value error
    required                   - (bool) can be skipped if set to false
    status_exclude             - (bool) if true this step will be excluded from the form completion status
    status_prepend             - (bool) if true this step will be prepended to the body pre of the response - appended otherwise
    url                        - (string) callback url triggered right after the choice has been set for this form item
    validate_type_error        - (string) an error message to be shown on basic type validation
    validate_type_error_footer - (string) shown in the error message footer
    validate_url               - (string) the callback url path (GET) triggered to validate user input with query string ?name=user_input - url must return json content {'valid': True/False, 'error': 'Some validation error message'}
    value                      - (string) required for type=hidden
    

MenuItemFormItem
    type - (string) enum: "option", "content"
        "option"  - needs a value
        "content" - does not need a value - shows content as indicated in description

    value       - (string) the value of this FormItemMenuItem, used in form serialization
    description - (string) the description of this FormItemMenuItem


MenuFormItemMeta
    auto_select  - (bool) will be automatically selected if set to true and in case of a single option in the menu
    multi_select - (bool) allows multiple options to be selected
    numbered     - (bool) display numbers instead of letters for option markers

```

Example:

```
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
            "type": "menu",
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
        "confirmation_needed": false
    },
    "method": "POST",
    "path": "/task/create",
    "type": "form"
}
```

Notice the **'type': 'form'** key value pair, which indicates the form response.

So when the user sends **a** to access the **New todo** option item, as mentioned [here](/building/menus/) ONEm will send a GET request to **http://your-callback.url/task/create/**. This url should return something like the above json structure.

The user will be taken through a wizard and it will look like:

```
#TODO CREATE TASK
Provide a description
```

This is the first step and whatever the user replies with will be set as the task description. This is a **string** and it will be **POST**ed to **path** as indicated in the json structure. Notice there is no **header** or **footer** mentioned at this step, so form header and footer will be used as fallbacks.


```
#TODO DUE DATE
Provide a description
```

This is the second step and the user needs to reply with a date. There is no callback path so no HTTP request will be performed after this step. The **header** is present here, so it will be displayed instead of the form header.


```
#TODO PRIORITY
A High priority
B Low priority
--Reply A-B
```

This is the last step and the user needs to choose one option.

After all steps have been processed, as indicated through **method** and **path**, the form will be serialized and an HTTP POST will be sent to the path which is relative to the callback url: **http://your-callback.url/task/create/**

So the POST will look like: **?descr=some_description&due_date=2019-10-10&prio=high**


## Type
The response **type** should be equal to **form** to indicate a form response.


## Header
The header of the form is indicated through **header** key. This value is not final and will be altered by the ONEm platform, by making it uppercased and placing the name of your app in front of it.

## Body
The body holds an array of objects. Each object is called a FormItem and it is described in the [Json Structure](#json-structure)

## Footer
The footer of the form is indicated through **footer** key and like the header of the form, it is not final and will be altered by the ONEm platform. If no footer is specified, a default might be set.

## Path & Method
The path set in the Form object is triggered right after the form has been finished and confirmed by the user.

All the values will be sent to your callback path as a form serialized data, ie object with key value pairs: name_of_the_form_item = user_input

If there is a form-menu FormItem with multi_select set and the user chooses more than one option, then the value of the corresponding pair will be an array of the selected values.

## Meta
The meta key holds a FormMeta object used to indicate certain behaviors for the Form.
