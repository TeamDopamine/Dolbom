<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="IncludeStyle.jsp"%>
<%@page import="java.util.List"%>
<%@page import="kr.smhrd.entity.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="kr.smhrd.entity.Record"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->

<title>돌봄</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">
<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<!-- jquery CDN -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fullcalendar CDN -->
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'
	rel='stylesheet' />
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>

<!-- inject:css -->
<link rel="stylesheet" href="${path}/resources/css/style2.css">
<!-- endinject -->

<style>
#calendar1 {
	margin: 40px 10px;
	padding: 0;
	overflow: hidden;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 13px;
	max-width: 800px;
	margin: 0 auto;
    color: black;
}

#calendar2 {
	margin: 40px 10px;
	padding: 0;
	overflow: hidden;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 13px;
	max-width: 800px;
	margin: 0 auto;
}


/* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
.fc-header-toolbar {
	padding-top: 1em;
	padding-left: 1em;
	padding-right: 1em;
	font-size: 12px;
}

 #contain {
  max-width: 80%;
  margin: 0 auto;
  flex-direction: column;
  align-items: center;
  box-sizing: border-box;
  padding-bottom: 0;
} 
.all {
	position: relative;
	align-items: center;
	left: 105px;
}

/* .footer {
	position: relative;
	top: 300px;
} */

/*  .footer {
    position: relative;
    top: 800px;
    width: 126%;
    right: 167px;
} */
</style>

