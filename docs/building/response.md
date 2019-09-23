Every request made by ONEm platform towards a micro app must result in an HTTP response with json content.

<span style="font-size:13px;">_All fields prefixed with a star (*) are required_</span>

## Response
Root component wrapping a `Menu` or a `Form`

| KEY | TYPE | NOTES |
|-----|------|-------|
|*content|object|The content of the response. Either `Form` or a `Menu`|
|*content_type|string|The content type of the response<br> _available: `"form", "menu"`_|

