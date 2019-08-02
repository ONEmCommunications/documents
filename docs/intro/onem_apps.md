## Let's dig further into the anatomy of a ONEm application

Before dissecting the structure of applications, keep in mind that SMS does not facilitate the use of images or media files as web does. Though ONEm applications work also over internet, we offer users the same experience and interface.

A standard SMS is 140 8bit characters. For full compatibility the applications should display the information to the users in one SMS.
<!-- Since smart phones can display up to 5 messages, we offer the possibility to each user to change the acceptable size of the SMS they are willing to receive at one time using 'size' setting. -->

As explained in the previous section, the web-address is transposed to #application_name.
A website/web application provides pages, navigation system, hints and, most important, content. Let's see how those are translated to a ONEm application.

Every response message from ONEm Platform will have the following structure:

**HEADER** - each messages will have a header that indicates the name of the application and the section of the displayed content. This will allow users to get localised into the application serving as page title and/or breadcrumbs.

**BODY** - the body is the most important section of the message and handles the content being displayed to the user. It may consist of text or selectable options. The end of the body will have the number of chunks remaining in the content selection. Will explain the chunks later on. The body can display a **MENU**, a simple text or a **FORM**.

**FOOTER** - the footer is where information like 'hints' is attached to the bottom of the message. In here, users will find guidelines regarding next available actions.

All this might be more intuitive with an example from #onem application:
```
#ONEM MENU
A My account
B Invite friends to chat
C Create SMS group chats (xGroup)
D Services
E How to use
--Reply A-E
```
The above message is the landing page of #onem application, also considered the main menu. The first message presents user with the main options that can be accessed and offers a navigation possibility.
As you probably figured out, the user can access account information, chat with friends, see available services or follow a tutorial on how to use ONEm features. Each available option has a letter attached to it to facilitate user response. As hinted in the footer, the user can send one of the letters to access the corresponding menu item. This is the **MENU** concept. Each option is displayed on a new line and has associated an action to it that will result in another message displayed to the user.

Let's follow on the example and say that the user will choose to reply to ONEm Platform with a message containing ```D``` letter. This translates in choosing to access menu item D, available services and the Platform's response will be a list of available service categories. Notice the header changed and so did the hints in the footer.
```
#ONEM SERVICES
A Search
B Information
C Tools
D Business
E Entertainment
F Social
--Reply option/"#"
```

Let's get back to message body. The amount of information displayed to the user, along with header and footer, can exceed the sms size. In this case, the ONEm platform will split body information in several messages called chunks, adding a paging system that allows users to access more than can fit one single SMS. At the end of each sms body, right before the footer, there will be automatically added information about current chunk and total number of chunks in which the message was split. This mechanism applies both to simple text, like a news article, and options lists that are too long to be displayed in one message.

A great example for this mechanism can be extracted from our #wiki application. The article's introduction about SMS is paginated in 8 chunks and the first 2 are presented below. The hint from footer - "more" - is used to navigate to the next chunk.
```
#WIKI (ENGLISH) SMS SEARCH
SMS (short message service) is a text messaging service component of most telephone, Internet, and mobile device systems. It uses standardized
..1/8
--MORE/BACK

>> more

communication protocols to enable mobile devices to exchange short text messages. An intermediary service can facilitate a text-to-voice conversion to be sent to landlines.
SMS was
..2/8
--MORE/BACK
```
Another important topic to talk about regards capturing user input. Any webpage or web application will present users with a form to complete and submit. This is rather difficult in the SMS version of ONEm applications, but getting help from wizards, forms are completed step by step, each form field translates in a new message asking user for a free response or choose from a list of options. When all information is gathered, the user can review and submit the form through a supplementary confirmation step. No worries, we dedicated an entire section to forms and how you can create one [here][
<!-- Link to Building section, Forms  -->
]

To see all these concepts at work, with real ONEm examples, and much more you can watch this Platform Demo
<!-- video here about services and how they work -->

# What are ONEm apps?

The ONEm Framework provides a set of APIs and tools that allow you to rapidly build local or global SMS and web based applications that solve a myriad of business problems.
ONEm Framework is a layer on top of ONEm's cloud-based Platform that provides SMS connectivity to mobile networks around the globe.
Once you register as a developer, based on ONEm principles, you can create your own application and reach the ONEm ecosystem.

The great thing about ONEm Framework is that you can use your favourite programming language and with one codebase, quickly deploy an easy-to-use, dynamic application that is instantly available on SMS and the Web.
