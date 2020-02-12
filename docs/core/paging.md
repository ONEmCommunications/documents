The amount of information displayed to the user can exceed the number of characters allowed by the SMS specifications. If the number of characters exceeds the amount configured for the current user (see [size verb](/core/reserved_verbs)), the ONEm platform will split the message into several messages called chunks.  Chunks can be considered as "pages".  Users can navigate between pages using [reserved verbs](/core/reserved_verbs).

At the end of each SMS message body, right before the footer, the ONEm Platform automaticaly adds information about current chunk and total number of chunks in which the message was split. This mechanism applies both to simple text, like a news article, and options lists that are too long to be displayed in one message:

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

User sends ```MORE``` then:

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
