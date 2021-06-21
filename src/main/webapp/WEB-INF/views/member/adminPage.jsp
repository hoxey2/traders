<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" contentType = "text/html; charset=UTF-8" %>
<%@include file="../includes/adminHeader.jsp"%>

<body>

<section class="hero-wrap hero-wrap-2" style="background-image: url('/traders/images/bg_wave.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
                 <p class="mb-2 bread" style="font-size:45px;">Admin Page</p>
                <p class="breadcrumbs"><span class="mr-2"><a href="/main">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Test <i class="ion-ios-arrow-forward"></i></span></p>
            </div>
        </div>
    </div>
</section>

<section class="ftco-section ftco-no-pt ftco-no-pb contact-section">
    </div>
    </div>


    <!-- loader -->
    <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


    <script src="/traders/js/jquery.min.js"></script>
    <script src="/traders/js/jquery-migrate-3.0.1.min.js"></script>
    <script src="/traders/js/popper.min.js"></script>
    <script src="/traders/js/bootstrap.	min.js"></script>
    <script src="/traders/js/jquery.easing.1.3.js"></script>
    <script src="/traders/js/jquery.waypoints.min.js"></script>
    <script src="/traders/js/jquery.stellar.min.js"></script>
    <script src="/traders/js/owl.carousel.min.js"></script>
    <script src="/traders/js/jquery.magnific-popup.min.js"></script>
    <script src="/traders/js/aos.js"></script>
    <script src="/traders/js/jquery.animateNumber.min.js"></script>
    <script src="/traders/js/bootstrap-datepicker.js"></script>
    <script src="/traders/js/scrollax.min.js"></script>
    <script src="/traders/js/main.js"></script>

</section>

<div class="row" style="margin-top:50px; margin-left:300px;" width="350px">

	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
			<!-- /.panel-heading -->
			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>회원번호</th>
							<th>아이디</th>
							<th>이름</th>
							<th>이메일</th>
							<th>연령대</th>
							<th>성별</th>
						</tr>
					</thead>
			        <c:forEach items="${list}" var="list">
                           <tr class="${list.member_id}">
                                 <td><c:out value="${list.member_no}"/></td>
                                 <td id="memberId" >
                                        <c:out value="${list.member_id}"/>
                                 </td>
                                 <td><c:out value="${list.member_name}" /></td>
                                 <td><c:out value="${list.member_email}" /></td>
                                 <td><c:out value="${list.member_age}" /></td>
                                 <td><c:out value="${list.member_gender}" /></td>
                           </tr>
			        </c:forEach>
				</table>

				<div class='row'>
					<div class="col-lg-12">

						<form id='searchForm' action="/adminPage" method='get'>
							<select name='type'>
								<option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
								<option value="I"
									<c:out value="${pageMaker.cri.type eq 'I'?'selected':''}"/>>아이디</option>
								<option value="N"
									<c:out value="${pageMaker.cri.type eq 'N'?'selected':''}"/>>이름</option>
								<option value="E"
									<c:out value="${pageMaker.cri.type eq 'E'?'selected':''}"/>>이메일</option>
								<option value="IN"
									<c:out value="${pageMaker.cri.type eq 'IN'?'selected':''}"/>>아이디
									or 이름</option>
							</select> <input type='text' name='keyword'
								value='<c:out value="${pageMaker.cri.keyword}"/>' /> <input
								type='hidden' name='pageNum'
								value='<c:out value="${pageMaker.cri.pageNum}"/>' /> <input
								type='hidden' name='amount'
								value='<c:out value="${pageMaker.cri.amount}"/>' />
							<button class='btn btn-default'>Search</button>
						</form>
					</div>
				</div>

				<div class='pull-right'>
					<ul class="pagination">
						<c:if test="${pageMaker.prev}">
							<li class="paginate_button previous"><a href="${pageMaker.startPage -1}">Previous</a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<li class="paginate_button  ${pageMaker.cri.pageNum == num ? 'active':''} ">
								<a href="${num}">${num}</a>
							</li>
						</c:forEach>

						<c:if test="${pageMaker.next}">
							<li class="paginate_button next"><a href="${pageMaker.endPage +1 }">Next</a></li>
						</c:if>

					</ul>
				</div>
				<!--  end Pagination -->
			</div>
			<form id='actionForm' action="/adminPage" method='get'>
            	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
            	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
            <input type='hidden' name='type'
                value='<c:out value="${ pageMaker.cri.type }"/>'>
            <input type='hidden' name='keyword'
                value='<c:out value="${ pageMaker.cri.keyword }"/>'>
            </form>
		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>

