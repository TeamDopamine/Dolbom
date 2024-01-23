<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="kr.smhrd.entity.Profile"%>
<%@page import="kr.smhrd.entity.Class"%>
<%@page import="java.util.List"%>
<%@page import="kr.smhrd.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="IncludeStyle.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


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
<%! int inputcount = 1; %>
<%
	//이건 헤더에서 할 것이니까 삭제할 것
	User loginUser = (User)session.getAttribute("loginUser");
	kr.smhrd.entity.Class loginUserClass = (kr.smhrd.entity.Class)session.getAttribute("loginUserClass");
	List<kr.smhrd.entity.Class> loginUserClassList = (List<kr.smhrd.entity.Class>)session.getAttribute("loginUserClassList");
	if(loginUser != null){
		//List<kr.smhrd.entity.Class> loginUserClass = (List<kr.smhrd.entity.Class>)session.getAttribute("loginUserClass");
		//System.out.println(loginUserClass.size()); 
		
		System.out.println("loginMember가 null이 아닙니다!");
	}else{
		System.out.println("loginMember가 null입니다.");
	}
%>

 
    <!-- Contact Start -->
   <div class="container-fluid overflow-hidden px-lg-0" style="margin: 3rem 0;">
    <div class="container contact px-lg-0">
        <div class="row g-0 mx-lg-0">
            <!-- 프로필 수정 폼 -->
            <div class="col-md-6 offset-md-3">
                <form class="row g-3" action="updateProfile">
                    <h1 class="mb-4">프로필</h1>
                    <hr>
                    <div class="mb-3 row">
                        <label for="id" class="col-sm-2 col-form-label text-center">아이디</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control-plaintext" name="user_id" value=${loginUser.getUser_id() }>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="Password" class="col-sm-2 col-form-label text-center">비밀번호</label>
                        <div class="col-sm-3">
                            <input type="password" class="form-control" name="user_pw" value=${loginUser.getUser_pw() } readonly>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="kinderName" class="col-sm-2 col-form-label text-center">유치원명</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="user_name" value=${loginUser.getUser_nick() }>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="address" class="col-sm-2 col-form-label text-center">주소</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="user_addr" value=${loginUser.getUser_addr() }>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="tel" class="col-sm-2 col-form-label text-center">전화번호</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="user_tel" value=${loginUser.getUser_phone() }>
                        </div>
                    </div>
                    <!-- 수정 버튼 -->
                    <div class="col-sm-7 offset-sm-8"> <!-- 수정된 부분 -->
                        <!-- <a href="updateProfile" class="btn btn-primary mb-3">수정</a> -->
                        <input type="submit" value="수정" class="btn btn-primary mb-3">
                    </div>
                </form>
                <div class="mb-3 row"></div>
                <div class="mb-3 row"></div>
                <div class="mb-3 row"></div>
            </div>

            <!-- 반 정보 폼 -->
            <div class="col-md-6 offset-md-3">
                <form class="row g-3">
                	<!-- 반 정보 표시 및 삭제 버튼 -->
                	<%for(int i = 0 ; i < loginUserClassList.size(); i++){ %>
                		 <div class="mb-3 row align-items-center">
                            <div class="col-sm-2 text-center">
                                <label for="className" class="col-form-label">반<%=i+1 %></label>
                            </div>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="className<%=i+1 %>" value="<%=loginUserClassList.get(i).getClass_name() %>">
                            </div>
                            <div class="col-auto">
                                <a href="deleteClass?class_idx=<%=loginUserClassList.get(i).getClass_idx()%>&user_id=<%=loginUser.getUser_id()%>">
                                    <img src="${img}/delete.png" style="width: 20px; height: 20px;">
                                </a>
                            </div>
                             <div class="col-sm-3 text-center">
                                <label for="className" class="col-form-label">공유 코드 : <%=loginUserClassList.get(i).getClass_idx()%></label>
                            </div>
                        </div>
                	<%} %>
                    
                
                    <%-- 
                    <!-- 반 정보 표시 및 삭제 버튼 -->
                    <c:forEach items="${loginUserClassList}" var="userClass" varStatus="status">
                        <div class="mb-3 row align-items-center">
                            <div class="col-sm-2 text-center">
                                <label for="className" class="col-form-label">반 이름${status.count}</label>
                            </div>
                            <div class="col-sm-3">
                                <input type="text" class="form-control" id="className${status.count}" value="${loginUserClassList.class_name}">
                            </div>
                            <div class="col-auto">
                                <a href="deleteClass?class_idx=${userClass.class_idx}&user_id=hanbit">
                                    <img src="${img}/delete.png" style="width: 20px; height: 20px;">
                                </a>
                            </div>
                        </div>
                        <%inputcount++; %>
                    </c:forEach> 
                    --%>
                    
                    <!-- 취소 버튼 -->
                    <div class="col-sm-7 offset-sm-8"> <!-- 수정된 부분 -->
                        <button type="submit" class="btn btn-light mb-3">취소</button>
                    </div>
                </form>
            </div>
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