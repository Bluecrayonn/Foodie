<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	.textbox {
  box-shadow: none;
  background: transparent;
  border: 2px solid rgba(0, 0, 0, 0.1);
  height: 54px;
  font-size: 18px;
  font-weight: 300;
  border-radius: 5px;
}
	.textbox:active, .textbox:focus {
  outline: none;
  box-shadow: none;
  border-color: #f7c873;
}
</style>

	<c:set value="${post ne null && post != ''}" var="isMod" />
	<c:set value="개|g|kg|ml|l|스푼(3g)|티스푼(10g)" var="units" />
	<c:set
		value='data-toggle="confirmation" data-singleton="true" data-pop-out="true" data-title="데이터베이스에 등록되어 있지 않는 재료입니다. 재료를 등록해주시겠어요?" data-btn-ok-label="네" data-btn-cancel-label="아니오"'
		var='confirmPopover' />

	<div class="">
		<c:if test="${isMod}">페이지 수정</c:if>
	</div>
	
	<div class="modal fade" id="requiredmodal" role="dialog">
		<div class="modal-dialog modal-sm">
			<!-- sign up Modal content-->
			<div class="modal-content">
				<div class="modal-header">
				    <button type="button" class="close" data-dismiss="modal">&times;</button>
          			<h4 class="modal-title" align="center">입력이 필요합니다.</h4>
				    <div class="modal-body">
						<p class="text requiredmsg" align="center">입력필요</p>
			        </div>
			        <div class="modal-footer">
			          	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
			        </div>
				</div>
			</div>
		</div>
	</div>	
	
	<form id="recipe_form" action="/foodie/write/confirm.do" method="post"
		enctype="multipart/form-data">
		<div class="form-group" style="margin: 0 auto">
			<div class="row">
				<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-centered">
					<label class="lb_recipe col-xs-7 col-sm-7 col-md-7 col-lg-7"
						for="title">요리명</label>
					<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
					<label class="lb_recipe col-xs-2 col-sm-2 col-md-2 col-lg-2"
						for="elapsedtime">소요시간</label>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-centered">
					<input class="col-sm-7 col-xs-7 col-md-7 col-lg-7 form-control" id="title"
						type="text" name="title" value="${post.TITLE }" style="width: 600px">
					<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
					<div class="col-sm-2 col-xs-2 col-md-2 col-lg-2">
						<input type="number" min="1" max="999" class="textbox"
							value="${post.ELAPSEDTIME }" name="elapsedtime" style="margin-left: 30px;"><label>분</label>
					</div>
				</div>
			</div>
			<hr />
			<div id="ingredients">
				<div class="row ig_head">
					<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-centered">
						<label class="col-sm-4 col-xs-4 col-md-4 col-lg-4 lb_recipe">재료명</label>
						<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
						<label class="col-sm-2 col-xs-2 col-md-2 col-lg-2 lb_recipe">수량</label>
						<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
						<label class="col-sm-2 col-xs-2 col-md-2 col-lg-2 lb_recipe">단위</label>
					</div>
				</div>
				<div class="row" id="dummy_row" style="display: none;">
					<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-centered">
						<input class="col-sm-4 col-xs-4 col-md-4 col-lg-4 ig_name textbox"
							type="text" name="ig_name" ${confirmPopover} disabled>
						<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
						<input class="col-sm-2 col-xs-2 col-md-2 col-lg-2  textbox" type="text"
							name="ig_amount" disabled>
						<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
						<select class="col-sm-2 col-xs-2 col-md-2 col-lg-2  textbox" name="ig_unit"
							disabled>
							<c:forTokens items="${units}" delims="|" var="unit">
								<option value="${unit}">${unit}</option>
							</c:forTokens>
						</select>
					</div>
				</div>
				<c:choose>
					<c:when test="${ingredient ne null && ingredient != ''}">
						<c:forEach var="item" items="${ingredient}" varStatus="status">
							<div class="ig_row row">
								<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-centered">
									<input class="col-sm-4 col-xs-4 col-md-4 col-lg-4 ig_name"
										type="text" name="ig_name" value="${item.name}"
										${confirmPopover}>
									<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
									<input class="col-sm-2 col-xs-2 col-md-2 col-lg-2 ig_amount"
										type="text" name="ig_amount" value="${item.qty}">
									<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
									<select class="col-sm-2 col-xs-2 col-md-2 col-lg-2 ig_unit"
										name="ig_unit">
										<c:forTokens items="${units}" delims="|" var="unit">
											<option value="${unit}"
												${item.unit == unit ? "selected=selected'" : ""}>${unit}</option>
										</c:forTokens>
									</select>
								<c:if test="${status.last}">
								<div class="col-sm-1 col-xs-1 col-md-1 col-lg-1" id="only_one">
									<a href="javascript:void(0);" onclick="ig_add();"> <span
										class="icon-squared-plus"></span>
									</a><a href="javascript:void(0);" onclick="ig_remove();"> <span
										class="icon-squared-minus"></span>
									</a>
								</div>
								</c:if>
								</div>
							</div>
							<!-- ig_row end -->
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div class="ig_row row">
							<div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 col-centered">
								<input class="col-sm-4 col-xs-4 col-md-4 col-lg-4 ig_name textbox"
									type="text" name="ig_name" ${confirmPopover}>
								<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
								<input class="col-sm-2 col-xs-2 col-md-2 col-lg-2 ig_amount textbox"
									type="text" name="ig_amount">
								<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
								<select class="col-sm-2 col-xs-2 col-md-2 col-lg-2 ig_unit textbox"
									name="ig_unit">
									<c:forTokens items="${units}" delims="|" var="unit">
										<option value="${unit}">${unit}</option>
									</c:forTokens>
								</select>
								
							<div class="col-sm-1 col-xs-1 col-md-1 col-lg-1" id="only_one" style="margin-top: 10px;">
								<a href="javascript:void(0);" onclick="ig_add();"> <span
									class="icon-squared-plus"></span>
								</a><a href="javascript:void(0);" onclick="ig_remove();"> <span
									class="icon-squared-minus"></span>
								</a>
							</div>	
							</div>					
						</div>
						<!-- ig_row end -->
					</c:otherwise>
				</c:choose>
			</div>
			<!-- ingredients end -->
		</div>
		<!-- formgroup div end -->
		<hr />
		<div
			style="margin: 0 auto; width: 500px; height: 300px; overflow: hidden; margin: auto;">
			<p >* 이미지를 올리려면 아이콘을 더블 클릭 해주세요.</p>
			<img id="preview"
				src="${post.MAIN_IMG != '' && post.MAIN_IMG ne null ? '/upload_img/'.concat(post.MAIN_IMG) : '/images/upload.png'}"
				style="border-radius: 10px; width: 150px; margin-left: 110px;">
		</div>
		<input type="file" style="display: none" accept="image/*"
			name="thumbnail" id="thumbnail" />

		<hr />
		<div class="directions" style="width: 97%; margin: auto;">
			<c:choose>
				<c:when test="${isMod }">
					<div id="summernote">${post.CONTENT}</div>
					<input id="summernotecontent" type="hidden" name="editorcontent" value=""/>
				</c:when>
				<c:otherwise>
					<textarea id="summernote" name="editorcontent"></textarea>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="wrapper" style="text-align: center; margin-top: 20px">
			<button class="btn" type="button" onclick="write_confirm()" style="background-color: #F2BF2B; color: #fff">작성완료</button>
		</div>
		<input type="hidden" name="isMod" value="${isMod ? 'YY' : 'NN'}" />
		<c:if test="${isMod }">
			<input type="hidden" name="pid" value="${post.POST_ID }" />
			<input type="hidden" name="prev_img" value="${post.MAIN_IMG}" />
		</c:if>
	</form>
	<script>
		var attach_ingredient_functions = function() {
			// unbind 시켜주지 않으면 핸들러가 여러개 붙어있음...
			$(".ig_name").unbind('autocomplete');
			$(".ig_name").unbind('focusout');
			$(".ig_name").autocomplete({
				source : function(request, response) {
					$.ajax({
						url : "/foodie/write/search_ig.do",
						dataType : "json",
						data : {
							syllable : request.term,
						},
						success : function(result) {
							response($.map(result, function(item) {
								return {
									label : item,
									value : item
								}
							}));
						}
					});
				},
				minLength : 1,
				select : function(event, ui) {
				}
			});
			$(".ig_name").focusout(function() {
				if($(this).val().trim() == ''){
					return;
				} else {
					console.log($(this).val().trim());
				}
				
				$.ajax({
		            type : 'get',
		            url : '/foodie/write/ingredient_exist.do',
		            data : 'name='+$(this).val().trim(),
		            dataType : 'text',
		            success : function(rst){
		                if(rst=='false') {
		                	// TODO: 재료, 단위를 키로 잡아야함
		    				var title = '재료등록';
		    				var body =  '<div class="modal-confirm-body">';
		    					body += '<p>데이터베이스에 등록되지 않은 재료를 등록하시겠습니까?<br/>';
		    					body += '<small style="color:pink">여러분의 참여가 FOODIE를 더 편리하게 만듭니다!</small></p>';
		    					body += '</div>'
		    				var btn1 = {
		    					Value:'<span class="glyphicon glyphicon-ok"></span>등록하기',
		    					Css:"btn-success btn-default pull-left",
		    					Callback:onConfirmClick
		    					};
		    				var btn2 = {
		    					Value:'<span class="glyphicon glyphicon-remove"></span>아니오',
		    					Css:"btn-danger btn-default pull-left",
		    					Callback:""
		    					};
		     				var buttons = [btn1,btn2];
		    				
		    				new BstrapModal(title, body, buttons).Show();
		                }
		            },
		        });
			});
		}
		attach_ingredient_functions();
		var init_summernote = function(){ $("#summernote")
				.summernote(
						{
							// TOOLBAR REFERENCES > https://summernote.org/deep-dive/#custom-toolbar-popover
							placeholder : '여기에 여러분의 레시피를 자유롭게 작성해보세요!',
							height : 600,
							fontNames : [ 'NanumGothic', '맑은고딕', 'Arial',
									'Arial Black', 'Comic Sans MS',
									'Courier New', ],
							fontNamesIgnoreCheck : [ 'NanumGothic' ],
							focus : true,
							toolbar : [
									// [groupName, [list of button]]
									[
											'style',
											[ 'bold', 'italic', 'underline',
													'clear' ] ],
									[
											'font',
											[ 'strikethrough', 'fontname',
													'fontsize' ] ],
									[ 'color', [ 'color' ] ],
									[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
									[ 'height', [ 'height' ] ],
									[ 'insert', [ 'picture', 'link' ] ] ],
							callbacks : {
								onImageUpload : function(files, editor,
										welEditable) {
									for (var i = files.length - 1; i >= 0; i--) {
										sendFile(files[i], this);
									}
								}
							}
						});
		};
		init_summernote();
		
		function write_confirm() {
			// 비어있지만 않으면 오케이
			if ($("#title").val().trim() == "") {
				$(".requiredmsg").text('요리명을 입력해주세요.');
				$("#requiredmodal").modal();
				$("#title").focus();
				return;
			}
			if ($("#thumbnail").val() == "" && !'${isMod}') {
				$(".requiredmsg").text('사진을 올려주세요.');
				$("#requiredmodal").modal();
				return;
			}
			if ($('#summernote').summernote('code').replace(/<\/?[^>]+(>|$)/g,
					"").replace(/\s|&nbsp;/g, '').length == 0) {
				$(".requiredmsg").text('내용을 입력해주세요.');
				$("#requiredmodal").modal();
				$("#summernote").focus();
				return;
			}
			var flag = false;
			$(".ig_row").each(function() {
				// 최소한 재료명 하나는 적혀있어야함
				console.log();
				if ($(this).find("input[name='ig_name']").val().length != 0) {
					flag = true;
				}
			});
			if (flag) {
				if ('${isMod}') {
					$('#summernotecontent').val($('#summernote').summernote('code'));
				}
				$("#recipe_form").submit();
			} else {
				$(".requiredmsg").text('최소 한개의 재료를 입력해주세요.');
				$("#requiredmodal").modal();
				$("input[name='ig_name']").focus();
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
			cloneRow.attr("id", "");
			cloneRow.attr("class", "ig_row row");
			cloneRow.appendTo($("#ingredients"));
			cloneRow.css("display", "");
			$("#only_one").appendTo(cloneRow.find(".col-xs-10"));
			attach_ingredient_functions();
		}
		function ig_remove() {
			if ($(".ig_row").length > 1) {
				console.log($(".ig_row").length);
				$("#only_one").appendTo($(".ig_row:last").prev().find(".col-xs-10"));
				$(".ig_row:last").remove();
			}
		}
		function sendFile(file, el) {
			// 여기서 file을 리사이징
			var form_data = new FormData();
			form_data.append('file', file);
			$.ajax({
				data : form_data,
				type : "POST",
				url : '/foodie/write/insertimg.do',
				cache : false,
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(img_path) {
					$(el).summernote('insertImage', img_path);
				}
			});
		}
		var onRegisterClick = function(e) {
	        var queryString = $("#register-ingredient").serialize() ;
			console.log("query: "+queryString);
	        $.ajax({
	            type : 'post',
	            url : '/foodie/write/register_ingredient.do',
	            data : queryString,
	            dataType : 'json',
	            success : function(json){
	                alert("등록성공")
	            },
	        });
	    }
		
		var onConfirmClick = function() {
			var title = '재료등록';
			var body =  '<div class="modal-register-body">';
				body += '<form id="register-ingredient" role="form">';
				body += '<div class="form-group">';
				body += '<label for="ig_name"> 재료명</label>'; 
				body += '<input type="text" class="form-control" name="name" id="ig_name" placeholder="마늘, 와사비, 소고기 등심, 삼겹살 ...">';
				body += '</div>';
				body += '<div class="form-group">';
				body += '<label for="ig_unit"> 단위</label>'; 
				body += '<input type="text" class="form-control" name="unit" id="ig_unit" placeholder="g, kg, ml, l, 마리, 단, 묶음 ...">';
				body += '</div>';
				body += '<div class="form-group">';
				body += '<label for="ig_price"> 단위당 가격</label>'; 
				body += '<input type="text" class="form-control" name="price" id="ig_price" placeholder="해당 단위, 1g, 1kg, 1마리 당 가격을 입력해주세요.">';
				body += '</div>';
				body += '</form>';
				body += '</div>';
			var btn1 = {
				Value:'<span class="glyphicon glyphicon-ok"></span>등록하기',
				Css:"btn-success btn-default pull-left",
				Callback:onRegisterClick
				};
			var btn2 = {
				Value:'<span class="glyphicon glyphicon-remove"></span>아니오',
				Css:"btn-danger btn-default pull-left",
				Callback:""
				};
			var buttons = [btn1,btn2];
			BstrapModal.Close();	
			new BstrapModal(title, body, buttons).Show();
		}
		$(document).ready(function() {
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