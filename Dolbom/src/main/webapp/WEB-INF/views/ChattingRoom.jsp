<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="IncludeStyle.jsp" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Insert title here</title>

</head>
<body>
<%
	kr.smhrd.entity.Class loginUserClass = (kr.smhrd.entity.Class)session.getAttribute("loginUserClass");
%>
<!-- Header -->
<jsp:include page="Header.jsp"></jsp:include>
<div class="wrap">
	<script>
 		const numOfRows = 20;
		const resp = await client.getPublicChannels({
			limit: numOfRows,
			category: 'important_channels', // optional
			subcategory: 'important_subcategory' // optional
		});
		// fetch more channels
		if (resp.hasNext) {
			const lastChannelId = resp.channels[resp.channels.length - 1].id;
			const moreChannelsResp = await client.getPublicChannels({
												lastChannelId,
												limit: numOfRows,
											});
		}
	</script>
	<main class="chat-wrap">
		<div class="chat-wrap-inner">
			<div class="chat-container">
				<%if(loginUserClass != null){%>
					<h2 class="chat-title"><%=loginUserClass.getClass_name()%> 반</h2>
				<%}%>
				<!-- chat-area -->
				<div class="chat-area" id="chatView">
					<div class="date"></div>
					<div class="notibox">
						<span>채팅방 운영정책 및 공지를 입력할 수 있는 영역입니다</span>
					</div>
					
					<div class="message-area">
					</div>
				</div>
				<!-- message-write-area -->
				<div class="message-write-area">
					<div class="message-write-inner">
						<div class="btn-attach">
							<a href="javascript:void(0);"></a>
						</div>
						<div class="attach-box">
							<ul>
								<li>
									<a class="attach pic" href="javascript:void(0);">사진첨부</a>
								</li>
								<li>
									<a class="attach video" href="javascript:void(0);">동영상 첨부</a>
								</li>
								<li>
									<a class="attach file" href="javascript:void(0);">파일첨부</a>
								</li>
							</ul>
						</div>
						<div class="write-box">
							<input type="text" class="enterMessage" placeholder="메시지를 입력해주세요.">
						</div>
						<a class="btn-send" id="btnEnterMessage" href="javascript:void(0);">전송</a>
					</div>
				</div>
				<!-- //message-write-area -->
			</div>
		</div>
	</main>
</div>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"
	integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
<script src="https://asset.talkplus.io/npm/talkplus-0.4.10"></script>
<!-- Footer -->
<jsp:include page="Footer.jsp"></jsp:include>
</body>

</html>