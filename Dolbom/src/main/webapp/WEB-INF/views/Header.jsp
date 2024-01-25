<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.List"%>
<%@page import="kr.smhrd.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<c:set var="img" value="${pageContext.request.contextPath}/resources/img"/>

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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=DM Sans:wght@500;700&display=swap"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@500&display=swap"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Pretendard:wght@400;500;700&display=swap"/>

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <style>
      @font-face {
        font-family: 'Pretendard';
        src: url(./css/Pretendard-Regular.otf);
      }
    </style>
</head>

<body>
	<%
	int sessParentsChat = (int)session.getAttribute("sessParentsChat");
	int sessParentsCal = (int)session.getAttribute("sessParentsCal");
	User loginUser = (User)session.getAttribute("loginUser"); 
	kr.smhrd.entity.Class loginUserClass = (kr.smhrd.entity.Class) session.getAttribute("loginUserClass");
	List<kr.smhrd.entity.Class> loginUserClassList = (List<kr.smhrd.entity.Class>)session.getAttribute("loginUserClassList");
	int openProfile = (int)session.getAttribute("openProfile");
	String loginState = (String)session.getAttribute("loginState");
	%>
	
    <!-- Header Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top p-0">
    	<% if(loginUser == null || loginUser.getUser_type().equals("a")){%>
        	<a href="Intro" class="navbar-brand d-flex align-items-center px-4 px-lg-5" >
	        	<b class="m-0 text-primary" style="padding-right: 5%; font-size: 32px; padding-left: 50%; font-family: 'Pretendard'">돌봄</b>
	            <img class="icon21" alt="" src="${img}/logo.png" />
       		</a>
        <%}else{ %>
        	<a href="goMain?class_idx=${loginUserClassIdx}" class="navbar-brand d-flex align-items-center px-4 px-lg-5" >
	        	<b class="m-0 text-primary" style="padding-right: 5%; font-size: 32px; padding-left: 50%; font-family: 'Pretendard'">돌봄</b>
	            <img class="icon21" alt="" src="${img}/logo.png" />
       		</a>
        <%} %>
            
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
	            <%if(loginUser != null ){ %><!-- && !loginUser.getUser_type().equals("a") -->
	            	  <a href="goKgerList?page=0" class="nav-item nav-link">원생관리</a>
	                <a href="goAttendence" class="nav-item nav-link">출석부</a>
	                <a href="goCalendar" class="nav-item nav-link">일정관리</a>
	                <a href="goChattingRoom" class="nav-item nav-link">채팅방</a>
	                <div class="nav-item dropdown">
	                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">일지</a>
	                    <div class="dropdown-menu bg-light m-0">
	                        <a href="goRecordList?page=0" class="dropdown-item">일지 목록</a>
	                        <a href="goRecordWrite" class="dropdown-item">일지 작성</a>
	                        <a href="goRecordSummary" class="dropdown-item">일지 요약</a>
	                    </div>
	                </div>
	                <% if (loginUserClass != null && loginUserClassList != null && loginUserClassList.size() > 0) { %>
	                <div class="nav-item dropdown d-flex">
					    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" >
					    		<%=loginUserClass.getClass_name()%> 반
					    </a>
					    <div class="dropdown-menu bg-light m-0">
					        <% for (int i = 0; i < loginUserClassList.size(); i++) { %>
					            <% if (loginUserClassList.get(i).getClass_idx() != loginUserClass.getClass_idx()) { %>
					                <a href="goMain?class_idx=<%=loginUserClassList.get(i).getClass_idx()%>" class="dropdown-item"><%=loginUserClassList.get(i).getClass_name() %></a>
					            <% } %>
					        <% } %>
					    </div>
					</div> 
					<% } %> 
		 		<%}%>
			 	<% if (loginState == null || loginUser == null) { %>
	                <form action="goCalendarParents" method="POST" class="row">
	                    <!-- 텍스트 입력을 받을 input -->
	                    <div class="col-md-6 mb-3 mx-auto mt-3">
	                        <input type="text" id="text_input" placeholder="공유 코드 입력" name="calendarCode" class="form-control" style="width: 180%;">
	                    </div>
	                    <!-- 버튼 (submit 역할) -->
	                    <div class="col-md-6 mb-3 mx-auto">
	                        <button type="submit" class="btn btn-light mb-3" style="opacity: 0;"></button>
	                    </div>
	                </form>
	                <%if (sessParentsCal == 1) { %>
	                	<a href="goChattingRoom" class="nav-item nav-link">채팅방</a>
	                <% } %>
	            <% } %>
               
               	<%if(loginUser == null){ %>
					<a href="goLoginButton" class="nav-item nav-link active">로그인</a>
				<%}else { %>
					<%if(loginUser.getUser_type().equals("a")) {%>
						<a href="goAdmin?page=0" class="nav-item nav-link active">회원관리<i class="bi bi-list"></i></a>
					<%} else { %>
	                    <% if(openProfile == 1) { %>
		                    <% openProfile = 0; %>
		                    <% session.setAttribute("openProfile", openProfile); %>
		                    <a href="goClassSelect" class="nav-item nav-link active">반 생성</a>
		                    <a href="goProfile" class="nav-item nav-link active">${loginUser.user_id } 님 <i class="bi bi-file-person"></i></a>
		                <% } else { %>
		                    <a href="goProfile" class="nav-item nav-link active">${loginUser.user_id } 님 <i class="bi bi-file-person"></i></a>
		                <% } %>
		            <% } %>
		        <% } %>
                
            </div>
           					<%if(loginUser == null){ %>
								<a href="goSignUp" class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block">회원가입<i class="fa fa-arrow-right ms-3"></i></a>
							<%}else { %>
								<a href="logoutUser" class="btn btn-primary rounded-0 py-4 px-lg-5 d-none d-lg-block">로그아웃<i class="fa fa-arrow-right ms-3"></i></a>
							<%} %>
        </div>
    </nav>
    <!-- Header End -->
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>