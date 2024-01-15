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
    <div class="container-fluid overflow-hidden px-lg-0" style="margin: 6rem 0;">
        <div class="container contact px-lg-0">
            <div class="row g-0 mx-lg-0" style="padding-left: 5%; padding-right: 5%;">
              <!-- 교사 섹션  start-->
                <section class="col intro" style="padding-right: 2%;">
                    <div class="gradient-custom-1 h-100">
                      <div class="mask d-flex align-items-center h-100">
                        <div class="container">
                          <div class="row justify-content-center">
                            <div class="col-12">
                              <div class="table-responsive bg-white">
                                <table class="table mb-0">
                                  <thead>
                                    <th>교사()</th>
                                    <tr>
                                      <th scope="col">순번</th>
                                      <th scope="col">아이디</th>
                                      <th scope="col">닉네임</th>
                                      <th scope="col">삭제</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td scope="row">1</td>
                                      <td>System Architect</td>
                                      <td><a href="" style="color: #666666a1;">시스템</a></td>
                                      <td><a href=""><img src="${path}/resources/img/delete.png" style="width: 20px; height: 20px;"></a></td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div> 
                            </div> 
                          </div> 
                          <div class="find-btn" style="padding-top: 3.5%;">
                            <button type="button" class="btn btn-navy navbar-btn find-btn1 pnt-yes" onclick="location.href='/  '">1</button >
                            <button type="button" class="btn btn-grey navbar-btn find-btn1 pnt-no" onclick="location.href='/  '">2</button>
                            <button type="button" class="btn btn-navy navbar-btn find-btn1 pnt-no" onclick="location.href='/  '">3</button>
                            <button type="button" class="btn btn-grey navbar-btn find-btn1 pnt-no" onclick="location.href='/  '">NEXT</button>
                        </div>
                        </div> 
                      </div>
                    </div>
                  </section>
                  <!-- 교사 섹션  end -->
                  <!-- 학부모 섹션  start-->
                  <section class="col intro">
                    <div class="gradient-custom-1 h-100">
                      <div class="mask d-flex align-items-center h-100">
                        <div class="container">
                          <div class="row justify-content-center">
                            <div class="col-12">
                              <div class="table-responsive bg-white">
                                <table class="table mb-0">
                                  <thead>
                                    <th>보호자()</th>
                                    <tr>
                                      <th scope="col">순번</th>
                                      <th scope="col">아이디</th>
                                      <th scope="col">닉네임</th>
                                      <th scope="col">삭제</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td scope="row">1</td>
                                      <td>System Architect</td>
                                      <td><a href="" style="color: #666666a1;">시스템</a></td>
                                      <td><a href=""><img src="${path}/resources/img/delete.png" style="width: 20px; height: 20px;"></a></td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                            <div class="find-btn" style="padding-top: 3.5%;">
                              <button type="button" class="btn btn-navy navbar-btn find-btn1 pnt-yes" onclick="location.href='/  '">1</button >
                              <button type="button" class="btn btn-grey navbar-btn find-btn1 pnt-no" onclick="location.href='/  '">2</button>
                              <button type="button" class="btn btn-navy navbar-btn find-btn1 pnt-no" onclick="location.href='/  '">3</button>
                              <button type="button" class="btn btn-grey navbar-btn find-btn1 pnt-no" onclick="location.href='/  '">NEXT</button>
                          </div>
                        </div>
                      </div>
                    </div>
                  </section>
                    <!-- 학부모 섹션  end-->
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