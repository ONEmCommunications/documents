If not already done so, please first follow the tutorial for the **postv1** app [here](/use_case/postv1), to get a grasp on what this micro-app does, the prerequisites and some specific details of the ONEm SDK.

We are now going to save/store our posts in a local database, instead of the non-persistent cache. The **models.py** file describes our Post entity and its attributes:

```bash
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

This model will be used to create a table in a local lightweight sqlite database - let's run the below 2 commands in the root folder of our **postv2** app:
```bash
python manange.py makemigrations
```
and after:
```
python manage.py migrate
```

Next, if we look at the changes in the **views.py** file we can notice the post is no longer saved/retrieved from cache(as we did in **postv1**), but in/from the database:
```bash
new_post = Post.objects.create(
    user=self.get_user(),
    title=request.POST['title'],
    description=request.POST['description'],
    is_private=request.POST['is_private'],
    created_at=now,
    expires_at=expires_at,
    views=0
)
new_post.save()
```


As mentioned, in this version we introduce a search capability. Let's look into the **SearchWizard** view class:
```bash
def get(self, request):
    form_items = [
        FormItem(type=FormItemType.string,
                 name='keyword',
                 description='Send code or keyword to search',
                 header='search',
                 footer='Send code or keyword')
    ]
```
Our search 'wizard' has only 1 step in which we request the user's input, be it a specific post code or a keyword to search for.
In the ONEm SDK we call such step a **FormItem**, much like in the web world we fill in a form which asked us for our name.(one step only) A **FormItem** has specific properties like `type`, `name`, `description` etc. Should we want further input from the user, we can simply add new **FormItem**s in the above list.

To prepare this form for processing, we instatiate a **Form** class using the previously described **FormItem** item(s), along with other details like the http method to be used, the path to be used for the redirection(meaning where we will proccess the user's input) and some meta information:

```bash
form = Form(body=form_items,
            method='POST',
            path=reverse('search_wizard'),
            meta=FormMeta(confirmation_needed=False,
                          completion_status_in_header=False,
                          completion_status_show=False))
```

Further, our code redirects us to the `post(self, request)` method in this **SearchWizardView** class where we check if the input is a post code or a keyword. We inspect the database and get back with an answer for the user's request. Worth mentioning here is that if we get multiple matches for the given keyword, we use the ONEm's SDK **Menu** structure and add the results as **MenuItem**s, then render this menu for the user to select the desired result:
```bash
if posts:
    if len(posts) == 1:
        return HttpResponseRedirect(reverse('post_detail', args=[posts[0].id]))

    footer = u'Select an option'
    for post in posts:
        menu_items.append(
            MenuItem(description=u'{}..'.format(post.title[:15]),
                     method='GET',
                     path=reverse('post_detail', args=[post.id]))
        )
else:
    menu_items.append(
        MenuItem(description='There are no posts matching your keyword.')
    )
    footer = u'Reply MENU'
content = Menu(body=menu_items, header='search', footer=footer)

return self.to_response(content)
```
