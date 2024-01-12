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
            <div class="row g-0 mx-lg-0">
                <section class="intro">
                    <div class="gradient-custom-1 h-100">
                      <div class="mask d-flex align-items-center h-100">
                        <div class="container">
                          <div class="row justify-content-center">
                            <div class="col-12">
                              <div class="table-responsive bg-white">
                                <b>새싹반</b>
                                <br>
                                <br>
                                <table class="table mb-0">
                                  <thead>
                                    <tr>
                                      <th scope="col">순번</th>
                                      <th scope="col">이름</th>
                                      <th scope="col">생년월일</th>
                                      <th scope="col">성별</th>
                                      <th scope="col">주소</th>
                                      <th scope="col">전화번호</th>
                                      <th scope="col">삭제</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                    <tr>
                                      <td scope="row">1</td>
                                      <td>양서현</td>
                                      <td>1996.07.08</td>
                                      <td>여</td>
                                      <td>광주 동구 어쩌구저쩌구로 17-3, 돌봄아파트 203호</td>
                                      <td>010-1234-5678</td>
                                      <td><a href=""><img src="./img/delete.png" style="width: 20px; height: 20px;"></a></td>
                                    </tr>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </section>

                <!--pagination start-->
                <div class="find-btn" style="padding-top: 3.5%; text-align: center;">
                    <button type="button" class="btn btn-navy navbar-btn find-btn1 pnt-yes" onclick="location.href='/  '">1</button >
                    <button type="button" class="btn btn-grey navbar-btn find-btn1 pnt-no" onclick="location.href='/  '">2</button>
                    <button type="button" class="btn btn-navy navbar-btn find-btn1 pnt-no" onclick="location.href='/  '">3</button>
                    <button type="button" class="btn btn-grey navbar-btn find-btn1 pnt-no" onclick="location.href='/  '">NEXT</button>
                    </div>
                <!--pagination end-->

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