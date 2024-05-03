<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/bootstrap/dist/css/adminlte.min.css">


<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>OneStep</title>
<style>

body {
	width:100%;
	height:100%;
}
.dt-pjc-main {
	width: 700px;
	margin-top: 45px;
}

.dt-pjc-main .card {
	box-shadow: 0 12px 18px 2px rgba(34, 0, 51, 0.04), 0 6px 22px 4px
		rgba(7, 48, 114, 0.12), 0 6px 10px -4px rgba(14, 13, 26, 0.12)
		!important;
	border-radius: 16px;
}

.dt-pjc-main .dt-pjc-create {
	height: 450px !important;
}

.dt-pjc-main header {
	text-align: center;
	margin: 30px 0 0 0;
	font-size: 24px;
	font-weight: bold;
}

.dt-pjc-main form {
	width: 500px;
	margin: 10px auto;
}


</style>
</head>
<body>
		<!-- 카드? -->
	<div class="card dt-pjc-main" style="margin-left:auto; margin-right:auto;">
		<div class="dt-pjc-create">
			<header> 파일 업로드</header>
			<hr style="box-shadow: 1px 1px 1px 1px rgba(32, 0, 31, 0.04)"/>
			<div class="container-fluid" style="margin-top:50px;">
				<form class="mb-3" name="pjFileform" id="pjFileform" action="/devnote/projectFileRegist" method="POST" enctype="multipart/form-data">								
				<div class="card">
						<div class="card-header">
							<input type="file" name="uploadFile" style="display:inline">
						</div>
				</div>									
				<br>
				<input type="button" class="btn btn-primary" value="등록" onclick="savePost()">&nbsp;&nbsp;&nbsp;
				<input type="button" class="btn btn-default" value="취소" onclick="window.close();">
				</form>
			</div>
		</div>
	</div>


</body>

<!-- jQuery -->
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>


<script>

function savePost() {
	
	var inputs = $('input[name="uploadFile"]');
	for(var input of inputs){
		//console.log(input.name+" : "+input.value);
		if(input.value==""){
			alert("파일을 선택하세요.");
			input.focus();
			input.click();
			return;
		}
	}
	$("form[name='pjFileform']").submit();
	
}

var dataNum=0;

function addFile_go(){
	
	var div=$('<div>').addClass("inputRow").attr("data-no",dataNum);	
	var input=$('<input>').attr({"type":"file","name":"uploadFile"}).css("display","inline");
	div.append(input).append("<button onclick='remove_go("+dataNum+");' style='border:0;outline:0;' class='badge bg-red' type='button'>X</button>");	
	$('.fileInput').append(div); 
	
	dataNum++;	
	
}

function regist_go(){
	
	
	var form = $("form[role='form']");
	form.submit();

}

</script>
</html>