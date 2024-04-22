<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실</title>
<%@ include file="/WEB-INF/views/base.jsp" %>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
</head>
<body>
<section class="container">
	<dev class="container-fluid col-sm-10">
		<div class="mb-3">
			<h3>${pds.pdstitle }</h3>
			<hr>
			<div class="row">
				<p class="col-sm-5">${pds.writer}</p>
				<p class="col-sm-3">조회수  ${pds.pdsviewpoint }</p>
				<p class="col-sm-2">작성일자  <fmt:formatDate pattern="yyyy.MM.dd" value="${pds.pdsregdate}"/></p>
			</div>
			<hr>
			<div class="row">
			&nbsp;&nbsp;<label class="form-label">파일</label>
			</div>		
			<c:forEach items="${pds.pdsfilelist }" var="pdsfile">
			<div class="col-md-4 col-sm-2 col-xs-12"  style="cursor:pointer;"
					 onclick="location.href='<%=request.getContextPath()%>/pds/getFile.do?pdsfileid=${pdsfile.pdsfileid }';">
					<div class="info-box">	
					 	<span class="info-box-icon bg-yellow"><i class="fa fa-copy"></i></span>
						<div class="info-box-content">
							<span class ="info-box-number">${pdsfile.pdsfilename.split('\\$\\$')[1] }</span>
						</div>
					</div>
				 </div>				
			</c:forEach>
			<br>
			<div id="viewer" class="">
				${pds.pdscontent }
			</div>
			<br>
			<c:if test="${loginUser.memberid == pds.memberid }">
			<input type="submit" class="btn btn-primary mx-auto" value="수정" onclick="modify_go();">
			<input type="button" class="btn btn-default mx-auto" value="삭제" onclick="delete_do();">
			</c:if>
		</div>
	</dev>
</section>
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<script>

function delete_do(){
	if(confirm("삭제하시겠습니까? ")){
		location.href ="/pds/delete?pdsid=${pds.pdsid}";
	}else{
		return;
	}	
}

function modify_go(){
	location.href = "/pds/modifyForm?pdsid=${pds.pdsid}";
}
</script>
</body>
</html>