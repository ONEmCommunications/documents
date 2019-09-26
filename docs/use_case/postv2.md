If not already done so, please first follow the tutorial for the **[postv1](/use_case/postv1/)** micro-app, to get a grasp on what it does, the prerequisites and some specific details of the ONEm SDK.


!!! Info
    This version adds the following:

    - persistent post storage in our local sqlite database
    - search capabilities


The `models.py` file describes our Post entity and its attributes.

```python
class Post(models.Model):
    user = models.ForeignKey(User, models.CASCADE)
    title = models.CharField(max_length=64)
    description = models.CharField(max_length=1024)
    code = models.CharField(max_length=16)
    created_at = models.DateTimeField()
    is_private = models.BooleanField(default=False)
    views = models.IntegerField()
    expires_at = models.DateTimeField()
```

The `AddPostView.post` method from `views.py` file was modified in order to store the posts in the database.

The relevant piece of code is the one below:

```python
class AddPostView(View):
    ...
    def post(self, request):
        ...
        new_post = Post.objects.create(
            user=self.get_user(),
            title=request.POST['title'],
            description=request.POST['description'],
            is_private=request.POST['is_private'],
            created_at=now,
            expires_at=expires_at,
            views=0,
        )
        ...
```

Let's run the below 2 commands in the root folder of our **postv2** app to create the schema migrations and the database tables:

```bash
python manange.py makemigrations
python manage.py migrate
```

As mentioned, in this version we've added a search capability. Let's look into the `SearchWizardView` class:

```python

class SearchWizardView(View):
    ...
    def get(self, request):
        form_items = [
            FormItem(type=FormItemType.string,
                     name='keyword',
                     description='Send code or keyword to search',
                     header='search',
                     footer='Send code or keyword')
        ]
        form = Form(body=form_items,
                    method='POST',
                    path=reverse('search_wizard'),
                    meta=FormMeta(confirmation_needed=False,
                                  completion_status_in_header=False,
                                  completion_status_show=False))
        return self.to_response(form)

    def post(self, request):
        key = request.POST['keyword']
        ...
```

Our form has only one form item in which we prompt the user with some input, be it a specific post code or a keyword to search for.

A `FormItem` has specific properties like `type`, `name`, `description` etc. Should we want further input from the user, we can simply add new `FormItem` items in the above list.

A `Form` contains the form items in the `body` attribute and requires a `path` so ONEm platform can perform an HTTP POST callback (as indicated in the `method` attribute) with a payload containing the user search term.

The `post` method grabs the `keyword` and handles the search logic. Worth mentioning here is that if we get multiple matches for the given keyword, we use a [`Menu`](/building/menu/) to present the results, otherwise we redirect to post detail.
