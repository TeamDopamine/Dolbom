<%@page import="kr.smhrd.entity.Record"%>
<%@page import="java.util.List"%>
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
	<%
    List<Record> Record = (List<Record>)session.getAttribute("Record"); 
	kr.smhrd.entity.Class loginUserClass = (kr.smhrd.entity.Class)session.getAttribute("loginUserClass");
    %>
    <!-- Header -->
	<jsp:include page="Header.jsp"></jsp:include>

    <!-- Contact Start -->
    <div class="container-fluid overflow-hidden px-lg-0" style="margin: 6rem 0;">
        <div class="container contact px-lg-0">
            <div class="row g-0 mx-lg-0">
                <section class="col intro">
                    <div class="gradient-custom-1 h-100">
                      <div class="mask d-flex align-items-center h-100">
                        <div class="container">
                          <div class="row justify-content-center">
                            <div class="col-12">
                              <div class="table-responsive bg-white">
                                <table class="table mb-0">
                                  <thead>
                                    <tr>
                                      <th scope="col">순번</th>
                                      <th scope="col">작성일</th>
                                      <th scope="col">교육명</th>
                                      <th scope="col">작성자</th>
                                      <th scope="col">삭제</th>
                                    </tr>
                                  </thead>
 									<c:forEach items="${rcList }" var="rc" varStatus="status">
 									<c:set var="pageNumber" value="${(page * pageSize) + status.count}" />
										<tr>
											<td scope="row">${pageNumber }</td>
											<td>${rc.edu_time.substring(0,10) }</td>
											<td><a href="goRecordContent?idx=${rc.record_idx }" style="color: #4a4a4a;">${rc.edu_name }</a></td>
											<td><%=loginUserClass.getClass_name() %></td><%-- ${rc.user_id } --%>
											<td><a href="recordDelete?idx=${rc.record_idx }"><img src="${path}/resources/img/delete.png" style="width: 20px; height: 20px;"></a></td>
										</tr>
									</c:forEach>  
                                  </tbody>
                                </table>
                                
                                <div class="find-btn" style="padding-top: 3.5%;">
										
										<c:if test="${currentPage > 0}">
										    <!-- 현재 페이지가 0보다 큰 경우에만 Prev 버튼을 활성화합니다 -->
										    <a href="goRecordList?page=${currentPage - 10}">
										        <button type="button" class="btn navbar-btn find-btn1 pnt-yes" style="margin: 5px" onclick="goToPage(currentPage)">이전</button>
										    </a>
										</c:if>
										
										<div class="btn-group" role="group">
										    <c:forEach var="i" begin="${startPage}" end="${endPage}" >
										            <a href="goRecordList?page=${i}">
										            	<button type="button" class="btn navbar-btn find-btn1 pnt-no" style="margin: 3px" id="pgBtn${i}">${i + 1}</button>
												            <script>
												                if (${i eq currentPage}) {
												                    var currentPageBtn = document.getElementById('pgBtn${i}');
												                    currentPageBtn.style.backgroundColor = '#808080';  // 배경색 변경
												                    currentPageBtn.style.color = '#ffffff';  // 글자색 변경
												                    currentPageBtn.style.fontWeight = 'bold';  // 글자 굵기 변경
												                }
												            </script>
										        	</a>
										    </c:forEach>
										</div>
										
										<c:if test="${currentPage < totalPages - 1}">
										    <!-- 현재 페이지가 마지막 페이지가 아닌 경우에만 Next 버튼을 활성화합니다 -->
										    <a href="goRecordList?page=${currentPage + 10}">
										    	<c:if test=""></c:if>
										        <button type="button" class="btn navbar-btn find-btn1 pnt-yes" style="margin: 5px" onclick="goToPage(currentPage)">다음</button>
										    </a>
										</c:if>
										</div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </section>
            </div>
        </div>
    </div>
    <!-- Contact End -->

	<!-- Footer -->
	<jsp:include page="Footer.jsp"></jsp:include>

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>
</body>

<script>
     function goToPage(page) {
         $.ajax({
             type: "GET",
             url: "goRecordList", // 컨트롤러의 매핑 주소
             data: { 
            	 currentPage: currentPage, 
            	 startPage: startPage
             },
             
             success: function(response) {
                 // 성공 시 수행할 작업 (예: 결과를 화면에 반영)
                 // response 변수에는 서버에서 전달한 데이터가 들어있을 수 있습니다.
             },
             error: function(error) {
                 // 에러 시 수행할 작업
                 console.error("Error:", error);
             }
         });
     }
</script>

</html>