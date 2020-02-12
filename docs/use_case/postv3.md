It is recommended to first follow the tutorial for [**#postv1**](/use_case/postv1/) and [**#postv2**](/use_case/postv2/).

In this version we are going to enable users to send messages between them. To achieve this we can make use of the ONEm API.

First, we will need an API key to be able to authenticate our requests towards the ONEm API. Head over to the [ONEm Developer Portal]({{ links.portal }}).

First create the app then click on **Details** --> **API key & permissions**, check the **Notification** box and click on **Generate API key**:

![](/assets/api_key_screenshot.png)

Copy the freshly generated API key and head over to the settings file in our Django project:

```bash
onem@local:~$ cd ~/postv3/postv3/
```

Now we can edit the `settings.py` file and replace the value of the `APP_APIKEY` variable with the key we have generated earlier:

<pre>
APP_APIKEY = '...'
</pre>

Start the local server for your app:

```bash
onem@local:~$ cd ~/postv3
onem@local:~$ python manage.py runserver
```

Expose the server publicly:

```bash
onem@local:~$ ./ngrok http 8000
```

Go to `Test Client` section in the developer portal and send `#name-of-your-app`. This should be the name as shown in the developer portal.

Now we simply have to look for posts from other users and select one of them for viewing:

<pre>
#POST.TEST apartment for rent
Hi, offering a 90sqm, 2 bedrooms apartment for renting.
Message me for more details! 
Author: Milla 
Expires in: in 10 days, 19 hours
Code: 3z8d7m
Views: 5
A Send message
--Reply MENU/BACK
</pre>

By choosing option `A` the app will allow you to compose your message for the post owner.

Behind the scene, your request will use ONEm API to send the message.

You can inspect the code in the `views.py` file in the `SendMessageView` class:

```python
class SendMessageView(View):
    ...
    def post(self, request, id):
        message = request.POST['message']
        post = get_object_or_404(Post, id=id)

        headers = {'X-API-KEY': settings.APP_APIKEY, 'Content-Type': 'application/json'}
        notify_url = settings.ONEM_API_URL.format(post.user.id)
        body = {
            'header': 'postv3 - {}'.format(post.title[:13]),
            'body': '\n'.join([message, 'Sent by: {}'.format(self.get_user().username)]),
            'footer': 'Reply #postv3'
        }

        response = requests.post(url=notify_url, json=body, headers=headers)
        if response.status_code == 200:
            cache.set('msg_sent', True)
        else:
            cache.set('msg_not_sent', True)

        return HttpResponseRedirect(reverse('post_detail', args=[id]))
```

The post owner will receive the notification as follows:

<pre>
#POSTV3 - apartment for rent
Hello, I am interested in renting your apartment!
Can you let me know what your telephone number is ?
Sent by: John
--Reply #postv3
</pre>
