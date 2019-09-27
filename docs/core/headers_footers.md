Every response message from ONEm Platform will have the following structure:

**HEADER** - each messages will have a header that indicates the name of the application and the section of the displayed content. This will allow users to get localised into the application serving as page title and/or breadcrumbs.

**BODY** - the body is the most important section of the message and handles the content being displayed to the user. It may consist of text or selectable options. The end of the body will have the number of chunks remaining in the content selection. Will explain the chunks later on. The body can display a **MENU**, a simple text or a **FORM**.

**FOOTER** - the footer is where information like 'hints' is attached to the bottom of the message. In here, users will find guidelines regarding next available actions.

All this might be more intuitive with an example from #onem application:

<pre>
#ONEM MENU
A My account
B Invite friends to chat
C Create SMS group chats (xGroup)
D Services
E How to use
--Reply A-E
</pre>
