A card can be used to display mixed content, together with optional actions, in a visually appealing way.

<div style="text-align:center">
 <img style="height:auto;width:auto" src="/assets/card.png"/>
</div>

## JSON Structure

<span style="font-size:13px;">_All fields prefixed with a star (*) are required_</span>


## Card
A top level component used to display a menu or raw text

| KEY | TYPE | NOTES |
|-----|------|-------|
|header|object|A [`CardHeader`](#cardheader) object|
|src|string|Link to public url for card media (image, mp4, youtube or vimeo)|
|title|string|Card title in main card body|
|subtitle|string|Card subtitle in main card body|
|description|string|Card content in main card body|
|actions|array|Array of [`CardAction`](#cardaction) objects|
|action_label|string|Label for the select option on SMS|


### CardHeader
[`Card`](#card) related component used to display a header within a card

| KEY | TYPE | NOTES |
|-----|------|-------|
|*title|string|Card title of the card header|
|subtitle|string|Card subtitle of the card header|
|avatar|object|A [`CardAvatar`](#cardavatar) object|


### CardAvatar
[`CardHeader`](#cardheader) related component holding details about the avatar to be displayed
 
| KEY | TYPE | NOTES |
|-----|------|-------|
|src|string|Link to public url of avatar image|
|name|string|Name of the avatar to be used as a fallback in case image is not provided or accessible|


### CardAction
[`Card`](#card) related component providing an action button within a card

| KEY | TYPE | NOTES |
|-----|------|-------|
|name|string|Name of the action button|
|path|string|Path for the callback action|
|method|string|Method to use when path is specified, defaults to `GET`|

### Swagger

The schema can also be found on Swagger Hub [here]({{ links.schema_url }})

### JSON Example

<div style="max-height:300px;overflow:auto;">
```javascript
{
	header: {
		title: 'Our new product line',
		subtitle: 'kritter, 7 days ago',
		avatar: {
			src: 'https://image.png',
			name: 'chris horn'
		}
	},
	src: 'https://example.com/assets/bike.png',
	title: 'Our new product line',
	subtitle: null,
	description: 'A motorcycle, often called a motorbike, bike, or cycle is a two- or three-wheel...',
	actions: [{
		name: 'Read more',
		path: '/path/read/more',
		method: 'get'
	}, {
		name: 'Like (1)',
		path: '/path/like',
		method: 'post'
	}],
	action_label: 'Select'
}
```
</div>