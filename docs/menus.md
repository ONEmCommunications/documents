Menus provide basic micro-app navigation.  They are essentialy route links to other menus or forms.

All menus must start with a ```<Section name="anytext">``` tag which can have a number of attributes that affect behaviors.

Any [Node.js teplate engine](https://expressjs.com/en/resources/template-engines.html/) that creates raw HTML or [Python template engine](https://www.fullstackpython.com/template-engines.html/) can use either our [Node.js SDK](https://www.npmjs.com/package/onemsdk/) or [Phython SDK](https://pypi.org/project/ONEmSDK//).

#### Menu Struction
```html tab=
<!-- 
    Use for any template engines that generate HTML
    Node.js SDK: EJS, Vash 
    Python SDK: Django, Jinga2
-->
<section name="anyname">
  <header>
    <p>Header text</p>
    <img src="https://assets/picture.jpg" alt="Picture">
    <video src="https://assets/video.mpg" alt="Video">
  </header>
    <p>Any text</p>
    <ul>
        <li>
            <a href="/route1/param1">Button #1 Text</a>
        </li>
        <li>
            <a href="/route2">Button #2 Text</a>
        </li>
        <li>
            <a href="/route2">Button #3 Text
                <img src="https://assets/picture_button.jpg" alt="Picture Button">
            </a>
        </li>
        <li>
            <a href="/route2">Button #4 Text
                <video src="https://assets/video_button.mpg" alt="Video">
            </a>
        </li>
    </ul>
  <footer> <!--Used only to overwrite SMS auto generated --Reply footers -->
    <p>Reply text</p>
  </footer>
```

```pug tab=
<!-- 
    Requires the Node.js SDK
-->
section(name="anyname")
  header Header text
    img(src="https://assets/picture.jpg" alt="Picture")
    video(src="https://assets/video.mpg" alt="Video")
    p Any text
    | More text
    ul
        li
            a(href="/route1/param1") Button #1 Text
        li
            a(href="/route2") Button #2 Text
        li
            a(href="/route2") Button #3 Text
                img(src="https://assets/picture_button.jpg" alt="Picture Button")
        li
            a(href="/route2") Button #4 Text
                video(src="https://assets/video_button.mpg" alt="Video")
  footer(Reply text) <!--Used only to overwrite SMS auto generated --Reply footers -->
```

```python tab=
# -
# Requires Python SDK
# -
from onemsdk.schema.v1 import Response, Menu, MenuItem


def handle_request_with_objects(request):

    menu_items = [
        MenuItem(description='Button item1 text',
                 method='GET',
                 path='/callback-url/item1',
                 src= None,
                 alt= None),
        MenuItem(description='Text lable if path=None',
                 method='GET',
                 path= None,
                 src= None,
                 alt= None),
        MenuItem(description='Picture button item2 text (optional if src=some image',
                 method='GET',
                 path='/callback-url/item2',
                 src= "https://assets/picture_button_item2.jpg",
                 alt= "Picture button text2 if link broken"),
        MenuItem(description='Video button item3 text (optional if src=some video',
                 method='GET',
                 path='/callback-url/item3'),
                 src= "https://assets/video_button_item3.mpg",
                 alt= "Picture button item3 text if link broken"),
        MenuItem(description='Button item4 text',
                 method='PUT',
                 path='/callback-url/item4',
                 src= None,
                 alt= None),
        MenuItem(description='Button item5 text',
                 method='POST',
                 path='/callback-url/item3',
                 src= None,
                 alt= None),
        MenuItem(description='Button item6 text',
                 method='DELETE',
                 path='/callback-url/item6',
                 src= None,
                 alt= None),
    ]
    # Footer is used only for SMS and ignored on other channels
    menu = Menu(header='menu', footer='Reply A-C', body=menu_items)

    # Wrap the Menu object into a Response object compatible with the JSON schema
    response = Response(content=menu)

    # Jsonify the response and send it the over the wire
    return response.json()
```

<!-- ```json tab=
{
  "content_type": "menu",
  "content": {
    "type": "menu",
    "body": [
      {
        "type": "option",
        "description": null,
        "method": "GET",
        "path": "/callback-url/local",
        "src":"https://example.com/assets/picture.jpg",
        "alt":"a picture2"
      },
      {
        "type": "option",
        "description": "like lable displays text path not set",
        "method": "GET",
        "path": null,
        "src":"https://example.com/assets/video.mpg",
        "alt":"a picture3"
      },
      {
        "type": "option",
        "description": "Text here if no src",
        "method": "POST",
        "path": "/callback-url/item3",
        "src":null,
        "alt":null
      },
      {
        "type": "option",
        "description": "Text here if no src",
        "method": "DELETE",
        "path": "/callback-url/item3",
        "src":null,
        "alt":null
      },
      {
        "type": "option",
        "description": "Text here if no src",
        "method": "PUT",
        "path": "/callback-url/item3",
        "src":null,
        "alt":null
      }
    ],
    "header": "my menu",
    "footer": "Reply A-C"
  }
}
``` -->

#### Single Button

```html tab=
<ul>
    <li>
        <a href="/route">Button Text</a>
```

```python tab=
#!/bin/bash
STR="Hello World!"
echo $STR
```

```javascript tab=
#include 

int main(void) {
    printf("hello, world\n");
}
```

```pug tab=
ul
    li
        a(href="/route") Button Text
```

```ejs tab=
#include 

int main(void) {
    printf("hello, world\n");
}
```



- Buttons: menu_button.md
# - Button QR: menu_button_QR.md
- Options: menu_option.md
- Display only: menus_display_only.md