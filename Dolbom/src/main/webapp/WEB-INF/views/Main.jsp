<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="IncludeStyle.jsp"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->

<title>돌봄</title>

<!-- inject:css -->
<link rel="stylesheet" href="${path}/resources/css/style2.css">
<!-- endinject -->

<style>
/* #contain {
  max-width: 80%;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  align-items: center;
  box-sizing: border-box;
  padding-bottom: 80px;
}  */
.all {
	position: relative;
	left:105px;
	
}

.footer{
	position :relative;
	top:800px;
}

/*         .footer {
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
	
	<div id="contain">
		<!-- partial -->
		<div style="margin: 0 auto; text-align: center;">
			<div class="all" >
				<div class="row">

					<div class="col-md-5 grid-margin stretch-card">
						<div class="card card-display">
							<div class="card-body">
								<!-- 1 -->
								<p class="card-title">캘린더</p>
								<p style="color: black;">여기에 추가하기</p>
								<p style="color: black;">여기에 추가하기</p>
								<p style="color: black;">여기에 추가하기</p>
								<p style="color: black;">여기에 추가하기</p>
								<p style="color: black;">여기에 추가하기</p>
								<p style="color: black;">여기에 추가하기</p>
								<p style="color: black;">여기에 추가하기</p>
								<p style="color: black;">여기에 추가하기</p>
								<p style="color: black;">여기에 추가하기</p>
								<p style="color: black;">여기에 추가하기</p>
								<p style="color: black;">여기에 추가하기</p>
								<p style="color: black;">여기에 추가하기</p>
								<p style="color: black;">여기에 추가하기</p>
								<p style="color: black;">여기에 추가하기</p>
							</div>
						</div>
					</div>

					<div class="col-md-5 grid-margin stretch-card">
						<div class="card card-display">
							<div class="card-body">
								<!-- 2 -->
								<p class="card-title">주간일정</p>
								<p style="color: black;">여기에 추가하기</p>
							</div>
						</div>
					</div>
				</div>

				<div class="row" style="margin-top: 10px;">

					<div class="col-md-5 grid-margin stretch-card">
						<div class="card card-display">
							<div class="card-body">
								<p class="card-title">최근일지</p>
								<p style="color: black;">여기에 추가하기</p>
							</div>
						</div>
					</div>

					<div class="col-md-5 grid-margin stretch-card">
						<div class="card card-display" style="size=50px;">
							<div class="card-body">
								<div class="card-body">
									<h4 class="card-title">To Do Lists</h4>
									<div class="list-wrapper pt-2">
										<ul
											class="d-flex flex-column-reverse todo-list todo-list-custom">
											<li>
												<div class="form-check form-check-flat">
													<label class="form-check-label" style="color:black;"> <input class="checkbox" type="checkbox">
														Meeting with Urban Team
													</label>
												</div> <i class="remove bi bi-x" style="font-size: 25px;"></i>
											</li>
											<li class="completed">
												<div class="form-check form-check-flat">
													<label class="form-check-label" style="color:black;"> <input
														class="checkbox" type="checkbox" checked>
														Duplicate a project for new customer
													</label>
												</div> <i class="remove bi bi-x" style="font-size: 25px;"></i>
											</li>
											<li>
												<div class="form-check form-check-flat">
													<label class="form-check-label" style="color:black;"> <input
														class="checkbox" type="checkbox"> Project meeting
														with CEO
													</label>
												</div> <i class="remove bi bi-x" style="font-size: 25px;"></i>
											</li>
											<li class="completed">
												<div class="form-check form-check-flat">
													<label class="form-check-label" style="color:black;"> <input
														class="checkbox" type="checkbox" checked> Follow
														up of team zilla
													</label>
												</div> <i class="remove bi bi-x" style="font-size: 25px;"></i>
											</li>
											<li>
												<div class="form-check form-check-flat">
													<label class="form-check-label" style="color:black;"> <input
														class="checkbox" type="checkbox"> Level up for
														Antony
													</label>
												</div> <i class="remove bi bi-x" style="font-size: 25px;"></i>
											</li>
										</ul>
									</div>
									<div class="add-items d-flex mb-0 mt-2">
										<input type="text" class="todo-list-input" placeholder="입력하기">
										<i
											class="add btn btn-icon text-primary todo-list-add-btn bg-transparent bi bi-plus-circle"
											style="margin-top: 21px;"></i>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- <div style="margin-bottom: 500px;"></div> -->
			<!-- content-wrapper ends -->

		</div>
		<!-- main-panel ends -->
		
	</div>
	<!-- page-body-wrapper ends -->
	
	<!-- container-scroller -->


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
