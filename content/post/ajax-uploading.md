+++
date = "2011-03-30T00:00:00-04:00"
title = "AJAX Uploading"
aliases = [
  "/projects/2011/03/30/ajax-uploading.html",
  "/ajax-uploading/index.html"
]
+++


This guide is primarily aimed towards making an image uploader, but with a view changes it would work for just about anything.

## Markup

This part is entirely optional, but I feel that it really makes the interface much nicer so I like it.

File fields are ugly and difficult, if not impossible, to style properly.

### The HTML

```html
<div class="uploader">
	<input type="file" name="image" />
	<div class="img"></div>
	<button class="image-upload clean-gray">Upload Image</button>
</div>
```

### The CSS

```css
.uploader {
	float: left;
	width: 130px;
	height: 180px	;
	margin-left: 10px;
	text-align: center;
	overflow: hidden;
}

.uploader button {
	width: 130px;
	margin: 10px auto;
}

.uploader input {
	opacity: 0.0;
	position: absolute;
	width: 130px;
	height: 180px;
	cursor: pointer;
}

.uploader .img {
	float: right;
}
```

### The Javascript

```javascript
$(document).ready(function(){

	$('.uploader input[type=file]').hover(function(){
		$(this).siblings('button').toggleClass('hover');
	}).change(function(e){

		var $element = $(this);
		var button = $element.siblings('button.image-upload');
		button.text('Uploading...');
		var name = $(this).val(),
			file = e.currentTarget.files[0],
			xhr = new XMLHttpRequest();

		xhr.onreadystatechange = function(e){
			var response = e.target.responseText;
			if(response) {
				response = JSON.parse(response);
				console.log(response.$id);

				var placeholder = $element.siblings('div.img');
				var image = $element.siblings('img.img');

				if(placeholder.length) {
					image = $('<img />', {'class': 'img'})
					placeholder.after(image);
					placeholder.detach();
				}

				if(image.length) {
					image.attr({src: '/catalog/image/'+ response.$id });
				}

				$element.after($('<input />', {
					type: 'hidden',
					name: 'images[]',
					value: response.$id,
					'class': 'images'
				}));

				var button = $element.siblings('button.image-upload');
				button.text('Change Image');


			}
		};

		xhr.open('POST', '/catalog/image', true);

		xhr.setRequestHeader("X-File-Name", encodeURIComponent(name));
		xhr.setRequestHeader("Content-Type", "application/octet-stream");
		xhr.send(file);


	});

});
```
