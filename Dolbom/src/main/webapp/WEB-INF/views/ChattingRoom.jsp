<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="IncludeStyleChattingRoom.jsp" %>
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
 	<%-- 
 	<section class="menu-section">
		<h1>
			<a href="https://www.talkplus.io/intro/" target="_blank">
				<img src="${img2}/logo.svg" alt="logo" />
			</a>
		</h1>
		<div class="user-box">
			<img class="user-img" src="${pageContext.request.contextPath}/resources/chattingRoom/images/user_0.png" alt="user image" />
			<div class="name"> <!-- addClass : active -->
				<input type="text" value="제임스" />
			</div>
			<a href="javascript:void(0);" class="btn-alter"></a>
		</div>

		<script>			
			/* document.write('test'); */
			document.write(resp);
		</script>
		<nav class="menu">
			<ul>
				<li class="active"><a href="javascript:void(0);">소셜채팅</a></li>
				<!-- <li><a href="javascript:void(0);">게임/방송채팅</a></li> -->
			</ul>
		</nav>
		<!-- resource btns
		<ul class="resource-box">
			<li><a href="javascript:void(0);" class="btn" /><img src="${img}/icon_resource1.png" />Resource</a></li>
			<li><a href="javascript:void(0);" class="btn" /><img src="${img}/icon_resource2.png" />Resource</a></li>
		</ul>
		-->
	</section> 
	--%>
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
					<!-- message-area -->
					<div class="message-area">
						<!--<div class="message-list avatar">
							<div class="avatar-image"><img src="./images/user_1.png" /></div>
							<div class="message-box">
								<div class="avatar-name">톡플러스</div>
								<div class="message-time">
									<div class="message-text">발송메시지 영역</div>
									<div class="timestamps">오후 00:00</div>
								</div>
							</div>
						</div>
						<div class="message-list wirter">
							<div class="message-box">
								<div class="message-time">
									<div class="timestamps">오후 00:00</div>
									<div class="message-text">발송메시지 영역</div>
								</div>
							</div>
						</div>
						-->
						<!--<div class="message-list avatar">
							<div class="avatar-image"><img src="./images/user_1.png" /></div>
							<div class="message-box">
								<div class="avatar-name">톡플러스</div>
								<div class="message-time">
									<div class="file-area file">
										<a href="javascript:void(0);">
											<sapn class="fileName">톡플러스 샘플파일.txt</sapn>
											<sapn class="fileSize">용량 : 15MB</sapn>
											<sapn class="filedown"></sapn>
										</a>
									</div>
									<div class="timestamps">오후 00:00</div>
								</div>
							</div>
						</div>-->
						<!--<div class="message-list wirter">
							<div class="message-box">
								<div class="message-time">
									<div class="timestamps">오후 00:00</div>
									<div class="file-area picture">
										<a href="https://www.w3schools.com/tags/img_girl.jpg"><img src="https://www.w3schools.com/tags/img_girl.jpg" /></a>
										</div>
									</div>
								</div>
							</div>
						</div>-->
						<!--<div class="message-list wirter">
							<div class="message-box">
								<div class="message-time">
									<div class="timestamps">오후 00:00</div>
									<div class="file-area video">
										<video width="384" controls>
											<source src="https://www.w3schools.com/html/mov_bbb.mp4" type="video/mp4">
										</video>
									</div>
								</div>
							</div>
						</div>-->
						<!--<div class="message-list wirter">
							<div class="message-box">
								<div class="message-time">
									<div class="timestamps">오후 00:00</div>
									<div class="file-area file">
										<a href="javascript:void(0);">
											<sapn class="fileName">톡플러스 샘플파일.txt</sapn>
											<sapn class="fileSize">용량 : 15MB</sapn>
											<sapn class="filedown"></sapn>
										</a>
									</div>
								</div>
							</div>
						</div>-->
					</div>
					<!-- //message-area -->
				</div>
				<!-- //chat-area -->
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