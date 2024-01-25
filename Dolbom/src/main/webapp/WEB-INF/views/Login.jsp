<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page import="java.io.*,java.util.*"%>
<%@ page import="javax.servlet.*, javax.servlet.http.*"%>
<%@ page import="kr.smhrd.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="IncludeStyle.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html lang="en">

<head>

</head>

<body>
	<%
	User loginUser = (User) session.getAttribute("loginUser");
	String loginState = (String)session.getAttribute("loginState");
	%>
	<script>
    // Spring 표현식을 사용하여 loginState 값을 가져오기
    var loginState = "${sessionScope.loginState}";
    if (loginState != "") {
        switch (loginState) {
            case "1":
                alert("로그인 성공!");
                break;
            case "2":
            	alert("아이디를 입력해주세요!");
                break;
            case "3":
            	alert("비밀번호를 입력해주세요!");
                break;
            case "4":
            	alert("아이디(로그인 전용 아이디) 또는 비밀번호를 잘못 입력했습니다. 입력하신 내용을 다시 확인해주세요.");
                break;
            default:
                break;
        }
    }
	</script>
	<!-- Header -->
	<jsp:include page="Header.jsp"></jsp:include>

	<!-- Quote Start -->
	<form id="loginForm" method="post" action="userSelect">
		<div
			style="background-image: url(${path}/resources/img/login_bg.png); background-size: cover; height: 880px;"
			style="margin: 6rem 0;" style="align-self: center !important;">
			<div class="container px-lg-0">
				<div class="container p-lg-5 pe-lg-0">
					<div class="row" style="margin-top: 150px;">
						<h1 style="text-align: center">로그인</h1>
						<hr style="width: 40%; margin: 20px auto;">
						<div class="col-md-6"
							style="text-align: center !important; width: 25%; margin-left: 37.5%;">
							<div class="col-12" style="margin-bottom: 20px;">
								<input id="user_id" name="user_id" type="text" class="form-control border-0"
									placeholder="아이디" style="height: 55px;">
							</div>
							<div class="col-12" style="margin-bottom: 20px;">
								<input id="user_pw" type="password" name="user_pw"
									class="form-control border-0" placeholder="비밀번호"
									style="height: 55px;">
							</div>
							<input class="btn btn-primary rounded-pill py-3 px-5"
								type="submit" value="로그인"
								style="border-radius: 10px !important; margin-bottom: 20px;">
						</div>
						<br>
						<div style="text-align: center;">
							계정이 없으신가요? <a href="goSignUp">회원가입</a>
						</div>
						<div style="margin-bottom: 260px;"></div>
					</div>
				</div>
			</div>
		</div>
	</form>

	<!-- Footer -->
	<jsp:include page="Footer.jsp"></jsp:include>
</body>

</html>