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
                  <!-- 요약일지 섹션  start-->
                  <section class="col intro">
                    <div class="gradient-custom-1 h-100">
                      <div class="mask d-flex align-items-center h-100">
                        <div class="container">
                          <div class="row justify-content-center">
                            <div class="col-12">
                              <div class="table-responsive bg-white">
                                <table class="table mb-0">
                                  <thead>
                                    <h4 style="text-align: center; padding-right: 38%;">일지 요약</h4>
                                    <div class="col-md-6 offset-md-3">
                                      <hr style="width: 750px;">
                                      <div class="mb-3 row"  style="width: 900px;">
                                          <label for="DOC_S_DATE" class="col-sm-2 col-form-label text-center" style="width: 11%;">시작일자</label>
                                          <div class="col-sm-3 col-form-label text-center" style="width: 19%;">
                                              <input type="date" class="form-control " id="DOC_S_DATE" >
                                          </div>
                                          <label for="DOC_E_DATE" class="col-sm-2 col-form-label text-center" style="width: 11%;">종료일자</label>
                                          <div class="col-sm-3 col-form-label text-center" style="width: 19%;">
                                              <input type="date" class="form-control" id="DOC_E_DATE">
                                          </div> 
                                          <div class="col-sm-3 col-form-label text-center">
                                            <button type="submit" class="btn btn-warning mb-3">요약하기</button>
                                          </div>
                                      </div>
                                    </div>
                                    
                                      <div style="padding-left: 25%;">
                                        <label for="DOC_CTX">내용</label>
                                        <div class="col-sm-3">
                                          <textarea type="text" class="form-control" id="DOC_CTX" style="width:750px; height: 300px;"></textarea>
                                        </div>
                                      </div>

                                      <div class="col-auto text-end" style="padding-top: 1.5%; padding-right: 25%;" >
                                          <button type="submit" class="btn btn-light mb-3">취소</button>
                                          <button type="submit" class="btn btn-warning mb-3">수정완료</button>
                                      </div>
                                  </div>
                                  </tbody>
                                </table>
                              </div>
                            </div>
                      </div>
                    </div>
                  </section>
                    <!-- 요약일지 섹션  end-->
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