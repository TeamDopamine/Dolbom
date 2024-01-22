<%@page import="kr.smhrd.entity.Attendence"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="kr.smhrd.entity.Kindergartener"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="kr.smhrd.entity.Profile"%>
<%@page import="kr.smhrd.entity.Class"%>
<%@page import="java.util.List"%>
<%@page import="kr.smhrd.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="IncludeStyle.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.GregorianCalendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
        button {
            padding: 10px 15px;
            font-size: 1.2em;
            cursor: pointer;
            border: none;
            border-radius: 4px;
        }

        /* 어제 버튼 스타일 */
        button.Y {
            background-color: #32C36C; /* 분홍색 배경 */
            color: #333; /* 글자 색상 */
        }

        /* 내일 버튼 스타일 */
        button.T {
            background-color: #32C36C; /* 녹색 배경 */
            color: #333; /* 글자 색상 */
        }

        .custom-date-input {
            position: relative;
            display: inline-block;
        }

        .custom-date-input input[type=""] {
            padding: 8px;
            border: 1px;
            border-radius: 4px;
            box-sizing: border-box;
            width: 220px; /* 원하는 너비로 조절 */
            background-color: #32C36C;
            font-size: larger;
            font-family: Georgia, 'Times New Roman', Times, serif;
        }

        .custom-date-input::before, .custom-date-input::after {
            font-size: 1em;
            color: #333;
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            pointer-events: none; /* 클릭 이벤트 방지 */
            cursor: pointer;
        }

        .custom-date-input::before {
            left: 10px;
        }

        .custom-date-input::after {
            right: 10px;
        }

        .calendar-buttons {
            position: absolute;
            top: 100%;
            left: 0;
            width: 100%;
            text-align: center;
            padding: 10px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        #myDate {
            padding: 8px;
            border: 1px;
            border-radius: 4px;
            box-sizing: border-box;
            width: 275px; /* 원하는 너비로 조절 */
            background-color: #32C36C;
            font-size: larger;
            font-family: Georgia, 'Times New Roman', Times, serif;
        }
    </style>
