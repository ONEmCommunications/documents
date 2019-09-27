Let's get back to message body.

The amount of information displayed to the user, along with header and footer, can exceed the sms size. In this case, the ONEm platform will split body information in several messages called chunks, adding a paging system that allows users to access more than can fit one single SMS.

At the end of each sms body, right before the footer, there will be automatically added information about current chunk and total number of chunks in which the message was split. This mechanism applies both to simple text, like a news article, and options lists that are too long to be displayed in one message.

A relevant example for this mechanism can be extracted from our `#wiki` micro app. The article's introduction about SMS is paginated in 8 chunks and the first 2 are presented below. The hint from footer, _"more"_, is used to navigate to the next chunk.

<pre>
#WIKI (ENGLISH) SMS SEARCH
SMS (short message service)
is a text messaging service
component of most telephone,
Internet, and mobile device
systems. It uses
standardized
..1/8
--MORE/BACK
</pre>

_more_

<pre>
communication protocols to
enable mobile devices to
exchange short text
messages.
An intermediary service can
facilitate a text-to-voice
conversion to be sent to
landlines.
SMS was
..2/8
--MORE/BACK
</pre>
