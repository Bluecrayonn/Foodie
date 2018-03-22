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
		<link rel="stylesheet" href="/css/write_post.css">
		<script src="/js/functions.js"></script>
	</head>
	<body>
		<form id="recipe_form" action="/foodie/write_confirm.do" method="post" enctype="multipart/form-data">
		  	<table>
		  		<tr><td><label class="lb_recipe" for="title">요리명</label><input id="title" type="text" name="title"></td></tr>
				<tr><td><label class="lb_recipe" for="elapsedtime">소요시간</label><input type="number" min="1" max="999" value="0" name="elapsedtime"><label>분</label></td></tr>
		  	<tbody id="ingredients">
		  		<tr id="dummy_row" style="display:none;">
		  			<td><label class="lb_recipe" for="ig_name">재료명</label><input type="text" name="ig_name" disabled></td>
		  			<td><label class="lb_recipe" for="ig_amount">수량</label><input type="text" name="ig_amount" disabled></td>
		  			<td><label class="lb_recipe" for="ig_unit">단위</label>
		  			<select name="ig_unit" disabled>
		  				<option value="개">개</option>
		  				<option value="g">g</option>
		  				<option value="kg">kg</option>
		  				<option value="ml">ml</option>
		  				<option value="l">l</option>
		  				<option value="스푼">스푼</option>
		  				<option value="티스푼">티스푼</option>
		  			</select></td>
				</tr>        			
        		<tr class="ig_row">
		  			<td><label class="lb_recipe" for="ig_name">재료명</label><input type="text" name="ig_name"></td>
		  			<td><label class="lb_recipe" for="ig_amount">수량</label><input type="text" name="ig_amount"></td>
		  			<td><label class="lb_recipe" for="ig_unit">단위</label>
		  			<select name="ig_unit">
		  				<option value="개">개</option>
		  				<option value="g">g</option>
		  				<option value="kg">kg</option>
		  				<option value="ml">ml</option>
		  				<option value="l">l</option>
		  				<option value="스푼">스푼</option>
		  				<option value="티스푼">티스푼</option>
		  			</select>
		  			<td id="only_one"><a href="javascript:void(0);" onclick="ig_add();">
			          	<span class="glyphicon glyphicon-plus-sign"></span>
			        </a><a href="javascript:void(0);" onclick="ig_remove();">
	          			<span class="glyphicon glyphicon-minus-sign"></span>
	        		</a>
	        		</td>	        		
        		</tr>
        	</tbody>
		  	</table>
			<hr/>
		  	<div style="margin:0 auto; width: 150px; height: 150px; overflow: hidden">
				<img id="preview" src="/image/upload.png" style="border-radius: 10px; width: 150px; height: auto">
			</div>
			<input type="file" style="display: none" accept="image/*" name="thumbnail" id="thumbnail" />
		  	
		  	<hr/>
		  	<div class="directions">
		  		<textarea id="summernote" name="editorcontent"></textarea>
		  	</div>
		  	<div class="wrapper" style="text-align:center; margin-top:20px">
		  		<button class="btn-primary" type="submit" onclick="write_confirm()">작성완료</button>
		  	</div>
		  	<div class="wrapper" style="text-align:center; margin-top:20px">
		  		<button class="btn-primary" type="button" onclick="write_confirm()">작성완료</button>
		  	</div>
		</form>
	   	<script>
	   	
	   		$("#summernote").summernote({
	   			// TOOLBAR REFERENCES > https://summernote.org/deep-dive/#custom-toolbar-popover
		       	placeholder: '여기에 여러분의 레시피를 자유롭게 작성해보세요!',
				height: 600,
				fontNames : [ 'NanumGothic','맑은고딕', 'Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', ],
				fontNamesIgnoreCheck : [ 'NanumGothic' ],
				focus: true,
				toolbar: [
				    // [groupName, [list of button]]
				    ['style', ['bold', 'italic', 'underline', 'clear']],
				    ['font', ['strikethrough', 'fontname', 'fontsize']],
				    ['color', ['color']],
				    ['para', ['ul', 'ol', 'paragraph']],
				    ['height', ['height']],
				    ['insert',['picture','link']]
				  ],
	   			
				callbacks: {
					onImageUpload: function(files, editor, welEditable) {
			            for (var i = files.length - 1; i >= 0; i--) {
			            	sendFile(files[i], this);
			            }
			        }
				}		   	
	   		});
		   	
	   		function write_confirm() {
	   			// 비어있지만 않으면 오케이
	   			if($("#title").val().trim() == "") {
	   				window.alert("제목입력해라");
	   				return;
	   			}
	   			if($("#thumbnail").val() == "") {
	   				window.alert("썸네일 꼭올려라");
	   				return;
	   			}
	   			if($('#summernote').summernote('code')
								   .replace(/<\/?[^>]+(>|$)/g, "")
								   .replace(/\s|&nbsp;/g, '')
								   .length == 0) {
	   				window.alert("내용이 없다");
	   				return;
	   			}
	   			
	   			var flag = false;
	   			$(".ig_row").each(function() {
	   				// 최소한 재료명 하나는 적혀있어야함
	   				console.log();
	   				if($(this).find("input[name='ig_name']").val().length!=0) {
	   					flag = true;
	   				}
	   			});
	   			
	   			if(flag) {
	   				$("#recipe_form").submit();
	   			} else {
	   				window.alert("재료 최소한 한개는 넣어주세요");
	   				return;
	   			}
	   				
	   		}
	   		
	   		function ig_add() {
				var cloneRow = $("#dummy_row").clone();
				cloneRow.find("input").each(function() {
					$(this).prop("disabled", false);
				});
				cloneRow.find("select").each(function() {
					$(this).prop("disabled", false);
				});
				cloneRow.attr("id","");
				cloneRow.attr("class","ig_row");
				cloneRow.appendTo($("#ingredients"));
				cloneRow.css("display","");
				$("#only_one").appendTo(cloneRow);
		   	}
		   	
		   	function ig_remove() {
		   		if($(".ig_row").length > 1) {
		   			console.log($(".ig_row").length);
			   		$("#only_one").appendTo($(".ig_row:last").prev());
			   		$(".ig_row:last").remove();
		   		}
		   	}

		   	function sendFile(file, el) {
		   	// 여기서 file을 리사이징
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
		        	success: function(img_path) {
		        		$(el).summernote('insertImage',img_path);
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