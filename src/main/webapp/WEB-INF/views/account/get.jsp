<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<body>
<section class="hero-wrap hero-wrap-2" style="background-image: url('/traders/images/bg_wave.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
                <p class="mb-2 bread" style="font-size:45px;">My Account</p>
                <p class="breadcrumbs"><span class="mr-2"><a href="/main">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>My account <i class="ion-ios-arrow-forward"></i></span></p>
            </div>
        </div>
    </div>
</section>


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

<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-7 col-lg-5">
                <div class="login-wrap p-4 p-md-5">
                    <label>나의 계좌번호</label><input type="text" class="form-control rounded-left" value='<c:out value="${account.account_number}"/>' readonly>
                    <br>
                    <label>나의 계좌 비밀번호</label><input type="password" class="form-control rounded-left" value='<c:out value="${account.account_pw}"/>' readonly>
                    <br>
                    <label>나의 주민번호 앞자리</label><input type="text" class="form-control rounded-left" value='<c:out value="${account.birth}"/>' readonly>
                    <br>
                    <label>나의 연락처</label><input type="text" class="form-control rounded-left" value='<c:out value="${account.phone_number}"/>' readonly>
                    <br>
                    <label>나의 계좌 잔고</label><input type="text" class="form-control rounded-left" value='<c:out value="${account.balance}"/>' readonly>
                    <br>
                    <a href="/account/modify" class="form-control btn btn-primary rounded submit px-3">수정하기</a><br></br>
                    <a href="/account/deposit" class="form-control btn btn-primary rounded submit px-3">입금하기</a><br></br>
                    <a href="/account/withdrawal" class="form-control btn btn-primary rounded submit px-3">출금하기</a><br></br>
                    <a href="/account/transfer" class="form-control btn btn-primary rounded submit px-3">이체하기</a>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
    var alertTrigger;

        $("#modify").on('click', function(){

            var form = document.getElementById("form");
            var pwChk = /^[0-9]{4,4}$/;
            var numberChk = /^[a-z0-9_-]{8,11}$/;
            var account_pw =  $('input[name="account_pw"]')
            //console.log( account_pw.val());
            var phone_number =  $('input[name="phone_number"]')

            if(!account_pw.val()){
                alert("비밀번호를 입력해 주세요");
            }

            if(!pwChk.test(account_pw.val())){

                alert("정확한 계좌 비밀번호을 입력해 주세요.");
                return false;
            }

            if(!phone_number.val()){

                 alert("연락처를 입력해 주세요");
            }

            if(!numberChk.test(phone_number.val())){

                alert("연락처를 입력해 주세요.");
                return false;
            }

           form.submit(); //정지

           alertTrigger = 1;
                if(alertTrigger == 1 ){
                      alert("계좌 수정 완료되었습니다.");
                 }
        });

        var form = $("#form");

        $("#delete").on("click", function(){
            form.attr("action", "/account/remove").attr("method", "post");
            alertTrigger = 0;
            form.submit();
            alert("계좌 삭제 완료되었습니다.");
        });

</script>
</html>