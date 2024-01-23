<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="IncludeStyle.jsp" %>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
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
   List<kr.smhrd.entity.Class> loginUserClassList = (List<kr.smhrd.entity.Class>)session.getAttribute("loginUserClassList");
   /* System.out.println("loginUserClassList.toString()입니다. : " + loginUserClassList.toString()); */  
   %>
   
	<!-- Header -->
	<jsp:include page="Header.jsp"></jsp:include>

    <!-- Contact Start -->
    <div class="bodybutton" style="margin-top: 100px; margin-left: 100px;">
        <button type="button" class="createClass" onclick="addNewButton()">+</button>
        <% if(loginUserClassList != null){ %>
        	<% for(int i = 0; i < loginUserClassList.size(); i++){%>
	        	  <!--   
	        	  for문을 돌면서 버튼을 그린다.
	        	  버튼에 써지는 글자는 리스트가 가지고 있는 class_name이다.
	        		
	        	  해당 버튼이 눌리면 리스트의 그 값이 session에 입력된다.
	              session 이름은 loginUserClass 
	              -->
	             <a href="goMain?class_idx=<%=loginUserClassList.get(i).getClass_idx() %>">
                 	<button type="button" class="createdClass createListClass"><%=loginUserClassList.get(i).getClass_name() %></button>
                 	<script>
	    	            var color<%=i%> = [
	    	            	"#FFD1DC", "#FFC0CB", "#FFB6C1", // 연한 분홍
	    	            	"#ADD8E6", "#87CEEB", "#87CEFA", // 연한 파랑
	    	            	"#98FB98", "#90EE90", "#00FA9A", // 연한 녹색
	    	            	"#D3D3D3", "#A9A9A9", "#808080", // 연한 회색
	    	            	"#FFA07A", "#FA8072", "#E9967A", // 연한 살구/주황
	    	            	"#87CEEB", "#48D1CC", "#40E0D0", // 연한 청록/하늘색
	    	            	"#FFD700", "#FFC125", "#FFB90F", // 연한 금색/주황색
	    	            	"#98FB98", "#90EE90", "#00FA9A", // 연한 녹색
	    	            	"#E6E6FA", "#D8BFD8", "#DDA0DD"  // 연한 보라색
	                    ];
	                    var num<%=i%> = Math.floor(Math.random() * color<%=i%>.length);
	                    $('.createListClass:eq(<%=i%>)').css('background-color', color<%=i%>[num<%=i%>]); // 버튼에 동적으로 색상 적용
                 	</script>
                 </a>
        	
        	<% }%>
        <% }%>
    </div>
    <!-- Contact End -->

    <!-- Footer -->
	<jsp:include page="Footer.jsp"></jsp:include>
    
    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>

	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
	    function addNewButton() {
			 var color = [
				 "#FFD1DC", "#FFC0CB", "#FFB6C1", // 연한 분홍
				 "#ADD8E6", "#87CEEB", "#87CEFA", // 연한 파랑
				 "#98FB98", "#90EE90", "#00FA9A", // 연한 녹색
				 "#D3D3D3", "#A9A9A9", "#808080", // 연한 회색
				 "#FFA07A", "#FA8072", "#E9967A", // 연한 살구/주황
				 "#87CEEB", "#48D1CC", "#40E0D0", // 연한 청록/하늘색
				 "#FFD700", "#FFC125", "#FFB90F", // 연한 금색/주황색
				 "#98FB98", "#90EE90", "#00FA9A", // 연한 녹색
				 "#E6E6FA", "#D8BFD8", "#DDA0DD"  // 연한 보라색
			];
	        var num = Math.floor(Math.random() * color.length);
	        
        	 // 사용자로부터 이름 입력 받기
	        var className = prompt("이름을 입력하세요.");
			
	        // 확인 버튼을 누르거나 이름이 비어있지 않을 경우 처리
	        if (className !== null && className.trim() !== "") {
	            // 버튼을 추가할 부분 선택 (예: body)
	            let targetElement = $('.bodybutton');

	            // 새로운 버튼 생성 및 스타일링
	            var newButton = $(`<a href="#"><button class='createdClass'></button></a>`);
	            newButton.find('button').css('background-color', color[num]); // 버튼에 동적으로 색상 적용
	            targetElement.append(newButton);
	            var newButtonLast = targetElement.find('.createdClass').last(); // 마지막으로 추가된 버튼 선택
	            newButtonLast.text(className);
	            
	         	// 백엔드로 데이터 전송 (Ajax 사용)
	            sendDataToBackend(className);
	        } else {
	            alert("이름을 입력하지 않았거나 취소하셨습니다. 새로운 버튼이 생성되지 않습니다.");
	        }
        
	    }
	    
	    function sendDataToBackend(className) {
	        // Ajax 요청 보내기
	        $.ajax({
	            type: 'POST', // 또는 'GET'
	            url: 'createClass', // 백엔드 API의 엔드포인트
	            data: { className: className },
	            success: function(response) {
	                console.log('백엔드 응답:', response);
	                // 성공적으로 백엔드에 데이터를 전송한 후 수행할 작업을 여기에 추가
	            },
	            error: function(error) {
	                console.error('Ajax 요청 중 에러 발생:', error);
	            }
	        });
	    }
	</script>

</body>

</html>