</head>
<body>

	<!-- Header -->
	<jsp:include page="Header.jsp"></jsp:include>

	<div id="contain"
	style="background-image: url(${path}/resources/img/MainBackgroundIMG.png); background-size: cover;"
	style="align-self: center !important;">
		<!-- partial -->
		<div style="text-align: center !important;">
			<div class="all">
				<div class="row">

					<div class="col-md-5 grid-margin stretch-card">
						<div class="card card-display">
							<div>
							
								<!-- 1 -->
								<!-- Contact End -->
								<div id='calendar1'></div>
							
								<!-- calendar 태그 -->
									<div id='calendar1'></div>
									<script>
								      (function () {
								        $(function () {
								          // calendar element 취득
								          var calendarEl = $('#calendar1')[0];
								          // full-calendar 생성하기
								          var calendar; 
								          var evtList = [];
								          
								          $.ajax({
								            type: "POST",
								            url: "selectCalendar",
								            contentType: "application/json; charset=utf-8",
								            success: function (eventData) {
								              result = eventData
								              
								              console.log(result);
								              
								              for(let i = 0; i < result.length; i++){
								            	  var endDate = new Date(result[i]['ended_AT']);
								                  endDate.setDate(endDate.getDate() + 1);

								                  var evt = {
								                      "title": result[i]['cal_TITLE'],
								                      "start": result[i]['started_AT'],
								                      "end": endDate
								                  };
								                  evtList.push(evt);
								          		}
								              calendar = new FullCalendar.Calendar(calendarEl, {
								                  width:'350px',
								                  height: '350px', // calendar 높이 설정
								                  expandRows: true, // 화면에 맞게 높이 재설정
								                  slotMinTime: '08:00', // Day 캘린더에서 시작 시간
								                  slotMaxTime: '20:00', // Day 캘린더에서 종료 시간                 
								                  initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
								                  nowIndicator: true, // 현재 시간 마크
								                  dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
								                  locale: 'ko', // 한국어 설정
								
								                  select: function (arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
								
								                    calendar.unselect()
								                  },
								                  //데이터 가져오는 이벤트
								                  events: evtList
								                      });
								                calendar.render();
								            }
								          })    
								          });
								        })();
								    </script>
								</div>
							</div>
						</div>

						<div class="col-md-5 grid-margin stretch-card">
							<div class="card card-display">
								<div>
									<!-- 2 -->
                  	<!-- Contact Start -->
								
              		<!-- Contact End -->
             		 <div id='calendar2'></div>
             		<!-- calendar 태그 -->
                	 <div id='calendar2'></div>	
					                <script>
					                  (function () {
					                    $(function () {
					                      // calendar element 취득
					                      var calendarEl = $('#calendar2')[0];
					                      // full-calendar 생성하기
					                      var calendar; 
					                      var evtList = [];
					                      
					                      $.ajax({
					                        type: "POST",
					                        url: "selectCalendar",
					                        contentType: "application/json; charset=utf-8",
					                        success: function (eventData) {
					                          result = eventData
					                          
					                          console.log(result);
					                          
					                          for(let i = 0; i < result.length; i++){
					                        	  var endDate = new Date(result[i]['ended_AT']);
					                              endDate.setDate(endDate.getDate() + 1);

					                              var evt = {
					                                  "title": result[i]['cal_TITLE'],
					                                  "start": result[i]['started_AT'],
					                                  "end": endDate
					                              };
					                              evtList.push(evt);
					                          }
					                          calendar = new FullCalendar.Calendar(calendarEl, {
					                              width:'350px',
					                              height: '350px', // calendar 높이 설정
					                              expandRows: true, // 화면에 맞게 높이 재설정
					                              slotMinTime: '08:00', // Day 캘린더에서 시작 시간
					                              slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
					                              initialView: 'dayGridWeek', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
					                              nowIndicator: true, // 현재 시간 마크
					                              dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
					                              locale: 'ko', // 한국어 설정
					            
					                              select: function (arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
					            
					                                calendar.unselect()
					                              },
					                              //데이터 가져오는 이벤트
					                              events: evtList
					                                  });
					                            calendar.render();
					                        }
					                      })    
					                      });
					                    })();
					                </script>			
								</div>
							</div>
						</div>
					</div>

					<div class="row" style="margin-top: 10px;">

						<div class="col-md-5 grid-margin stretch-card">
							<div class="card card-display">
								<div>
									<p class="card-title">최근일지</p>
								  <!-- Contact Start -->
								    <div class="container-fluid overflow-hidden px-lg-0">
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
								                                    </tr>
								                                  </thead>
								 									<c:forEach items="${rcList }" var="rc" varStatus="s">
								 									<c:if test="${s.count <= 5}">
																		<tr>
																			<td scope="row">${s.count }</td>
																			<td>${rc.edu_time.substring(0,10) }</td>
																			<td><a href="goRecordContent?idx=${rc.record_idx }" style="color: #666666a1;">${rc.edu_name }</a></td>
																			<td>${rc.user_id }</td>
																		</tr>
																	</c:if>
																	</c:forEach>  
								                                  </tbody>
								                                </table>
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
								</div>
							</div>
						</div>

						<div class="col-md-5 grid-margin stretch-card">
							<div class="card card-display" style="size: 50px;">
								<div>
										<h4 class="card-title">To Do Lists</h4>
										<div class="list-wrapper pt-2">
											<ul
												class="d-flex flex-column-reverse todo-list todo-list-custom">
												<li>
													<div class="form-check form-check-flat">
														<label class="form-check-label" style="color: black;">
															<input class="checkbox" type="checkbox"> Meeting
															with Urban Team
														</label>
													</div> <i class="remove bi bi-x" style="font-size: 25px;"></i>
												</li>
												<li class="completed">
													<div class="form-check form-check-flat">
														<label class="form-check-label" style="color: black;">
															<input class="checkbox" type="checkbox" checked>
															Duplicate a project for new customer
														</label>
													</div> <i class="remove bi bi-x" style="font-size: 25px;"></i>
												</li>
												<li>
													<div class="form-check form-check-flat">
														<label class="form-check-label" style="color: black;">
															<input class="checkbox" type="checkbox"> Project
															meeting with CEO
														</label>
													</div> <i class="remove bi bi-x" style="font-size: 25px;"></i>
												</li>
												<li class="completed">
													<div class="form-check form-check-flat">
														<label class="form-check-label" style="color: black;">
															<input class="checkbox" type="checkbox" checked>
															Follow up of team zilla
														</label>
													</div> <i class="remove bi bi-x" style="font-size: 25px;"></i>
												</li>
											</ul>
										</div>
										<div class="add-items d-flex mb-0 mt-2">
											<input type="text" class="todo-list-input" placeholder="입력하기">
											<i
												class="add btn btn-icon text-primary todo-list-add-btn bg-transparent bi bi-plus-circle"
												style="margin-top: 5px;"></i>
										</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<!-- Footer -->
		<jsp:include page="Footer.jsp"></jsp:include>

		<!-- plugins:js -->
		<script src="${path}/resources/js/vendor.bundle.base.js"></script>
		<!-- endinject -->
		<!-- Plugin js for this page -->
		<script src="${path}/resources/js/Chart.min.js"></script>
		<script src="${path}/resources/js/jquery.dataTables.js"></script>
		<script src="${path}/resources/js/dataTables.bootstrap4.js"></script>
		<script src="${path}/resources/js/dataTables.select.min.js"></script>

		<!-- End plugin js for this page -->
		<!-- inject:js -->
		<script src="${path}/resources/js/off-canvas.js"></script>
		<script src="${path}/resources/js/hoverable-collapse.js"></script>
		<script src="${path}/resources/js/template.js"></script>
		<script src="${path}/resources/js/settings.js"></script>
		<script src="${path}/resources/js/todolist.js"></script>
		<!-- endinject -->
		<!-- Custom js for this page-->
		<script src="${path}/resources/js/dashboard.js"></script>
		<script src="${path}/resources/js/Chart.roundedBarCharts.js"></script>
		<!-- End custom js for this page-->
</body>

</html>
