<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path2" value="${pageContext.request.contextPath}/resources/chattingRoom"/>
<c:set var="img2" value="${pageContext.request.contextPath}/resources/chattingRoom/images"/>
<!DOCTYPE html>
<html>
<head>

<!-- css -->
<link href="${path2}/css/_common.css" rel="stylesheet"/> 	
<link href="${path2}/css/_reset.css" rel="stylesheet"/> 	
<link href="${path2}/css/style.css" rel="stylesheet"/> 	
<link href="${path2}/css/style3.css" rel="stylesheet"/> 	

<!-- javaScript -->
<script src="${path2}/js/imgbase64.js" type="module"></script>
<script src="${path2}/js/index.js" type="module"></script>
<script src="${path2}/js/videobase64.js" type="module"></script>
<script src="${path2}/composer.js" type="module"></script>

<?php include_once("index.html"); ?>



</head>
<body>

</body>
</html>