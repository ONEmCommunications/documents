Every response message from ONEm Platform will have the following structure:

**HEADER** - each messages will have a header that indicates the name of the application and the section of the displayed content. This will allow users to get localised into the application serving as page title and/or breadcrumbs.

**BODY** - the body is the most important section of the message and handles the content being displayed to the user. It may consist of either a **Menu** or a **Form**. The end of the body will have the number of chunks remaining in the content selection. 

**FOOTER** - the footer is where information like 'hints' is attached to the bottom of the message, depending on the user's access channel. The footer contains hints and guidelines regarding next available actions.

Example:

<pre>
#ONEM MENU  <-- header -->
A My account
B Invite friends to chat
C Create SMS group chats (xGroup)
D Services
E How to use
--Reply A-E  <-- footer -->
</pre>
