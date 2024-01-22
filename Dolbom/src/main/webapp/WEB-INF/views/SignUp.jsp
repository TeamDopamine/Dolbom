<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="IncludeStyle.jsp"%>

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
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">
</head>

<body>

	<script type="text/javascript">
		function checkE() { /* $ : jQuery */

			var inputID = $('#inputID').val()
			console.log(inputID)

			$.ajax({ // jcon 형식 -> {key : value, key : value}
				// 어디로 요청할 것인지(요청 url)
				url : 'idCheck',
				// 요청 데이터
				data : {
					'inputID' : inputID
				},
				// 요청방식 
				type : 'get',
				// 요청-응답 성공
				success : function(data) {
					// alert(data)
					if (data == 'false') {
						alert('사용 불가한 아이디')
					} else {
						alert('사용 가능한 아이디')
					}
				},
				// 요청-응답 실패
				error : function() {
					alert("통신실패")
				}
			})

		}
	</script>
	<!-- Header -->
	<jsp:include page="Header.jsp"></jsp:include>

	<!-- Quote Start -->
	<form action="userInsert" method="post">
		<div class="login-form">
			<div
				style="background-image: url(${path}/resources/img/signup_bg2.png); background-size: cover;"
				style="margin: 6rem 0;">
				<div class="container px-lg-0">
					<div class="container p-lg-5 pe-lg-0">
						<div class="row" style="margin-top:130px">
							<h1 style="text-align: center">회원가입</h1>
							<hr style="width: 40%; margin: 20px auto;">
							<div class="col-md-6"
								style="text-align: center !important; width: 25%; margin-left: 37.5%;">
								<div class="input-group col6">
									<div class="input-group">
										<input type="text" name="user_id" id="inputID"
											class="form-control border-0" placeholder="아이디"
											style="height: 55px; margin-right: 10px; margin-bottom: 20px; border-radius: 10px 10px 10px 10px;">
										<div class="input-group-append">
											<input
												class="btn btn-primary py-3 px-3" type="button" value="중복확인"
												style="border-radius: 10px 10px 10px 10px;" onclick="checkE()"></input>

										</div>
									</div>
									<div class="col-12" style="margin-bottom: 20px;">
										<input type="password" name="user_pw"
											class="form-control border-0" placeholder="비밀번호"
											style="height: 55px;">
									</div>
									<div class="col-12" style="margin-bottom: 20px;">
										<input type="text" name="user_nick"
											class="form-control border-0" placeholder="유치원명"
											style="height: 55px;">
									</div>
									<div class="col-12" style="margin-bottom: 20px;">
										<input type="text" name="user_addr"
											class="form-control border-0" placeholder="주소"
											style="height: 55px;">
									</div>
									<div class="col-12" style="margin-bottom: 20px;">
										<input type="text" name="user_phone"
											class="form-control border-0" placeholder="전화번호"
											style="height: 55px;">
									</div>
									<input class="btn btn-primary rounded-pill py-3 px-5"
										type="submit" value="가입하기"
										style="border-radius: 10px !important; margin-left: 65px;"></input>
								</div>
								<br>
								<div style="text-align: center; margin-bottom: 90px">
									이미 계정이 있으신가요? <a href="goLogin">로그인</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
	</form>

	<!-- Footer -->
	<jsp:include page="Footer.jsp"></jsp:include>
</body>

</html>