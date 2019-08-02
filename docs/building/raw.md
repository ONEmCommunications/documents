A raw response is a just a plain [menu](/building/menus/), that is the **body** of the menu does not contain any **option** items.

This means that no **path** or **method** are needed in the **content** item of the **body**, since the user cannot select anything as there are no options available like in a menu.

## Json Structure

Your server must return a JSON response with the following structure:

```
Menu
    type   - (string) defaults to "menu"
    header - (string) The header of the menu
    body   - (array) MenuItem objects - see below
    footer - (string) The footer of the menu

MenuItem
    type        - (string) enum: "content"
        "content" - shows content as indicated in description - see below

    description - (string) The description of this MenuItem
```

Example:

```
{'body': [{'description': 'Your task has been created!',
           'type': 'content'}],
 'header': 'done',
 'footer': None,
 'type': 'menu'}
```

The response back to the user will be an SMS which will look like:

```
#TODO DONE
Your task has been created!
```
