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

    <!-- Contact Start -->
    <div class="container-fluid overflow-hidden px-lg-0" style="margin: 3rem 0;">
        <div class="container contact px-lg-0">
            <div class="row g-0 mx-lg-0">
                <form class="row g-3">
                <!--여기에 적기-->
                    <div class="container">
                        <div class="row">
                            <div class="col-md-6 offset-md-3">
                                <h1 class="mb-4">프로필</h1>
                                <hr>
                                <div class="mb-3 row">
                                    <label for="id" class="col-sm-2 col-form-label text-center">아이디</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control-plaintext " id="id" value="ID from DB">
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="Password" class="col-sm-2 col-form-label text-center">비밀번호</label>
                                    <div class="col-sm-3">
                                        <input type="password" readonly class="form-control" id="Password" value="1234">
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="kinderName" class="col-sm-2 col-form-label text-center">유치원명</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="kinderName" value="kinderName from DB">
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="address" class="col-sm-2 col-form-label text-center">주소</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="address " value="address from DB">
                                    </div>
                                </div>
                                <div class="mb-3 row">
                                    <label for="tel" class="col-sm-2 col-form-label text-center">전화번호</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="tel" value="tel from DB">
                                    </div>
                                </div>
                                <!-- <div class="mb-3 row">
                                    <label for="className1" class="col-sm-2 col-form-label text-center">자녀이름1</label>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="className1">
                                    </div>
                                </div> -->

                                <!-- 아래는 라벨과 인풋과 이미지를 가로로 일렬로 정렬하는 방법임 -->
                                <div class="mb-3 row align-items-center"> <!--  row 클래스에 align-items-center를 추가하여 세로 중앙 정렬 -->
                                    <!-- col-sm-2, col-sm-3, col-auto로 설정하여 원하는 너비 부여 -->
                                    <div class="col-sm-2 text-center">
                                        <label for="childName1" class="col-form-label">자녀이름1</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="childName1">
                                    </div>
                                    <div class="col-auto">
                                        <a href=""><img src="${path}/resources/img/delete.png" style="width: 20px; height: 20px;"></a>
                                    </div>
                                </div>
                            
                                <div class="mb-3 row align-items-center">
                                    <div class="col-sm-2 text-center">
                                        <label for="childeName2" class="col-form-label">자녀이름2</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="childeName2">
                                    </div>
                                    <div class="col-auto">
                                        <a href=""><img src="${path}/resources/img/delete.png" style="width: 20px; height: 20px;"></a>
                                    </div>
                                </div>
                                
                                <div class="mb-3 row align-items-center">
                                    <div class="col-sm-2 text-center">
                                        <label for="childeName3" class="col-form-label">자녀이름2</label>
                                    </div>
                                    <div class="col-sm-3">
                                        <input type="text" class="form-control" id="childeName3">
                                    </div>
                                    <div class="col-auto">
                                        <a href=""><img src="${path}/resources/img/delete.png" style="width: 20px; height: 20px;"></a>
                                    </div>
                                </div>
                                <div class="mb-3 row"></div>
                                <div class="mb-3 row"></div>
                                <div class="mb-3 row"></div>
                                <div class="mb-3 row"></div>
                                <div class="col-auto text-end">
                                    <button type="submit" class="btn btn-light mb-3">취소</button>
                                    <button type="submit" class="btn btn-warning mb-3">수정완료</button>
                                </div>
                            </div>
                        </div>
                    </div>
                
                </form>   

            </div>
        </div>
    </div>
    <!-- Contact End -->

	<!-- Footer -->
	<jsp:include page="Footer.jsp"></jsp:include>

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>

</body>

</html>