<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="IncludeStyle.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>돌봄</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
</head>

<body>
   <!-- Header -->
	<jsp:include page="Header.jsp"></jsp:include>

    <!-- Quote Start -->
    <div class="login-form">
    <div style="background-image: url(${path}/resources/img/signup_bg2.png); background-size: cover;" style="margin: 6rem 0;">
        <div class="container px-lg-0">
    <div class="container p-lg-5 pe-lg-0" style="margin: 6rem 0;">
        <div class="row">
            <h1 style="text-align:center">회원가입</h1>
            <hr style="width: 40%; margin: 20px auto;">
                <div class="col-md-6" style="text-align: center !important; width:25%; margin-left: 37.5%;">
                    <div class="input-group col6">
                        <div class="input-group">
                            <input type="text" class="form-control border-0" placeholder="아이디" style="height: 55px; margin-right: 10px; margin-bottom: 20px; border-radius: 10px 10px 10px 10px;">
                            <div class="input-group-append">
                                <button class="btn btn-primary py-3 px-3" type="submit" style="border-radius: 10px 10px 10px 10px;">중복확인</button>
                            </div>
                        </div>
                    <div class="col-12" style="margin-bottom: 20px;">
                        <input type="email" class="form-control border-0" placeholder="비밀번호" style="height: 55px;">
                    </div>
                    <div class="col-12" style="margin-bottom: 20px;">
                        <input type="text" class="form-control border-0" placeholder="유치원명" style="height: 55px;">
                    </div>
                    <div class="col-12" style="margin-bottom: 20px;">
                        <input type="text" class="form-control border-0" placeholder="주소" style="height: 55px;">
                    </div>
                    <div class="col-12" style="margin-bottom: 20px;">
                        <input type="text" class="form-control border-0" placeholder="전화번호" style="height: 55px;">
                    </div>
                    <button class="btn btn-primary rounded-pill py-3 px-5" type="submit" style="border-radius: 10px !important;  margin-left: 70px;" >가입하기</button>
                </div>
            <br>
            <div style="text-align: center;">이미 계정이 있으신가요? <a href="">로그인</a></div>
        </div>
    </div>
</div>
</div>
</div>

    <!-- Footer -->
	<jsp:include page="Footer.jsp"></jsp:include>
    
</body>

</html>