# Menu

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
