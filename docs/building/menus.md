A menu represents a type of response ONEm sends back to the user and it allows the user to select certain options you put in the menu.

It is composed by a **header**, a **body** and a **footer**. The body can contain **option** or **content** items.

When an option is being accessed, ONEm platform will perform an HTTP request to the callback path you set.

## Json Structure

Your server must return a JSON response with the following structure:

```
Menu
    type   - (string) defaults to "menu"
    header - (string) The header of the menu
    body   - (array) MenuItem objects - see below
    footer - (string) The footer of the menu
    meta   - (object) MenuMeta object - see below

MenuItem
    type        - (string) enum: "option", "content"
        "option"  - indicates an option and needs a path - see below
        "content" - shows content as indicated in description - see below

    description - (string) The description of this MenuItem
    path        - (string) Next route callback path, accessed upon user selection
    method      - (string) Http method indicating how to trigger the path

MenuMeta
    auto_select - (bool) Auto selects option if the Menu has only one MenuItem
                         of type option
```


Example:


```javascript
{
    "body": [
        {
            "description": "New todo",
            "method": "GET",
            "path": "/task/create/",
            "type": "option"
        },
        {
            "description": "Done(0)",
            "method": "GET",
            "path": "/task/list/done/",
            "type": "option"
        },
        {
            "description": "Todo(1)",
            "method": null,
            "path": null,
            "type": "content"
        },
        {
            "description": "buy coffee 2019-07-01",
            "method": "GET",
            "path": "/task/7/",
            "type": "option"
        }
    ],
    "footer": null,
    "header": "home",
    "type": "menu"
}
```

Notice the **'type': 'menu'** key value pair, which indicates the menu response.

So when the user accesses your **todo** app, by sending **#todo**, ONEm will send a GET request to the **callback_url** as mentioned in [here](/bird-eye/). Your url should return something like the above json structure.

The response back to the user will be an SMS which will look like:

```
#TODO HOME
A New todo
B Done(0)
Todo(1)
C buy coffee 2019-07-01
--Reply A-C
```


## Type
The response **type** should be equal to **menu** to indicate a menu response.


## Header
The header of the menu is indicated through **header** key. This value is not final and will be altered by the ONEm platform, by making it uppercased and placing the name of your app in front of it.


## Body
The body of the menu is indicated through **body** key and it is a sequence of dictionaries. Each dictionary can be an **option** or a **content** item and this is set through the **type** key. A **content** type item does not need a **path** nor a **method** since these are not selectable by the user. However an **option** item needs a callback **path** and this is relative to the **callback_url** set in the app schema in the developer portal. If the **method** is not present, it will default to GET.


**NOTE:**

A body composed of only **content** items could be used for display purposes only. This is called a [raw](/building/raw/) response.

## Footer
The footer of the menu is indicated through **footer** key and like the header of the menu, it is not final and will be altered by the ONEm platform. If no footer is specified, a default is set like in the above example.
