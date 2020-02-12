This section provides some worked examples of different menu layouts.  Refer to the [menu reference](/building/menu) for a complete description of the available features.

## Menu with text options

!!! example "Menu with text options"

    **Source**

    ```HTML tab="HTML"
    <section>
        <header>Myapp</header>
        <ul>
            <li><a href="/path1">Option 1</a></li>
            <li><a href="/path2">Option 2</a></li>
            <li><a href="/path3">Option 3</a></li>
        </ul>
    </section>
    ```

    ```javascript tab="NodeJS"
    const { Menu, MenuItem } = require('onemsdk');
    
    const menu = new Menu({
        header: 'Myapp',
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
        header='Myapp',
        body=[
            onemsdk.MenuItem(description='First item', path='/path1'),
            onemsdk.MenuItem(description='Second item', path='/path2'),
            onemsdk.MenuItem(description='Third item', path='/path3')
        ]
    )
    ```

    **Results**

    ```fence_native tab="SMS"
    <pre>
        # MYAPP
        A Option 1
        B Option 2
        C Option 3
        --Reply A-C
    </pre>
    ```

    ```fence_native tab="Web Widget"
    <img style="height:400px;width:auto" src="/assets/menu-sample.png"/>
    ```

## Menu with plain text, no options

Note that in the HTML example, ```<li>``` tags without an ```<a>``` child are synonymous with plain ```<p>``` tags.

!!! example "Menu with plain text, no options"

    **Source**

    ```HTML tab="HTML"
    <section>
        <header>Myapp</header>
        <ul>
            <li>Hello, how are you today?</li>
            <li>This is some more content</li>
        </ul>
        <p>Another paragraph</p>
    </section>
    ```

    ```javascript tab="NodeJS"
    const { Menu, MenuItem } = require('onemsdk');
    
    const menu = new Menu({
        header: 'Myapp',
        body: [
            new MenuItem({description: 'Hello, how are you today?'}),
            new MenuItem({description: 'This is some more content'}),
            new MenuItem({description: 'Another paragraph'})
        ]
    });
    ```
    
    ```python tab="Python"
    import onemsdk
    
    menu = onemsdk.Menu(
        header='Myapp',
        body=[
            onemsdk.MenuItem(description='Hello, how are you today?'),
            onemsdk.MenuItem(description='This is some more content'),
            onemsdk.MenuItem(description='Another paragraph')
        ]
    )
    ```

    **Results**

    ```fence_native tab="SMS"
    <pre>
        #MYAPP
        Hello, how are you today?
        This is some more content
        Another paragraph
        --Reply BACK
    </pre>
    ```

    ```fence_native tab="Web Widget"
    <img style="height:400px;width:auto" src="/assets/menu-content-only.png"/>
    ```

## Menu with image as option

!!! example "Menu with image as option"

    **Source**

    ```HTML tab="HTML"
    <section>
        <header>Myapp</header>
        <ul>
            <li>
                <a href='/form/new/'>This is an option
                    <img src="https://placekitten.com/300/300" alt="alt text" />
                </a>
            </li>
        </ul>
    </section>
    ```

    ```javascript tab="NodeJS"
    const { Menu, MenuItem } = require('onemsdk');
    
    const menu = new Menu({
        header: 'Myapp',
        body: [
            new MenuItem({description: 'This is an option', src: 'https://placekitten.com/300/300', alt:'alt text'})
        ]
    });
    ```
    
    ```python tab="Python"
    import onemsdk
    
    menu = onemsdk.Menu(
        header='Myapp',
        body=[
            onemsdk.MenuItem(description='This is an option', src='https://placekitten.com/300/300', alt='alt text')
        ]
    )
    ```

    **Results**

    ```fence_native tab="SMS"
    <pre>
        #MYAPP
        A This is an option
        https://placekitten.com/300/300
        --Reply BACK
    </pre>
    ```

    ```fence_native tab="Web Widget"
    <img style="height:400px;width:auto" src="/assets/menu-image-option.png"/>
    ```

