<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/modules/header.jsp" %>
<%@ include file="/WEB-INF/views/base.jsp" %>


<style>
    .image-button-img {
        max-width: 100px; 
        max-height: 150px; 
        display: block;
        margin: 0 auto; 
    }
</style>

<section class="content col-md-12">
		<div class="row">
			<div class="col-md-7">
			    <div class="card card-primary">
			        <div class="card-header">
			            <h3 class="card-title">Camera</h3>
			        </div>
			        <div class="card-body">
			            <video src="<%=request.getContextPath() %>${exp.expname }" style="width:100%; height:576px" controls id="myVideo" ></video>
			        </div>
			    </div>
			</div>


			<div class="col-md-5">
			<div class="card card-primary">
					<div class="card-header">
						<h3 class="card-title">LED</h3>
					</div>
					<div class="card-body">
						<div class="row justify-content-center">
							<button class="btn btn-primary col-md-2" style="background:orange;color:black" onclick="video_on('SOS');">SOS</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-primary col-md-2" style="background:orange;color:black" onclick="video_on('4WayFlasher');">비상등</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-primary col-md-2" style="background:orange;color:black" onclick="video_on('fade');">점등</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
					</div>
				</div>
				<div class="card card-primary">
					<div class="card-header">
						<h3 class="card-title">차량 조작</h3>
					</div>
					<div class="card-body">
						<div class="row justify-content-center">
							<button class="btn btn-primary col-md-2" onclick="video_on('goLeft');">좌전진</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-primary col-md-2" onclick="video_on('go');">전진</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-primary col-md-2" onclick="video_on('goRight');">우전진</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<br>
						<div class="row justify-content-center">
							<button class="btn btn-primary col-md-2" onclick="video_on('turnLeft');">좌회전</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-danger col-md-2" onclick="video_on('stop');">정지</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-primary col-md-2" onclick="video_on('turnRight');">우회전</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
						<br>
						<div class="row justify-content-center">
							<button class="btn btn-primary col-md-2" onclick="video_on('backLeft');">좌후진</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-primary col-md-2" onclick="video_on('back');">후진</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-primary col-md-2" onclick="video_on('backRight');">우후진</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
					</div>
				</div>

					<div class="card card-primary">
						<div class="card-header">
						<h3 class="card-title">신호 패널</h3>&nbsp;&nbsp;
					</div>
						<div class="card-body">
						    <div class="row justify-content-center">
						        <button class="image-button" onclick="move('backLeft');" style="margin-right: 100px;">
						            <img src="${pageContext.request.contextPath}/resources/images/go.png" class="image-button-img">
						        </button>&nbsp;&nbsp;
						        <button class="image-button" onclick="move('back');" style="margin-right: 10px;">
						            <img src="${pageContext.request.contextPath}/resources/images/stop.png" class="image-button-img">
						        </button>&nbsp;&nbsp;
						    </div>
						</div>
					</div>
				</div>
			</div>
			</div>
		</div>
</section>



			

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	function video_on(videoName) {
		$.ajax({
	        url: '/exp/getVideo',
	        type: 'GET',
	        data: { videoName: videoName },
	        success: function(response) {
	            // 서버로부터 받은 응답 데이터를 이용하여 동영상을 변경합니다.
	            var videoSrc = '<%=request.getContextPath() %>' + response;
	            var video = document.getElementById('myVideo');
	            video.src = videoSrc;
	            video.load();
	        },
	        error: function(xhr, status, error) {
	            console.error('Ajax 요청 중 에러가 발생했습니다:', error);
	        }
	    });
	}
	function led_start(num){
		let url = "built_in/" + num;
		
		$.ajax({
			"url": url,
			"method":"GET",
			"success" : function(result){
				alert(result);
			}
		});
	}
	
	function move(move_text){
		let url = "move/" + move_text;
		
		$.ajax({
			"url": url,
			"method":"GET",
			"success" : function(result){
				alert(result);
			}
		});
	}
	function ipInput(){
		
		var ip_form = $("#ip_form").serialize()
		console.log(ip_form);
		let url="ip_set";
		$.ajax({
			"url":url,
			"data":ip_form,
			"method":"POST",
			"success" : function(){}
		});
	}
</script>
<%@ include file="/WEB-INF/views/modules/footer.jsp" %>