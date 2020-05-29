A menu represents a type of response ONEm sends back to the user and it allows the user to select certain options you put in the menu.

It is composed by a **header**, a **body** and a **footer**. The body can contain **option**, **content**, **login** or **logout** items.

When an option is being accessed, ONEm platform will perform an HTTP request to the callback path you set.

## JSON Structure

<span style="font-size:13px;">_All fields prefixed with a star (*) are required_</span>


## Menu
A top level component used to display a menu or raw text

| KEY | TYPE | NOTES |
|-----|------|-------|
|*type|string|Indicates the type of the object, defaults to `"menu"`|
|*body|array|Composed of [`MenuItem`](#menuitem) objects|
|header|string|The header of the menu|
|footer|string|The header of the menu|
|meta|object|[`MenuMeta`](#menumeta) object. Contains configuration flags|
|snackbar|object|[`Snackbar`](/building/snackbar) object. Contains an informational 'pop-up' message|

### MenuItem
[`Menu`](#menu) related component used to display menu items, selectable or
raw

| KEY | TYPE | NOTES |
|-----|------|-------|
|*type|string|Indicates the type of the object<br> _available: `"content", "login", "logout", "option"`_|
|description|string|The displayed text for this `MenuItem`.  If `description` is not provided, then `src` must be provided|
|method|string|HTTP method indicating how to trigger the callback path. Defaults to `"GET"`<br> _available: `"GET", "POST", "PUT", "PATCH", "DELETE", "HEAD", "OPTIONS", "TRACE"`_|
|path|string|Next route callback path, accessed upon user selection <br> _required only for `type=option`_|
|src|string|Fully qualified public path to a media file.  Be sure to include the file extension as this will be used to determine the type of media (image, audio or video).  If `src` is not provided, then `description` must be provided.
|alt|string|Alt text to use for media files when `src` is provided|
|card|object|[`Card`](/building/card) object.  Object containing card related data.  `description`, `src` and `alt` fields are ignored when card has a value.

!!! tip
    ['Cards'](/building/card) can be turned into selectable options by setting `path`, `method` and `type` appropriately

<!-- |text_search|string|If the user does not send a proper option marker and sends some input, this field will be used to search and narrow down the options against the user input. <br> max 1000 chars| -->


### MenuMeta
[`Menu`](#menu) related component holding configuration fields for the menu
 

| KEY | TYPE | NOTES |
|-----|------|-------|
|auto_select|boolean|Will be automatically selected if set to `true` and in case of a single option in the menu|


### Type
The response **type** should be equal to **menu** to indicate a menu response.


### Header
The header of the menu is indicated through **header** key. This value is not final and may be re-formatted by the ONEm platform depending on the user's access channel.


### Body
The body of the menu is indicated through **body** key and it is a sequence of objects. Each object can be an **option** or a **content** item and this is set through the **type** key. A **content** type item does not need a **path** nor a **method** since these are not selectable by the user. However an **option** item needs a callback **path** and this is relative to the **callback_url** set in the app schema in the [ONEm Developer Portal]({{ links.portal }}). If the **method** is not present, it will default to GET.


!!! tip
    A body composed of only **content** items could be used for display purposes only. 


### Footer
The footer of the menu is indicated through **footer** key and like the header of the menu, it is not final and may be altered (or even not displayed) by the ONEm platform depending on the user's access channel. If no footer is specified, the ONEm platform adds a default depending on the user's access channel.

### Swagger

The schema can also be found on Swagger Hub [here]({{ links.schema_url }})

### JSON Example

<div style="max-height:300px;overflow:auto;">
```javascript
{
    "body": [
        {
            "description": "New todo",
            "method": "GET",
            "path": "/task/create/",
            "src": null,
            "alt": null,
            "type": "option"
        },
        {
            "description": "Done(0)",
            "method": "GET",
            "path": "/task/list/done/",
            "src": null,
            "alt": null,
            "type": "option"
        },
        {
            "description": "Video option",
            "method": "GET",
            "path": "/videos/1/",
            "src": "http://techslides.com/demos/sample-videos/small.mp4",
            "alt": "Sample video",
            "type": "option"
        },
        {
            "description": null,
            "method": null,
            "path": null,
            "src": "https://placekitten.com/600/600",
            "alt": "Cat picture",
            "type": "content"
        }
    ],
    "footer": null,
    "header": "home",
    "type": "menu"
}
```
</div>