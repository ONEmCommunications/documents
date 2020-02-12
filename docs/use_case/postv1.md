This initial version of the demo #post app will allow you to create and visualise your own post(s). It will also showcase examples of the ONEM's python SDK usage.

So let's navigate to the **postv1** folder and create/activate our virtual environment:

```bash
onem@local:~$ cd ~/postv1 ; pipenv shell --python 3.7
```


Also please make sure that:

 - the database is created (even if we will store the posts in-memory).
 - local django server is started.
 - the server is exposed publicly.
 - the application is registered.
All of the above steps are explained in the [run locally](/getting_started/python_run_local/) section of the docs.


To register your application please open [ONEm Developer Portal]({{ links.portal }}) and register for a free account.

Once that is done, you will have an option to create an app. Hit that button and place the url obtaine from ngrok as the callback url.

In the [ONEm Developer Portal]({{ links.portal }}) there is a `Test Client` section. This is a phone simulator from where you can test the app.
We can now access the application by placing a hashtag in front of the name. So let's send: `#name-of-your-app`

<pre>
#POSTV1 MENU
Please choose a username
--Send username
</pre>

Send the desired username and we should be greeted with the landing menu:

<pre>
#POSTV1
A Add post
B My posts
--Reply A-B
</pre>

_*the name of your app will be different, as chosen in the developer portal_

You can go ahead and create a post or two which you can later visualise in the **My post** section of the app.

Code-wise you can inspect the below classes from the *views.py* file:

 - *class AddPostView(View)* - used for creating a new post and caching it in-memory. This class uses the SDK's **Form** structure. A **Form** contains **FormItems** items which have specific properties like **name**, **description**, **header** etc:
```python
FormItemContent(
    type=FormItemContentType.string,
    name='title',
    description='Give your new post a title (maximum 64 characters)',
    header='add',
    footer='Reply with post title or BACK'
)
```
 - *class MyPostListView(View)* - to view the list of your created posts. We can see here the SDK's **Menu** structure in action. Each post is a **MenuItem** and togheter they are displayed as a **Menu**:
```python
posts = cache.get('posts')                                              
if posts:                                                               
    for post in posts:                                                  
        menu_items.append(                                              
            MenuItem(description=u'{}..'.format(post['title'][:15]),    
                     method='GET',                                      
                     path=reverse('post_detail', args=[post['code']]))  
        )                                                               
else:                                                                   
    menu_items.append(                                                  
        MenuItem(description='You currently have no posts.')            
    )                                                                   
content = Menu(body=menu_items, footer='Reply MENU') 
```

 - *class PostDetailView(View)* - to show details of the selected post. Again, a **Menu** structure is used for achieving this.

For each of these classes you can modify the code to add new items, remove them, show different labels etc and see the result by saving these changes and revisiting the app in the test client.


For **[postv2](/use_case/postv2/)** we are going to add a search functionality which will further explain how a **Form** works and also store our posts in a lightweight local database.
