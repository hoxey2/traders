<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
      <meta charset="UTF-8">
            <title>TRADERS</title>
            <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

            <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
            <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
            <link href="style.css">

            <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">

            <link rel="stylesheet" href="/traders/css/open-iconic-bootstrap.min.css">
            <link rel="stylesheet" href="/traders/css/animate.css">

            <link rel="stylesheet" href="/traders/css/owl.carousel.min.css">
            <link rel="stylesheet" href="/traders/css/owl.theme.default.min.css">
            <link rel="stylesheet" href="/traders/css/magnific-popup.css">

            <link rel="stylesheet" href="/traders/css/aos.css">

            <link rel="stylesheet" href="/traders/css/ionicons.min.css">

            <link rel="stylesheet" href="/traders/css/bootstrap-datepicker.css">
            <link rel="stylesheet" href="/traders/css/jquery.timepicker.css">


            <link rel="stylesheet" href="/traders/css/flaticon.css">
            <link rel="stylesheet" href="/traders/css/icomoon.css">
            <link rel="stylesheet" href="/traders/css/style.css">


        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="/main">TRADERS</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                       <li class="nav-item"><a href="/main" class="nav-link">Home</a></li>
                       <li class="nav-item"><a href="/board/list" class="nav-link">Board</a></li>
                       <li class="nav-item"><a href="/gallery/list" class="nav-link">Gallery</a></li>
                       <li class="nav-item"><a href="/stock/stockPage" class="nav-link">News</a></li>
                       <li class="nav-item"><a href="/room" class="nav-link">STockTalk</a></li>
                       <li class="nav-item"><a href="/test" class="nav-link">Test</a></li>
                       <li class="dropdown nav-item"><a class="nav-link" data-toggle="dropdown" href="#">My Page <span class="caret"></span></a>
                           <ul class="dropdown-menu">
                               <li><a href="/myPage">내 정보 변경</a></li>
                               <li id="asGetBtn"><a href="/asset/get">내 자산 조회</a></li>
                               <li id="asRegBtn"><a href="/asset/register">자산 등록</a></li>
                               <li id="acRegBtn"><a href="/account/register">계좌 개설</a></li>
                               <li id="acGetBtn"><a href="/account/get">계좌 조회</a></li>
                           </ul>
                       </li>
                       <li id="loginBtn" class="nav-item"><a href="/" class="nav-link">Login</a></li>
                       <li id="logoutBtn" class="nav-item"><a href="/memberLogout" class="nav-link">Logout</a></li>
                       <li id="admin" class="nav-item"><a href="/adminPage" class="nav-link">Admin page</a></li>
                    </ul>
                </div>
            </div>
        </nav>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Board</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

       <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
       <!--  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
       <script src="/resources/js/jquery.min.js"></script>
       <script type="text/javascript" src="/resources/js/check.js"></script>
