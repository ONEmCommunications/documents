A raw response is a just a plain [menu](/building/menus/), that is the **body** of the menu does not contain any **option** items.

This means that no **path** or **method** are needed in the **content** item of the **body**, since the user cannot select anything as there are no options available like in a menu.

## Json Structure

<span style="font-size:13px;">_All fields prefixed with a star (*) are required_</span>

Your server must return a JSON response with the following structure:


## Menu

|  KEY     |  TYPE  | NOTES |
|----------|--------|--------------------------------------------------------|
| * type   | string | Indicates the type of the object, defaults to `"menu"` |
| * body   | array  | Composed of [`MenuItem`](#menuitem) objects |
| header   | string | The header of the menu |
| footer   | string | The footer of the menu |


### MenuItem

|  KEY     |  TYPE  | NOTES |
|----------|--------|------------------------------------------------------|
| * type | string | Defaults to `"content"` |
| description | string | The description for this [`MenuItem`](#menuitem). |

Your server must return a JSON response with the following structure:

## Swagger

The schema can also be found on Swagger Hub [here]({{ links.schema_url }})

## JSON Example

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
