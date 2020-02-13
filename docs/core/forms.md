This section provides some worked examples of different form layouts.  Refer to the [form reference](/building/form) for a complete description of the available features.

## Basic form

!!! example "Basic form"

    **Source**

    ```HTML tab="HTML"
    <form action="/todoAdd" header="Todo form" skip-confirmation method="post">
        <section name="description" required>
            <header>DESCRIPTION</header>
            <p>Provide a description for the task</p>
            <input type="text" />
            <footer>Reply with description or BACK</footer>
        </section>
        <section name="dueDate" required>
            <header>DUE DATE</header>
            <p>Provide a due date</p>
            <input type="date" />
            <footer>Reply with due date</footer>
        </section>
    </form>
    ```

    ```javascript tab="NodeJS"
    const { Response, Form, FormItem } = require('onemsdk');
    
    const form = new Form({
        header: 'Todo form',
        meta: { skip_confirmation: true },
        method: 'POST',
        path: '/todoAdd',
        body: [
            new FormItem({
                type: 'string',
                name: 'description',
                header: 'DESCRIPTION',
                description: 'Provide a description for the task',
                required: true,
                footer: 'Reply with description or BACK'
            }),
            new FormItem({
                type: 'date', 
                name: 'dueDate', 
                header: 'DUE DATE', 
                description: 'Provide a due date', 
                required: true, 
                footer: 'Reply with due date'
            }),
        ]
    });
    const response = new Response(form).toJSON()
    ```
    
    ```python tab="Python"
    import onemsdk
    from onemsdk.schema.v1 import (
        Form, FormItem, FormItemType, FormMeta
    )

    form = Form(
        header='Todo form',
        path='/todoAdd',
        meta=FormMeta(skip_confirmation=True),
        method='POST',
        body = [
            FormItem(
                type=FormItemType.string,
                required=True,
                name='description',
                description='Please provide a description for the task',
                header='DESCRIPTION',
                footer='Reply with description or BACK',
            ),
            FormItem(
                type=FormItemType.date,
                required=True,
                name='due_date',
                description='Provide a due date',
                header='DUE DATE',
                footer='Reply with due date',
            ),
        ]
    )
    ```

    **Results**

    ```fence_native tab="SMS"
    <img style="height:400px;width:auto" src="/assets/basic_form_sms.gif"/>
    ```

    ```fence_native tab="Web Widget"
    <img style="height:400px;width:auto" src="/assets/basic_form.gif"/>
    ```