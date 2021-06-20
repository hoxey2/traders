<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/boardHeader.jsp"%>

<body>

	<section class="hero-wrap hero-wrap-2" style="background-image: url('/traders/images/bg_wave.jpg');" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text align-items-center justify-content-center">
                    <div class="col-md-9 ftco-animate text-center">
						<p class="mb-2 bread" style="font-size:45px;">Gallery</p>
					<p class="breadcrumbs"><span class="mr-2"><a href="/main">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Gallery <i class="ion-ios-arrow-forward"></i></span></p>
				</div>
			</div>
		</div>
	</section>
	<br>
    <a href="/gallery/register" role="button" class="btn btn-primary float-right">사진 등록하기</a>
    <br>
    <br></br>

	<div class="container-wrap">
		<div class="row no-gutters">
			<c:forEach var="file" items="${list}" varStatus="status">
				<div class="col-md-6 col-lg-3 ftco-animate">
					<div class="project">
						<c:set var="display" value="/display?fileName="></c:set>

						<img src="${display}${file.fileUrl}" onerror="this.src='/resources/img/noImage.gif';" class="img-fluid"  style="height:400px;width:100%;"/>
						<div class="text">
                            <a href="get?bno=${file.bno}" style="color:white; font-size:2.0em; font-weight:bold;">${file.title}</a> <br>
						    <a href="get?bno=${file.bno}" style="color:white;" >${file.writer}</a>
						    <a href="get?bno=${file.bno}" style="color:white;" >${file.content}</a>
						</div>
						<a href="${display}${file.fileUrl}" class="icon image-popup d-flex justify-content-center align-items-center">
							<span class="icon-expand"></span>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<script src="/traders/js/jquery.min.js"></script>
	<script src="/traders/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="/traders/js/popper.min.js"></script>
	<script src="/traders/js/bootstrap.min.js"></script>
	<script src="/traders/js/jquery.easing.1.3.js"></script>
	<script src="/traders/js/jquery.waypoints.min.js"></script>
	<script src="/traders/js/jquery.stellar.min.js"></script>
	<script src="/traders/js/owl.carousel.min.js"></script>
	<script src="/traders/js/jquery.magnific-popup.min.js"></script>
	<script src="/traders/js/aos.js"></script>
	<script src="/traders/js/jquery.animateNumber.min.js"></script>
	<script src="/traders/js/bootstrap-datepicker.js"></script>
	<script src="/traders/js/jquery.timepicker.min.js"></script>
	<script src="/traders/js/scrollax.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="/traders/js/google-map.js"></script>
	<script src="/traders/js/main.js"></script>

</body>

<%@include file="../includes/boardFooter.jsp"%>
