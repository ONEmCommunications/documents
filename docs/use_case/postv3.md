It is recommended to first follow the tutorial for [#postv1](link aici) and [#postv2](link aici).

In version 3 of the #post micro-app we are going to enable users to send messages between them. To achieve this we can make use of the ONEM restdAPI.

First, we will need an API key to be able to authenticate our requests towards the restdAPI. Head over to the developer portal by clicking [here](https://developer-portal-poc.onem.zone/). First create the app then click on **Details** --> **API key & permissions**, check the **Notification** box and click on **Generate API key**:

![](/assets/api_key_screenshot.png)

Copy the freshly generated API key and head over to the settings file in our Django project:

```bash
onem@local:~$ cd ~/postv3/postv3/
```
Now we can edit the **settings.py** file located here and replace the value of the **APP_APIKEY_POC** variable with the key we have generated earlier:
```bash
# permissions granted for notification/messaging
APP_APIKEY_POC = 'W6LmGDsM.eca6e9e1-df2c-4307-bd75-8889a74e32f8'
```

Start the local server for your app:
```bash
onem@local:~$ cd ~/postv3
onem@local:~$ python manage.py runserver
```
Expose the server publicly:
```bash
ngrok http 8000
```

Go to `Test Client` section in the developer portal and send `#name-of-your-app`. This should be the name the app was given when we created earlier.
Now we simply have to look for posts from other users and select one of them for viewing:
```bash
#POST.TEST apartment for rent
Hi, offering a 90sqm, 2 bedrooms apartment for renting.
Message me for more details! 
Author: Milla 
Expires in: in 10 days, 19 hours
Code: 3z8d7m
Views: 5
A Send message
--Reply MENU/BACK
```

Send ``A`` and compose your message for the post owner. Behind the scene, your request will use ONEm's restdAPI to send the message. You can inspect the code in our **views.py** file in the **SendMessageView** class:
```bash
def post(self, request, id):
    message = request.POST['message']
    post = get_object_or_404(Post, id=id)

    headers = {'X-API-KEY': settings.APP_APIKEY_POC, 'Content-Type': 'application/json'}
    notify_url = settings.RESTD_API_URL_POC.format(endpoint='users/{}/notify').format(post.user.id)
    body = {
        'header': 'postv3 - {}'.format(post.title[:13]),
        'body': u'\n'.join([message, 'Sent by: {}'.format(self.get_user().username)]),
        'footer': 'Reply #postv3'
    }

    response = requests.post(url=notify_url, json=body, headers=headers)
    if response.status_code == 200:
        cache.set('msg_sent', True)
    else:
        cache.set('msg_not_sent', True)

    return HttpResponseRedirect(reverse('post_detail', args=[id]))
```
