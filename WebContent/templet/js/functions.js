/**
 * 
 */
var resizeImage = function(img, MAX_WIDTH, MAX_HEIGHT) {
	var canvas = document.createElement("canvas");
	var ctx = canvas.getContext("2d");
	ctx.drawImage(img, 0, 0);

	var width = img.width;
	var height = img.height;

	if (width > height) {
	  if (width > MAX_WIDTH) {
	    height *= MAX_WIDTH / width;
	    width = MAX_WIDTH;
	  }
	} else {
	  if (height > MAX_HEIGHT) {
	    width *= MAX_HEIGHT / height;
	    height = MAX_HEIGHT;
	  }
	}
	canvas.width = width;
	canvas.height = height;
	var ctx = canvas.getContext("2d");
	ctx.drawImage(img, 0, 0, width, height);
	return canvas;
};