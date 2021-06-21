<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>

<style>

.btn.btn-primary {
     width: 350px;
}

</style>
<body>

<section class="hero-wrap hero-wrap-2" style="background-image: url('/traders/images/bg_wave.jpg');" data-stellar-background-ratio="0.5">
    <div class="overlay"></div>
    <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center">
            <div class="col-md-9 ftco-animate text-center">
                <p class="mb-2 bread" style="font-size:45px;">My Asset</p>
                <p class="breadcrumbs"><span class="mr-2"><a href="/main">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Asset <i class="ion-ios-arrow-forward"></i></span></p>
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

            <c:forEach items="${asset}" var="asset">
                <div class="form-group row">
                    <div class="register">
                        <div class="col-xs-4">
                            <label>주식명</label> <input class="form-control" id="ex3" name='stock_name' value='<c:out value="${asset.stock_name}"/>' readonly>
                        </div>
                        <div class="col-xs-4">
                            <label>1주당 가격</label> <input class="form-control" id="ex3" name='stock_price' value='<c:out value="${asset.stock_price}"/>' readonly>
                        </div>
                        <div class="col-xs-4">
                            <label>주식 수량</label> <input class="form-control" id="ex3" name='stock_count' value='<c:out value="${asset.stock_count}"/>' readonly>
                        </div>
                    </div>
                </div>
                <br>
            </c:forEach>

            <div>
                <canvas id="myChart" width="650" height="650" style="margin-bottom: 100px"></canvas>

            <a href="/asset/modify" class="form-control btn btn-primary rounded submit px-3"> 수정 </a>
            &nbsp;&nbsp;
            <a href="/main" class="form-control btn btn-primary rounded submit px-3"> 뒤로가기 </a>

        </div>
    </div>
</section>

</body>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
<script>

$(document).ready(function(){

        var result ='${result}';

        if(result != ''){
            alert(result);
            //console.log(result);
            return false;
        }
});

  var register_length = $(".register").length;

            var stockName = [];
            var stockTotal = [];

            for(var i=0; i<5 ; i++){
                var stock_name = $(".register").eq(i).find("input[name='stock_name']").val();
                var stock_count =$(".register").eq(i).find("input[name='stock_count']").val();
                var stock_price = $(".register").eq(i).find("input[name='stock_price']").val();

                total = stock_count * stock_price;
                stockName[i] = stock_name;
                stockTotal[i] = total;
            }

            function forLabels(length){
                var index = 5 - length;
                for(var i = 0 ; i<index ; i++){
                    stockName.pop();
                }
                return stockName;
            }

            //label 에다 배열 요소 넣어줘야함
            var labels =  forLabels(register_length);


            function bgc(length){
                var bgcArr = ['plum',
                              'lightpink',
                              'navajowhite',
                              'yellowgreen',
                              'lightskyblue', ];
                var index = 5 - bgcArr;
                for(var i = 0 ; i<index ; i++){
                    bgcArr.pop();
                }
                return bgcArr;
            }

            var data = {
                labels: labels,
                datasets: [{
                    label: 'My First dataset',
                    backgroundColor: bgc(register_length),
                    borderColor: 'white',
                    data: stockTotal  //배열값 필요
                }]
            };

            const config = {
                type: 'doughnut',
                data,
                options: {
                    responsive: false
                }
            };
            // === include 'setup' then 'config' above ===
            var myChart = new Chart(
              document.getElementById('myChart'),
              config
            );

</script>
</html>



