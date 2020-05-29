A card can be used to display mixed content, together with optional actions, in a visually appealing way.

<div style="text-align:center">
 <img style="height:auto;width:auto" src="/assets/snackbar.png"/>
</div>

## JSON Structure

<span style="font-size:13px;">_All fields prefixed with a star (*) are required_</span>


## Snackbar
Snackbars inform users of a process that has been performed or that the micro-app will perform. They don't interrupt the user experience, and they don’t require user input, although a snackbar can contain an optional action.

| KEY | TYPE | NOTES |
|-----|------|-------|
|message|string|The content of the snackbar|
|severity|string|Default `info`.  Possible values `info`, `warn`, `error` or `success`|
|name|string|Name of the action button|
|path|string|Path for the callback action|
|method|string|Method to use when path is specified, defaults to `GET`|
|meta|object|[`SnackbarMeta`](#snackbarmeta) object. Contains configuration flags|


### SnackbarMeta
[`Snackbar`](#snackbar) related component holding configuration fields for the snackbar

| KEY | TYPE | NOTES |
|-----|------|-------|
|auto_hide_duration|number|Time to wait (in ms) until the Snackbar should be automatically closed.  If not supplied, zero or null, the default system value applies (usually 7s)|


### Swagger

The schema can also be found on Swagger Hub [here]({{ links.schema_url }})

### JSON Example

<div style="max-height:300px;overflow:auto;">
```javascript
{
	message: 'Marked as done',
	severity: 'info',
	name: 'Undo',
	path: '/todo/1234/undoDone',
	method: 'post',
	meta: {
		auto_hide_duration: 8000
	}
}
```
</div>