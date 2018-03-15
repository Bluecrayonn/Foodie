<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js">
	<head>
	<style>
	@import url('https://fonts.googleapis.com/css?family=Nanum+Gothic');
	</style>
	
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>profile</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta name="author" content="FREEHTML5.CO" />

  	<!-- Facebook and Twitter integration -->
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">
	<!-- Google Fonts -->
	<link href='https://fonts.googleapis.com/css?family=Nanum+Gothic' rel='stylesheet' type='text/css'>
	<!-- Animate -->
	<link rel="stylesheet" href="/templet/css/animate.css">
	<!-- Icomoon -->
	<link rel="stylesheet" href="/templet/css/icomoon.css">
	<!-- Bootstrap  -->
	<link rel="stylesheet" href="/templet/css/bootstrap.css">

	<link rel="stylesheet" href="/templet/css/style.css">

	<!-- Modernizr JS -->
	<script src="/templet/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
	
	<script type="text/javascript"> //jquery(재료 선택 시 하이라이트 박스 변경 문구)
								function getSuccessOutput() {
								$.ajax({
									var res = "이마트";
									var resa = "890원";
									var res2 = "홈플러스";
									var resb = "890원";
									
									$('.fh5co-highlight right').html(res,resa);
									$('.fh5co-highlight right').html(res2,resb);
								});
							}
								</script>
	</head>
	
	<body>

	<a href="#" class="fh5co-post-prev"><span><i class="icon-chevron-left"></i> Prev</span></a>
	<a href="#" class="fh5co-post-next"><span>Next <i class="icon-chevron-right"></i></span></a>
	<!-- END #fh5co-header -->
	<div class="container-fluid">
		<div class="row fh5co-post-entry single-entry">
			<article class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-12 col-xs-offset-0">
				<figure class="animate-box">
					<img src="/templet/images/single_1.jpg" alt="Image" class="img-responsive">
				</figure>
				<span class="fh5co-meta animate-box"><a href="single.html">레시피 1</a></span>
				<h2 class="fh5co-article-title animate-box"><a href="single.html">라면</a></h2>
				<span class="fh5co-meta fh5co-date animate-box">March 15th, 2018</span>
				
				<div class="col-lg-12 col-lg-offset-0 col-md-12 col-md-offset-0 col-sm-12 col-sm-offset-0 col-xs-12 col-xs-offset-0 text-left content-article">
					<div class="row">
						<div class="col-lg-8 cp-r animate-box">
							<h4>재료</h4>
							<a onclick="getSuccessOutput();"> 농심 신라면 </a>
						</div>
						<div class="col-lg-4 animate-box">
							<div class="fh5co-highlight right">
								재료를 선택하여 주십시오.
							</div>
						</div>
					</div>

					<div class="row rp-b">
						<div class="col-md-12 animate-box">
						</div>
					</div>

					<div class="row rp-b">
						<div class="col-lg-6 col-md-12 animate-box">
							<figure>
								<img src="/templet/images/pic_1.jpg" alt="Free HTML5 Bootstrap Template by FREEHTML5.co" class="img-responsive">
							</figure>
						</div>
						<div class="col-lg-6 col-md-12 cp-l animate-box">
							<p> 1. 물을 넣는다. </p>
						</div>
					</div>

					<div class="row rp-b">
						<div class="col-lg-6 col-lg-push-6 col-md-12 col-md-push-0 animate-box">
							<figure>
								<img src="/templet/images/pic_4.jpg" alt="Free HTML5 Bootstrap Template by FREEHTML5.co" class="img-responsive">
								<figcaption>사진 캡션</figcaption>
							</figure>
						</div>
						<div class="col-lg-6 col-lg-pull-6 col-md-12 col-md-pull-0 cp-r animate-box">
							<p> 2. 면과 스프를 넣고 끓인다. </p>
						</div>
					</div>

					<div class="row">
						<div class="col-md-12 animate-box">
							<h2 style="text-align:center">요리과정 정리</h2>
						</div>
						<div class="col-md-4 animate-box">
							<figure>
								<img src="/templet/images/pic_5.jpg" alt="Free HTML5 Bootstrap Template by FREEHTML5.co" class="img-responsive">
								<figcaption>사진캡션</figcaption>
							</figure>
						</div>
						<div class="col-md-4 animate-box">
							<figure>
								<img src="/templet/images/pic_6.jpg" alt="Free HTML5 Bootstrap Template by FREEHTML5.co" class="img-responsive">
								<figcaption>사진캡션</figcaption>
							</figure>
						</div>
						<div class="col-md-4 animate-box">
							<figure>
								<img src="/templet/images/pic_7.jpg" alt="Free HTML5 Bootstrap Template by FREEHTML5.co" class="img-responsive">
								<figcaption>사진캡션</figcaption>
							</figure>
						</div>
					</div>
				</div>
			</article>
		</div>
	</div>
	
	<!-- jQuery -->
	<script src="/templet/js/jquery.min.js"></script>
	<!-- jQuery Easing -->
	<script src="/templet/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script src="/templet/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script src="/templet/js/jquery.waypoints.min.js"></script>
	<!-- Main JS -->
	<script src="/templet/js/main.js"></script>

	</body>
</html>