## Menu with images, no options

!!! example "Menu with images, no options"

    **Source**

    ```HTML tab="HTML"
    <section>
        <header>Myapp</header>
        <p>Cat picture</p>
        <img src="https://placekitten.com/300/300" alt="alt text" />
    </section>
    ```

    ```javascript tab="NodeJS"
    const { Menu, MenuItem } = require('onemsdk');
    
    const menu = new Menu({
        header: 'Myapp',
        body: [
            new MenuItem({description: 'Cat picture'}),
            new MenuItem({src: 'https://placekitten.com/300/300', alt:'alt text'}),
        ]
    });
    ```
    
    ```python tab="Python"
    import onemsdk
    
    menu = onemsdk.Menu(
        header='Myapp',
        body=[
            onemsdk.MenuItem(description='Cat picture'),
            onemsdk.MenuItem(src='https://placekitten.com/300/300', alt='alt text')
        ]
    )
    ```

    **Results**

    ```fence_native tab="SMS"
    <pre>
        #MYAPP
        Cat picture
        https://placekitten.com/300/300
        --Reply BACK
    </pre>
    ```

    ```fence_native tab="Web Widget"
    <img style="height:400px;width:auto" src="/assets/menu-image.png"/>
    ```

## Menu with video as option

Videos work almost identically as images, when using HTMLl, you may use the ```<video>``` tag instead of the ```<img>``` tag.

!!! example "Menu with video as option"

    **Source**

    ```HTML tab="HTML"
    <section>
        <header>Myapp</header>
        <ul>
            <li>
                <a href='/form/new/'>This is an option
                    <video src="http://techslides.com/demos/sample-videos/small.mp4" alt="alt text"></video>
                </a>
            </li>
        </ul>
    </section>
    ```

    ```javascript tab="NodeJS"
    const { Menu, MenuItem } = require('onemsdk');
    
    const menu = new Menu({
        header: 'Myapp',
        body: [
            new MenuItem({description: 'This is an option', src: 'http://techslides.com/demos/sample-videos/small.mp4', alt:'alt text'})
        ]
    });
    ```
    
    ```python tab="Python"
    import onemsdk
    
    menu = onemsdk.Menu(
        header='Myapp',
        body=[
            onemsdk.MenuItem(description='This is an option', src='http://techslides.com/demos/sample-videos/small.mp4', alt='alt text')
        ]
    )
    ```

    **Results**

    ```fence_native tab="SMS"
    <pre>
        #MYAPP
        A This is an option
        http://techslides.com/demos/sample-videos/small.mp4
        --Reply BACK
    </pre>
    ```

    ```fence_native tab="Web Widget"
    <img style="height:400px;width:auto" src="/assets/menu-video-option.png"/>
    ```


## Menu with video, no options

!!! example "Menu with video, no options"

    **Source**

    ```HTML tab="HTML"
    <section>
        <header>Myapp</header>
        <video src="http://techslides.com/demos/sample-videos/small.mp4" alt="alt text"></video>
    </section>
    ```

    ```javascript tab="NodeJS"
    const { Menu, MenuItem } = require('onemsdk');
    
    const menu = new Menu({
        header: 'Myapp',
        body: [
            new MenuItem({src: 'http://techslides.com/demos/sample-videos/small.mp4', alt:'alt text'})
        ]
    });
    ```
    
    ```python tab="Python"
    import onemsdk
    
    menu = onemsdk.Menu(
        header='Myapp',
        body=[
            onemsdk.MenuItem(src='http://techslides.com/demos/sample-videos/small.mp4', alt='alt text')
        ]
    )
    ```

    **Results**

    ```fence_native tab="SMS"
    <pre>
        #MYAPP
        http://techslides.com/demos/sample-videos/small.mp4
        --Reply BACK
    </pre>
    ```

    ```fence_native tab="Web Widget"
    <img style="height:400px;width:auto" src="/assets/menu-video.png"/>
    ```
