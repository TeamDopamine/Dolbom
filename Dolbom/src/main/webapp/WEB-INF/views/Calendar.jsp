<%@page import="java.util.List"%>
<%@page import="kr.smhrd.entity.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="IncludeStyle.jsp" %>
<!DOCTYPE html>
<html>

<head>

<meta charset="utf-8">
    <title>돌봄</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500&family=Roboto:wght@500;700;900&display=swap" rel="stylesheet"> 

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

<meta charset='utf-8' />
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
<!-- axios -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<!-- 부트스트랩CDN -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
	
 <style>
#calendar {
	margin: 40px 10px;
	padding: 0;
	overflow: hidden;
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
	max-width: 1100px;
	margin: 0 auto;	
}
/* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
.fc-header-toolbar {
	padding-top: 1em;
	padding-left: 1em;
	padding-right: 1em;
}
</style> 
</head>

<body>
<% 
 List<Calendar> calList = (List<Calendar>)session.getAttribute("calList");
%>
<!-- Header -->
 	<jsp:include page="Header.jsp"></jsp:include> 

 <!-- Contact Start -->
    <div class="container-fluid overflow-hidden px-lg-0" style="margin: 3rem 0;">
        <div class="container contact px-lg-0">
          <div class="row g-0 mx-lg-0">
                 
            </div>
        </div>
    </div>
    <!-- Contact End -->

    <div id='calendar'></div>
    <div id='calendar'></div>

	<!-- Footer -->
	 <jsp:include page="Footer.jsp"></jsp:include> 

    <!-- Back to Top -->
    <a href="Calendar" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>

	<!-- calendar 태그 -->
	<div id='calendar-container'>
		<div id='calendar'></div>
	</div>
	<!-- 부트스트랩 modal 부분 -->
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">일정 추가하기</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					일정이름 : <input type="text" id="title" /><br /> 시작시간 : <input
						type="datetime-local" id="start" /><br /> 종료시간 : <input
						type="datetime-local" id="end" /><br /> 
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="saveChanges">
						추가</button>
				</div>
			</div>
		</div>
	</div>
	<script>
      (function () {
        $(function () {
          // calendar element 취득
          var calendarEl = $('#calendar')[0];
          // full-calendar 생성하기
          var calendar; 
          
          // 이벤트 배열 초기화
          var evtList = [];
          
          $.ajax({
            type: "POST",
            url: "selectCalendar",
            contentType: "application/json; charset=utf-8",
            success: function (eventData) {
              result = eventData
              
              evtList = [];
              
              for (let i = 0; i < result.length; i++) {
                  // 종료일자에 1일을 더한 Date 객체 생성
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
                  height:'700px', // calendar 높이 설정
                  expandRows: true, // 화면에 맞게 높이 재설정
                  slotMinTime: '08:00', // Day 캘린더에서 시작 시간
                  slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
                  
                  customButtons: {
                    myCustomButton: {
                      text: "일정 추가하기",
                      click: function () {
                        //부트스트랩 모달 열기
                        $("#exampleModal").modal("show");
                      }
                    },
                    mySaveButton: {
                      text: "저장하기",
                      click: async function () {
                        if (confirm("저장하시겠습니까?")) {	
                        	
                          //지금까지 생성된 모든 이벤트 저장하기
                          var allEvent = calendar.getEvents();
                          /* console.log("모든 이벤트들", allEvent); */
                          alert("저장 완료")
                          //이벤트 저장하기
                          var allEvent = calendar.getEvents();
                          var events = new Array();
                          
                          for (var i = 0; i < allEvent.length; i++) {

                            var objt = new Object();
                            objt.CAL_TITLE = allEvent[i]._def.title;
                            objt.STARTED_AT = allEvent[i]._instance.range.start;
                            objt.ENDED_AT = allEvent[i]._instance.range.end;
                            objt.CLASS_IDX = allEvent[i]._def.class_idx;
                           
                            events.push(objt);
                          }

                          $.ajax({
                            url: 'calSave',
                            contentType: "application/json; charset=utf-8",
                            data: JSON.stringify(events),
                            type: 'post',
                            success: function (result) {
                              
                            },
                            error: function () {
                              alert('ajax 통신 실패');
                            }
                          });
                        }
                      },
                    },
                  },  
                  // 해더에 표시할 툴바
                  headerToolbar: {
                    left: 'prev,next today,myCustomButton,mySaveButton',
                    center: 'title',
                    right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                  },
                  initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
                  navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
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
          });    
          
      //모달창 이벤트
      $("#saveChanges").on("click", function () {
              var eventData = {
                title: $("#title").val(),
                start: $("#start").val(),
                end: $("#end").val(),
              /*color: $("#color").val(),*/
              };
              //빈값입력시 오류
              if (
                eventData.title == "" ||
                eventData.start == "" ||
                eventData.end == ""
              ) {
                alert("입력하지 않은 값이 있습니다.");

                //끝나는 날짜가 시작하는 날짜보다 값이 크면 안됨
              } else if ($("#start").val() > $("#end").val()) {
                alert("시간을 잘못입력 하셨습니다.");
              } else {
                // 이벤트 추가
                calendar.addEvent(eventData);
                $("#exampleModal").modal("hide");
                $("#title").val("");
                $("#start").val("");
                $("#end").val("");
              /*$("#color").val("");*/
              }
            });
        
          });
        })();
    </script>
</body>

</html>