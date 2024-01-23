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
	
	<!-- progressbar -->
	<link rel="stylesheet" href="${path}/resources/css/progress.css">
	

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
                                      
                                      	<form method="post">
                                      	    <input type="hidden" class="form-control" id="user_id" name ="user_id" value="${user_id}" readonly>
                                      	    <input type="hidden" class="form-control" id="class_idx" name ="classIdx" value="${classIdx}" readonly>
                                      	 
	                                      <div class="mb-3 row"  style="width: 900px;">
	                                          <label for="startDate" class="col-sm-2 col-form-label text-center" style="width: 11%;">시작일자</label>
	                                          <div class="col-sm-3 col-form-label text-center" style="width: 19%;">
	                                              <input type="date" class="form-control " id="startDate"  name="startDate">
	                                          </div>
	                                          <label for="endDate" class="col-sm-2 col-form-label text-center" style="width: 11%;">종료일자</label>
	                                          <div class="col-sm-3 col-form-label text-center" style="width: 19%;">
	                                              <input type="date" class="form-control" id="endDate" name="endDate">
	                                          </div> 
	                                          <div class="col-sm-3 col-form-label text-center">
	                                            <button id="getSummary" type="button" class="btn btn-warning mb-3">요약하기</button>
	                                          </div>
	                                      </div>
                                      	</form>
                                      	
                                    </div>
					                    
					                    <!-- loading bar -->
	                                      <div style="padding-left: 25%; padding-right: 19%; padding-top: 2%;">
						                      <div id="loading" style="padding-bottom: 17%"></div>
                                     	 </div>
					                    <!-- /loading show -->
                                      	<!-- result show -->
	                                      <div style="padding-left: 25%; padding-right: 19%; padding-top: 2%;">
											<div id="show_Result"></div>
                                     	 </div>
                                      	<!-- /result show -->
									                                      
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
    
		<script>
	    $(document).ready(function() {
	            $("#getSummary").on("click", function() {
	            	
	                var data = {
	                        user_id: $("#user_id").val(),
	                        class_idx: $("#class_idx").val(),
	                        startDate: $("#startDate").val(),
	                        endDate: $("#endDate").val()
	                    };

                    <!-- loading bar -->	                
	            	var load = "<div class='progress'>"
	                    load += "<span class='progress-bar' style='width: 100%'></span>"
	                    load += "</div>"
	                $("#loading").html(load);
	                $("#loading").css("display", "block")
                    <!-- /loading bar -->	                
	                
	                $.ajax({
	                    url: "http://127.0.0.1:8089/getRecord",
	                    type: "POST",
	                    data: JSON.stringify(data),
	                    contentType: "application/json;charset=utf-8",
	                    dataType: "json",
	                    success: function(result) {
	  		                 $("#loading").css("display", "none")
	  		                 
	                       <!--result Area-->
	  		               var data = result.data;
	  		               var sentences = data.split('.');
	  		               
	  		               var html = "";
	  		               for (var i = 1; i < sentences.length; i++) {
	  		               	html += "<p>" + sentences[i].trim() + ".</p>";
	  		           	   }
	  		               $("#show_Result").html(html);
                           <!--/result Area-->
	                    },
	                    error: function(error) {
	                        console.error("Error:", error);
	                    }
	                });
	            });
	    	});
	    </script>
	    
	<!-- Footer -->
	<jsp:include page="Footer.jsp"></jsp:include>

    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>

</body>

</html>