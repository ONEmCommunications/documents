This initial version of the demo #post app will allow you to create and visualise your own post(s). It will also showcase examples of the ONEM's python SDK usage.

So let's activate our virtualenv and navigate to the **postv1** folder. Make sure that:

 - the database is created (even if we will store the posts in-memory).
 - local django server is started.
 - the server is exposed publicly.
 - the application is registered.
All of the above steps are explained in the [run locally](/getting_started/python_run_local/) section of the docs.

Now we can access the app from the test client. We should get the below menu:
```bash
#POSTV1 MENU
Please choose a username
--Send username
```

Send the desired username and we should be greeted with the landing menu:
```bash
#POSTV1
A Add post
B My posts
--Reply A-B
```

You can go ahead and create a post or two which you can later visualise in the **My post** section of the app.

Code-wise you can inspect the below classes from the *views.py* file:

 - *class AddPostView(View)* - used for creating a new post and caching it in-memory. This class uses the SDK's **Form** structure. A **Form** contains **FormItemsContent** items which have specific properties like **name**, **description**, **header** etc:
```
FormItemContent(type=FormItemContentType.string,
        name='title',
        description='Give your new post a title (maximum 64 characters)',
        header='add',
        footer='Reply with post title or BACK')
```
 - *class MyPostListView(View)* - to view the list of your created posts. We can see here the SDK's **Menu** structure in action. Each post is a **MenuItem** and togheter they are displayed as a **Menu**:

```
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


For **post v2** we are going to add a search functionality which will further explain how a **Form** works.
