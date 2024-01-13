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
	<%
			Member loginMember = (Member)session.getAttribute("loginMember");
			
			if(loginMember != null){
				/* List<Message> msgList = (List<Message>)session.getAttribute("msgList");
				System.out.println(msgList.size()); */
				System.out.println("loginMember가 null이 아닙니다!");
			}else{
				System.out.println("loginMember가 null입니다.");
			}
		%>
    
    <!-- Header -->
	<jsp:include page="Header.jsp"></jsp:include>
    
    <!-- Quote Start -->
    <div style="background-image: url(${path}/resources/img/login_bg.png); background-size: cover;" style="margin: 6rem 0;" style="align-self: center !important;">
        <div class="container px-lg-0">
    <div class="container p-lg-5 pe-lg-0" style="margin: 6rem 0;">
        <div class="row">
         		<%if(loginMember == null){ %>
					<h1 style="text-align:center">로그인</h1>
				<%}else { %>
					<h1 style="text-align:center">${loginMember.email } 님 환영합니다~</h1>
				<%} %>
            <hr style="width: 40%; margin: 20px auto;">
                <div class="col-md-6" style="text-align: center !important; width:25%; margin-left: 37.5%;">
                    <div class="col-12" style="margin-bottom: 20px; ">
                        <input type="text" class="form-control border-0" placeholder="아이디" style="height: 55px;">
                    </div>
                    <div class="col-12" style="margin-bottom: 20px;">
                        <input type="email" class="form-control border-0" placeholder="비밀번호" style="height: 55px;">
                    </div>
                    <button class="btn btn-primary rounded-pill py-3 px-5" type="submit" style="border-radius: 10px !important; margin-bottom: 20px;">로그인 하기</button>
            </div>
            <br>
            <div style="text-align: center;">계정이 없으신가요? <a href="">회원가입</a></div>
            <div style="margin-bottom: 230px;"></div>
        </div>
    </div>
</div>
</div>

<!-- Footer -->
<jsp:include page="Footer.jsp"></jsp:include>

</body>

</html>