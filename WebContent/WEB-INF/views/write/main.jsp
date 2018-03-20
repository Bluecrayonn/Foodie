<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<!-- include libraries(jQuery, bootstrap) -->
		<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
		<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
		<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
		
		<!-- include summernote css/js -->
		<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
		<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>
		
		
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>Foodie</title>

		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
		<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
		<meta name="author" content="FREEHTML5.CO" />

		<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
		<link rel="shortcut icon" href="favicon.ico">
		<!-- Google Fonts -->
		<link href='https://fonts.googleapis.com/css?family=Nanum+Gothic'
			rel='stylesheet' type='text/css'>
		<!-- Animate -->
		<link rel="stylesheet" href="/templet/css/animate.css">
		<!-- Icomoon -->
		<link rel="stylesheet" href="/templet/css/icomoon.css">
		<!-- css  -->
		<link rel="stylesheet" href="/templet/css/style.css">
		<link rel="stylesheet" href="/templet/css/write_post.css">
	</head>
	<body>
		<form id="recipe_form" action="/foodie/write_confirm.do" method="post" enctype="multipart/form-data">
		  	<table class="ingredients">
		  		<tr>
		  			<td><label for="ig_name">재료명</label><input type="text" name="ig_name"></td>
		  			<td><label for="ig_amount">수량</label><input type="text" name="ig_amount"></td>
		  			<td><label for="ig_unit">단위</label><input type="text" name="ig_unit"></td>
			  		<!-- <td><a href="javascript:void(0);" onclick="ig_plus();">
			          	<span class="glyphicon glyphicon-plus-sign"></span>
			        </a></td>
			    	<td><a href="javascript:void(0);" onclick="ig_minus();">
	          			<span class="glyphicon glyphicon-minus-sign"></span>
	        		</a></td> -->
        		</tr>
        	</table>
			<label for="elapsedtime">소요시간</label><input type="text" name="elapsedtime"><label>분</label>
		  	<hr/>
		  	<div style="margin:0 auto; width: 150px; height: 150px; overflow: hidden">
				<img id="preview" src="/image/upload.png" style="border-radius: 10px; width: 150px; height: auto">
			</div>
			<input type="file" style="display: none" name="thumbnail" id="thumbnail" />
		  	
		  	<hr/>
		  	<div class="directions">
		  		<textarea id="summernote" name="editordata"></textarea>
		  	</div>
		  	<div class="wrapper" style="text-align:center; margin-top:20px">
		  		<button class="btn-primary" type="submit">작성완료</button>
		  	</div>
		</form>
	   	<script>
	   	
	   		$("#summernote").summernote({
		       	placeholder: '여기에 여러분의 레시피를 자유롭게 작성해보세요!',
				height: 600,
				fontNames : [ 'NanumGothic','맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
				fontNamesIgnoreCheck : [ 'NanumGothic' ],
				focus: true,
				
				callbacks: {
					onImageUpload: function(files, editor, welEditable) {
			            for (var i = files.length - 1; i >= 0; i--) {
			            	sendFile(files[i], this);
			            }
			        }
				}		   	
	   		});
		   	
	   		function ig_plus() {
		   		// this 사용
		   	}
		   	
		   	function ig_minus() {
		   		// this 사용
		   	}

		   	function sendFile(file, el) {
				var form_data = new FormData();
		      	form_data.append('file', file);
		      	$.ajax({
		        	data: form_data,
		        	type: "POST",
		        	url: '/foodie/write/insertimg.do',
		        	cache: false,
		        	contentType: false,
		        	enctype: 'multipart/form-data',
		        	processData: false,
		        	success: function(img_name) {
		        		console.log(typeof($(el)));
		        		console.log(img_name);
		        		$('#summernote').summernote('code');
		        	}
		      	});
		    }


		   	$(document).ready(function(){
			   	$("#thumbnail").change(function() {
			 		console.log(this.files[0]);
			  		if (!this.files[0].type.startsWith('image')) {
			  			window.alert("이미지 파일만 선택가능합니다.");
			  			this.value = "";
			  		} else {
			  			var reader = new FileReader();
			  			reader.readAsDataURL(this.files[0]);
			  			reader.onload = function() {
			  				$("#preview").attr("src", this.result);
			  			}
			  		}
			  	});
			  	$("#preview").click(function() {
			  		$("#thumbnail").click();
			  	});
		   	});
	    </script>
	</body>
</html>