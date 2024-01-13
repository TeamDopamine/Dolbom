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
    <div class="bodybutton" style="margin-top: 100px; margin-left: 100px;">
        <button type="button" class="createClass" onclick="addNewButton()">+</button>
    </div>
    <!-- Contact End -->

    <!-- Footer -->
	<jsp:include page="Footer.jsp"></jsp:include>
    
    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>

	<script>
	    function addNewButton() {
	        var color = ["powderblue", "lightblue", "yellowgreen", "crimson", "grey", "lightgreen"];
	        let num= Math.floor(Math.random()*color.length);
	        // 새로운 버튼 생성
	        let className = prompt("이름을 입력하세요.");
	        $('.bodybutton').append(`<a href="#"><button style='background-color: ${color[num]};' class='createdClass'>${className}</button></a>`)
	    }
	</script>

</body>

</html>