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

    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=DM Sans:wght@500;700&display=swap"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@500&display=swap"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Pretendard:wght@400;500;700&display=swap"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;700&display=swap"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Helvetica:wght@700&display=swap"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=SF Pro Text:wght@400&display=swap"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;900&display=swap"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Font Awesome 5 Pro:wght@400&display=swap"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=SF UI  Text:wght@400&display=swap"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Karla:wght@400&display=swap"/>
</head>

<body>
    <!-- Header -->
	<jsp:include page="Header.jsp"></jsp:include>
    
    <!-- Contact Start -->
    <div class="container-fluid overflow-hidden px-lg-0" >
        <div class="container contact px-lg-0">
            <div class="row g-0 mx-lg-0">          
                <div class="main">
                    <div class="hero" style="width: 100%; height: 880px; background-image: url(${path}/resources/img/maintop.png);
                    ">
                      <div class="grid43">
                        <div class="grid44">
                          <div class="grid45">
                            <div class="calendar">Features</div>
                            <div class="div361">일정 관리 시스템</div>
                          </div>
                          <div class="senectus-et-netus-container">
                            <p class="senectus-et-netus">
                              Senectus et netus et malesuada fames ac turpis.
                            </p>
                            <p class="senectus-et-netus">
                              Sagittis vitae et leo duis ut diam.
                            </p>
                          </div>
                        </div>
                      </div>
                    </div>

                    <!-- 기능 안내 start -->
                    <div class="features5">
                      <div class="grid46">
                        <div class="grid47">
                          <div class="grid44">
                            <div class="grid49">
                              <div class="calendar">Calendar</div>
                              <div class="div362">일정 관리</div>
                            </div>
                          </div>
                          <div class="list">
                            <div class="item">
                              <div class="badgeold">
                                <img class="richeck-fill-icon" src="${path}/resources/img/checkicon.png"/>
                              </div>
                              <div class="malesuada-ipsum">일정 등록</div>
                            </div>
                            <div class="item">
                              <div class="badgeold">
                                <img class="richeck-fill-icon" src="${path}/resources/img/checkicon.png"/>
                              </div>
                              <div class="malesuada-ipsum">보호자도 확인 가능</div>
                            </div>
                          </div>
                        </div>
                        <div class="app" style="height: 700px;" >
                            <img src="${path}/resources/img/callendar.png" class="mainmobile" style="width: 360px; height:680px;">
                        </div>
                      </div>

                      <div class="grid46">
                        <div class="grid47">
                          <div class="grid44">
                            <div class="grid49">
                              <div class="calendar">Daily record</div>
                              <div class="div362">일지 요약</div>
                            </div>
                          </div>
                          <div class="list">
                            <div class="item">
                              <div class="badgeold">
                                <img class="richeck-fill-icon" src="${path}/resources/img/checkicon.png"/>
                              </div>
                              <div class="malesuada-ipsum">일간 일지 작성</div>
                            </div>
                            <div class="item">
                              <div class="badgeold">
                                <img class="richeck-fill-icon" src="${path}/resources/img/checkicon.png"/>
                              </div>
                              <div class="malesuada-ipsum">Chat-GPT를 통한 일지 요약</div>
                            </div>
                          </div>
                        </div>
                        <div class="app" style="height: 700px;" >
                            <img src="${path}/resources/img/daily.png" class="mainmobile" style="width: 360px; height:680px;">
                        </div>
                      </div>

                      <div class="grid46">
                        <div class="grid47">
                          <div class="grid44">
                            <div class="grid49">
                              <div class="calendar">Chat</div>
                              <div class="div362">채팅</div>
                            </div>
                          </div>
                          <div class="list">
                            <div class="item">
                              <div class="badgeold">
                                <img class="richeck-fill-icon" src="${path}/resources/img/checkicon.png"/>
                              </div>
                              <div class="malesuada-ipsum">1대1 채팅 제한</div>
                            </div>
                            <div class="item">
                              <div class="badgeold">
                                <img class="richeck-fill-icon" src="${path}/resources/img/checkicon.png"/>
                              </div>
                              <div class="malesuada-ipsum">반별 채팅</div>
                            </div>
                            <div class="item">
                              <div class="badgeold">
                                <img class="richeck-fill-icon" src="${path}/resources/img/checkicon.png"/>
                              </div>
                              <div class="malesuada-ipsum">일정 시간 외 채팅 제한</div>
                            </div>
                          </div>
                        </div>
                        <div class="app" style="height: 700px;" >
                            <img src="${path}/resources/img/chatting.png" class="mainmobile" style="width: 360px; height:680px;">
                        </div>
                      </div>

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