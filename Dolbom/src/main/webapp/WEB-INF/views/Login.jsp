<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*, javax.servlet.http.*" %>
<%@ page import="kr.smhrd.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="IncludeStyle.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <!-- 생략 -->

    <script>
        function submitLoginForm() {
            var userId = document.getElementById("user_id").value;
            var password = document.getElementById("user_pw").value;

            var form = document.getElementById("loginForm");
            form.action = "userSelect";
            form.method = "post";

            var userIdField = document.createElement("input");
            userIdField.type = "hidden";
            userIdField.name = "user_id";
            userIdField.value = userId;
            form.appendChild(userIdField);

            var passwordField = document.createElement("input");
            passwordField.type = "hidden";
            passwordField.name = "user_pw";
            passwordField.value = password;
            form.appendChild(passwordField);

            form.submit();
        }
    </script>
</head>

<body>
	<%
	User loginUser = (User) session.getAttribute("loginUser");
	if (loginUser != null) {
		System.out.println("loginUser가 null이 아닙니다!");
	} else {
		System.out.println("loginUser가 null입니다.");
	}
	%>

	<!-- Header -->
	<jsp:include page="Header.jsp"></jsp:include>
							

	<!-- Quote Start -->
	<form id="loginForm" method="post" action="userSelect">
		<div
			style="background-image: url(${path}/resources/img/login_bg.png); background-size: cover;"
			style="margin: 6rem 0;" style="align-self: center !important;">
			<div class="container px-lg-0">
				<div class="container p-lg-5 pe-lg-0" style="margin: 6rem 0;">
					<div class="row">
						<h1 style="text-align: center">로그인</h1>
						<hr style="width: 40%; margin: 20px auto;">
						<div class="col-md-6"
							style="text-align: center !important; width: 25%; margin-left: 37.5%;">
							<div class="col-12" style="margin-bottom: 20px;">
								<input id="user_id" type="text" class="form-control border-0"
									placeholder="아이디" style="height: 55px;">
							</div>
							<div class="col-12" style="margin-bottom: 20px;">
								<input id="user_pw" type="password"
									class="form-control border-0" placeholder="비밀번호"
									style="height: 55px;">
							</div>
							<input class="btn btn-primary rounded-pill py-3 px-5"
								type="button" value="로그인"
								style="border-radius: 10px !important; margin-bottom: 20px;"
								onclick="submitLoginForm();">
						</div>
						<br>
						<div style="text-align: center;">
							계정이 없으신가요? <a href="goSignUp">회원가입</a>
						</div>
						<div style="margin-bottom: 230px;"></div>
					</div>
				</div>
			</div>
		</div>
	</form>

	<!-- Footer -->
	<jsp:include page="Footer.jsp"></jsp:include>
</body>

</html>