</head>
<body>

	<%
	String moveDate = (String)session.getAttribute("moveDate");
	int moveYear = 0;
	int moveMonth = 0;
	if(moveDate != null){
		String year = moveDate.substring(0, 4);
		moveYear = Integer.parseInt(year);
		String month = moveDate.substring(5,7);
		moveMonth = Integer.parseInt(month);
		
		
		/* System.out.println("moveYear : " + moveYear );
		System.out.println("moveMonth : " + moveMonth ); */
	}
	
    // 현재 날짜를 가져오기
    Calendar calendar = new GregorianCalendar();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat currntMont = new SimpleDateFormat("yyyy-MM");
    if(moveDate != null){
	    calendar.set(Calendar.YEAR, moveYear);
	    calendar.set(Calendar.MONTH, moveMonth-1);
	    calendar.set(Calendar.DAY_OF_MONTH, 1);
    }
   
    int startingDayOfWeek = calendar.get(Calendar.DAY_OF_WEEK); // 0부터 시작하도록 조정
    //int startingDayOfMonth = calendar.get(Calendar.DAY_OF_MONTH); // 0부터 시작하도록 조정
    
    String formattedDate = sdf.format(calendar.getTime());
    String formattedDateMonth = currntMont.format(calendar.getTime());
    
    //System.out.println("이것은 .jsp에서 출력한 것입니다. 이번달은 이겁니다!!!!! :  " + formattedDateMonth);
   
    session.setAttribute("currMonth", formattedDateMonth);
    // 현재 월의 마지막 날을 계산하기
    calendar.set(Calendar.DAY_OF_MONTH, calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
    String lastDayOfMonth = sdf.format(calendar.getTime());
    int numberOfDays = Integer.parseInt(lastDayOfMonth.substring(8));

    // 요일 배열
    String[] daysOfWeek = {"토", "일", "월", "화", "수", "목", "금"};
    
    List<Kindergartener> loginClass = (List<Kindergartener>)session.getAttribute("loginClassKinder");
    List<Attendence> attendenceList = (List<Attendence>)session.getAttribute("attendenceList");
	//System.out.println("loginClass2의 값 입니다 : " + loginClass.toString());
	//System.out.println("loginClass2의 size입니다 : " + loginClass.size());
	//System.out.println("numberOfDays의 값 입니다. : " + numberOfDays );
	//System.out.println("startingDayOfWeek 값 입니다. : " + startingDayOfWeek );
	
	if(formattedDateMonth.equalsIgnoreCase("2024-01"))startingDayOfWeek=2;
	
	%>

	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script src="path/to/counterup.min.js"></script>
	
    <!-- Header -->
    <jsp:include page="Header.jsp"></jsp:include>

    <!-- Contact Start -->
    <div class="container-fluid overflow-hidden px-lg-0" style="margin: 6rem 0;">
        <div class="container contact px-lg-0">
            <div class="row g-0 mx-lg-0">
                <!--여기에 적기-->
                <h2 style="background-color: #32C36C;">
    <button onclick="moveToPreviousMonth()" class="Y">
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-left" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0" />
        </svg>
    </button>
    <div class="custom-date-input">
        <input type="text" id="myDate" value="<%= formattedDateMonth %>">
        <div class="calendar-buttons"></div>
        <button onclick="moveToNextMonth()" class="T">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-right" viewBox="0 0 16 16">
                <path fill-rule="evenodd" d="M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708" />
            </svg>
        </button>
    </div>
	</h2>
	<script>
	    const dateInput = document.getElementById('myDate');
	
	    // JavaScript에서는 0이 1월을 나타내므로 1을 더해줍니다.
	    
	    const formattedDate = new Date('<%= formattedDateMonth %>').toISOString().substr(0, 7);
		dateInput.value = formattedDate;
	    <%-- const formattedDate = new Date('<%= formattedDateMonth %>').toISOString().substr(0, 10);
	    dateInput.value = formattedDate; --%>
	
	 // 날짜를 가운데 정렬하기 위해 스타일 추가
	    dateInput.style.textAlign = "center";
	    
	    // 이전 달로 이동하는 함수
	    function moveToPreviousMonth() {
	        const selectedDate = new Date(dateInput.value);
	        selectedDate.setMonth(selectedDate.getMonth() - 1);
	        dateInput.value = selectedDate.toISOString().substr(0, 7);
	        
	     	//이동할 URL 설정
	        const newURL = 'moveMonth?date=' + dateInput.value;
	
	        // 페이지 이동
	        window.location.href = newURL;
	    }
	
	    // 다음 달로 이동하는 함수
	    function moveToNextMonth() {
	        const selectedDate = new Date(dateInput.value);
	        selectedDate.setMonth(selectedDate.getMonth() + 1);
	        dateInput.value = selectedDate.toISOString().substr(0, 7);
	        
	      	//이동할 URL 설정
	        const newURL = 'moveMonth?date=' + dateInput.value;
	
	        // 페이지 이동
	        window.location.href = newURL;
	    }
	</script>
			

                <table id="dynamicTable" style="border-collapse: collapse; border: 1px solid #ddd;">
                
	                <thead>
				        <tr>
				            <th>이름</th>
				            <!-- 테이블 헤더에 현재 월의 일 수에 맞게 칸 생성 -->
				            <% for (int i = 0; i < numberOfDays; i++) {
				            	int dayIndex = (startingDayOfWeek + i) % daysOfWeek.length;
				                //int dayIndex = i % daysOfWeek.length;
				                // 주말인 경우에는 옅은 핑크색 배경을 적용
				                String backgroundColor = (dayIndex == 0 || dayIndex == 1) ? "#ffc0cb" : "#ffffff";
				            %>
				                <th style="background-color: <%= backgroundColor %>; text-align: center; border: 1px solid #ddd;">
				                    <%= i + 1 %><br>
				                    <%= daysOfWeek[dayIndex] %>
				                </th>
				            <% } %>
				        </tr>
				    </thead>
                   <tbody>
                   		
	                    <% // 여러 행에 대한 select 박스를 추가하는 함수
	                    
	                    //System.out.println("loginClass.size() 입니다. : " + loginClass.size() );
						for (int j = 0; j < loginClass.size(); j++) { %>
						    <tr>
						        <!-- 각 행의 첫 번째 열 -->
						        <td style="border: 1px solid #ddd;"><%=loginClass.get(j).getKger_Name() %></td>
						        <!-- 각 행의 나머지 열에 select 박스 추가 -->
						        <% for (int i = 0; i < numberOfDays; i++) {
						            // int dayIndex = (i - 1) % daysOfWeek.length; // i는 1부터 시작하므로 1을 빼주어야 올바른 인덱스 계산
						            int dayIndex = (startingDayOfWeek + i) % daysOfWeek.length;
						            String selectBoxId = "select_" + j + "_" + i;
						            // 주말인 경우에는 핑크색 배경을 적용
						            String backgroundColor = (dayIndex == 0 || dayIndex == 1) ? "#ffc0cb" : "#ffffff";
						        %>
						            <td style="text-align: center; border: 1px solid #ddd; background-color: <%= backgroundColor %>;">
						                <button type="button" id="attBtn<%=j %>_day<%=i %>" onclick="changeText(<%=j %>, <%=i %>)" style="background-color: rgba(0, 0, 0, 0); width: 50px; height: 50px;">
						                	
						                	<%-- <%=attendenceList.get(j * numberOfDays + i).getAtten_type() %> --%>
						                	 
						                	<%if(attendenceList.size() > 0) {%>
						                	<script type="text/javascript">
										        var attenTypeValue = '<%=attendenceList.get(j * numberOfDays + i).getAtten_type() %>';
										        var buttonText;
										
										        switch (attenTypeValue) {
										            case '1':
										                buttonText = '√';
										                break;
										            case '2':
										                buttonText = 'X';
										                break;
										            case '3':
										                buttonText = '△';
										                break;
										            default:
										                buttonText = '';
										        }
										        document.write(buttonText);
										    </script>
						                	<%} %>						   
						                	           
						                
						                </button>
						                
						            </td>
						        <% } %>
						    </tr>
						<% } %>
               
				    </tbody>

                </table>
                
                <!-- <button type="submit" style="float: right; margin-top: 20px; background-color: #4DCE5E;">저장하기</button> -->
                 
                <button type="button" onclick="setAndSubmitButtonValues(<%=loginClass.size() %>, <%=numberOfDays %>)" style="float: right; margin-top: 20px; background-color: #4DCE5E; font-weight: bold; color: #FFFFFF; width: 100px; margin-left: 1750px;">저장하기</button>
   
            </div>
        </div>
    </div>
    
    <script>
    function changeText(row, day) {
        var button = document.getElementById('attBtn' + row + '_day' + day);
        
        // 현재 텍스트 가져오기
        var currentText = button.innerText;

        // 텍스트 변경
        if (currentText === '√') {
            button.innerText = 'X';
        } else if (currentText === 'X') {
            button.innerText = '△';
        } else if (currentText === '△') {
            button.innerText = '';
        } else {
            button.innerText = '√';
        }
    }
    
    
    function setAndSubmitButtonValues(loginClassSize, numberOfDays) {
    	var button;
    	var currentText;
    	var values = []; // 값을 저장할 2차원 배열 생성
    	
    	for(var row = 0; row < loginClassSize; row++){
    		values[row] = []; // 각 행(row)에 대한 서브 배열 생성
    		for(var day = 0; day < numberOfDays; day++){
    			button = document.getElementById('attBtn' + row + '_day' + day);
    			currentText = button.innerText;
    			values[row][day] = currentText; // 값을 배열에 저장
    		}
    	}
    	//alert(values)
    	 // values 배열을 JSON 문자열로 변환
        var buttonValuesString = JSON.stringify(values);
    	
    	// AJAX를 사용하여 서버로 데이터 전송
        $.ajax({
            type: 'POST',
            url: 'insertAttendence', // 실제 컨트롤러 엔드포인트 경로로 대체
            contentType: 'application/json',
            data: buttonValuesString,
            success: function(response) {
                // 성공적으로 서버에서 응답을 받았을 때 수행할 작업
                console.log('Data sent successfully');
                console.log(response);
            },
            error: function(error) {
                // 서버 전송 중 오류가 발생했을 때 수행할 작업
                console.error('Error sending data to the server');
                console.error(error);
            }
        });
    }
    
    
    
	</script>

    <!-- Contact End -->

    <!-- Footer -->
    <jsp:include page="Footer.jsp"></jsp:include>

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top">
        <i class="bi bi-arrow-up"></i>
    </a>

</body>
</html>