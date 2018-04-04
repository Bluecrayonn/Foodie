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

var BstrapModal = function(title, body, buttons) {
	var title = title || "my modal function", body = body
			|| "I can make modal dynamically", buttons = buttons || [ {
		Value : "CLOSE",
		Css : "btn-primary",
		Callback : function(event) {
			BstrapModal.Close();
		}
	} ];
	var GetModalStructure = function() {
		var that = this;
		that.Id = BstrapModal.Id = Math.random();
		var buttonshtml = "";
		for (var i = 0; i < buttons.length; i++) {
			if (buttons[i].isSubmitBtn) {
				buttonshtml += "<button type='submit' role='submit' class='btn "
					+ (buttons[i].Css || "") + "' name='btn" + that.Id + "'>"
					+ (buttons[i].Value || "CLOSE") + "</button>";
			} else {
				buttonshtml += "<button type='button' class='btn "
					+ (buttons[i].Css || "") + "' name='btn" + that.Id + "'>"
					+ (buttons[i].Value || "CLOSE") + "</button>";
			}
		}
		return "<div class='modal fade' name='dynamiccustommodal' id='"
				+ that.Id
				+ "' tabindex='-1' role='dialog' aria-labelledby='"
				+ that.Id
				+ "Label'><div class='modal-dialog'><div class='modal-content'><div class='modal-header' style='border:none'><button type='button' class='close modal-white-close' data-dismiss='modal' onclick='BstrapModal.Close()'><span aria-hidden='true'>&times;</span></button><h4 class='modal-title'>"
				+ title
				+ "</h4></div><div class='modal-body'><div class='row'><div class='col-xs-12 col-md-12 col-sm-12 col-lg-12'>"
				+ body
				+ "</div></div></div><div class='modal-footer bg-default' style='border:none'><div class='col-xs-12 col-sm-12 col-lg-12'>"
				+ buttonshtml + "</div></div></div></div></div>";
	}();
	BstrapModal.Delete = function() {
		var modals = document.getElementsByName("dynamiccustommodal");
		if (modals.length > 0)
			document.body.removeChild(modals[0]);
	};
	BstrapModal.Close = function() {
		$(document.getElementById(BstrapModal.Id)).modal('hide');
		BstrapModal.Delete();
	};
	this.Show = function() {
		BstrapModal.Delete();
		document.body.appendChild($(GetModalStructure)[0]);
		var btns = document.querySelectorAll("button[name='btn"
				+ BstrapModal.Id + "']");
		for (var i = 0; i < btns.length; i++) {
			btns[i].addEventListener("click", buttons[i].Callback
					|| BstrapModal.Close);
		}
		$(document.getElementById(BstrapModal.Id)).modal('show');
	};
};

var hasOwnProperty = Object.prototype.hasOwnProperty;

function isEmpty(obj) {

    // null and undefined are "empty"
    if (obj == null) return true;

    // Assume if it has a length property with a non-zero value
    // that that property is correct.
    if (obj.length > 0)    return false;
    if (obj.length === 0)  return true;

    // If it isn't an object at this point
    // it is empty, but it can't be anything *but* empty
    // Is it empty?  Depends on your application.
    if (typeof obj !== "object") return true;

    // Otherwise, does it have any properties of its own?
    // Note that this doesn't handle
    // toString and valueOf enumeration bugs in IE < 9
    for (var key in obj) {
        if (hasOwnProperty.call(obj, key)) return false;
    }

    return true;
}