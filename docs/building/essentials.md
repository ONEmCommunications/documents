ONEm is continuously developing and maintaining SDKs (Software Development Kits) in different languages in order to provide a smooth integration between your micro-app and ONEm Framework.

!!! abstract "Official SDKs"
    - [Python SDK]({{ links.python_sdk_repo }})
    - [NodeJS SDK]({{ links.nodejs_sdk_repo }})

Your micro-app is a web server which receives HTTP requests from ONEm Platform and sends JSON responses back. One of the main purposes of the SDKs is to help you generate a valid JSON response for each message you want to send to your users.

No matter what language you are developing in, the SDK will enable you two ways of creating user interfaces by:

- pure programming
- HTML (see [supported HTML tags](/building/html)) or HTML based templates. Currently we support several templating engines with the SDK:
    - NodeJS SDK:
        - [pug](https://pugjs.org/api/getting-started.html)
        - [ejs](https://ejs.co/#install)
    - Python SDK:
        - [Jinja](https://palletsprojects.com/p/jinja/)

!!! example "Example of how a simple menu can be defined"
    <pre>
        # MY APP
        A Option 1
        B Option 2
        C Option 3
        --Reply A-C
    </pre>

    ```HTML tab="HTML"
    <section>
        <header>My App</header>
        <ul>
            <li><a href="/path1">Option 1</a></li>
            <li><a href="/path2">Option 2</a></li>
            <li><a href="/path3">Option 3</a></li>
        </ul>
    </section>
    ```

    ```javascript tab="NodeJS"
    const onemsdk = require('onemsdk');
    
    const menu = onemsdk.Menu({
        header: 'My App',
        body: [
            new MenuItem({description: 'Option 1', path: '/path1'}),
            new MenuItem({description: 'Option 2', path: '/path2'}),
            new MenuItem({description: 'Option 3', path: '/path3'}),
        ]
    });
    ```
    
    ```python tab="Python"
    import onemsdk
    
    menu = onemsdk.Menu(
        header='My App',
        body=[
            onemsdk.MenuItem(description='First item', path='/path1'),
            onemsdk.MenuItem(description='Second item', path='/path2'),
            onemsdk.MenuItem(description='Third item', path='/path3')
        ]
    )
    ```