<!-- modal -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button>
                    <h4 class="modal-title" id="myModalLabel">MEMBER INFO</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label>NO</label>
                        <input class="form-control" name='member_no' readonly>
                    </div>
                    <div class="form-group">
                        <label>ID</label>
                        <input class="form-control" name='member_id'>
                    </div>
                    <div class="form-group">
                        <label>NAME</label>
                        <input class="form-control" name='member_name'>
                    </div>
                    <div class="form-group">
                        <label>EMAIL</label>
                        <input class="form-control" name='member_email'>
                    </div>
                     <div class="form-group">
                        <label>AGE</label>
                        <input class="form-control" name='member_age'>
                    </div>
                    <div class="form-group">
                        <label>GENDER</label>
                        <input class="form-control" name='member_gender' readonly>
                    </div>

                </div>
                <div class="modal-footer">
                    <button id='modalModBtn' type="button" class="btn btn-warning">Modify</button>
                    <button id='modalRemoveBtn' type="button" class="btn btn-danger">Remove</button>
                     <button id='modalCloseBtn' type="button" class="btn btn-default">Close</button>
                </div>
            </div>
        </div>
    </div>


<script type="text/javascript" src="/resources/js/member.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var actionForm = $("#actionForm");

		var paginate_button = $(".paginate_button a").on("click",function(e){
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});

   });
		var searchForm = $("#searchForm");

        $("#searchForm button").on("click", function(e) {

    	    if (!searchForm.find("option:selected").val()) {
    			alert("검색종류를 선택하세요");
    		    return false;
    		}

            if (!searchForm.find("input[name='keyword']").val()) {
                alert("키워드를 입력하세요");
                return false;
            }

            searchForm.find("input[name='pageNum']").val("1");
                e.preventDefault();

                searchForm.submit();

  		});

    var modal = $(".modal");
    var modalMemberNo = modal.find("input[name='member_no']");
    var modalMemberId = modal.find("input[name='member_id']");
    var modalMemberName = modal.find("input[name='member_name']");
    var modalMemberEmail = modal.find("input[name='member_email']");
    var modalMemberAge = modal.find("input[name='member_age']");
    var modalMemberGender = modal.find("input[name='member_gender']");


    var modalModBtn = $("#modalModBtn");
    var modalRemoveBtn = $("#modalRemoveBtn");
    var modalRegisterBtn = $("#modalRegisterBtn");

    $("#modalCloseBtn").on("click", function(e){

    	modal.modal('hide');
    });






     $("tr").on("click", function(e) {
        var move = $(this).attr('class');

        if(move != undefined){

            console.log("move:" +move);

            memberService.get(move, function(member){

                    console.log("memberId:" + member.id);
                    console.log("member:" +member);

                    modalMemberNo.val(member.no);
                    modalMemberId.val(member.id);
                    modalMemberName.val(member.name);
                    modalMemberEmail.val(member.email);
                    modalMemberAge.val(member.age);
                    modalMemberGender.val(member.gender);

                     $(".modal").modal("show");

            });
        }

    });


    modalModBtn.on("click", function(e){

        var member = {
            member_no : modalMemberNo.val(),
            member_id: modalMemberId.val(),
            member_name: modalMemberName.val(),
            member_email: modalMemberEmail.val(),
            member_age: modalMemberAge.val()

        };

        memberService.update(member, function(result){

            alert(result);
            modal.modal("hide");


        });

    });


    modalRemoveBtn.on("click", function(e){

        var mno = modalMemberNo.val();

        memberService.remove(mno, function(result){
             alert(result);
             modal.modal("hide");
        });

    });


</script>


<%@include file="../includes/boardFooter.jsp"%>
