<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/module/header.jsp" %>
<%@ include file="/WEB-INF/base.jsp" %>

<!-- Main content -->
<section class="content container-fluid">
    <div class="row justify-content-center">
        <div class="col-md-9">
            <div class="card card-outline card-info"></div>
            <div class="card-body">
                <div class="row" style="border: 1px solid #ccc; padding: 1px; ">
                    <div class="col-sm-10">
                        <span class="form-control" id="freetitle" style="border: none;">${free.freetitle }</span>                            
                    </div>&nbsp;&nbsp;&nbsp;
                    <div class="row card-tools col-sm-1 justify-content-center">
                        <button type="button" id="modify" class="btn btn-warning" style="width:100px; height:40px;" onclick="submit_go('modifyForm.do');">수정</button>                       
                    </div>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                    <div class="row card-tools col-sm-1 justify-content-center">
                        <button type="button" id="remove" class="btn btn-danger" style="width:100px; height:40px" onclick="submit_go('remove.do');">삭제</button>
                    </div>
                </div>
                <div class="row" style="border: 1px solid #ccc; padding: 1px;">    
                    <div class="col-sm-10" >
                        <span class="form-control" id="memberid" style="border: none;">${free.memberid }</span>
                    </div>        
                    
                    <div class="form-group col-sm-1" >
                        <span class="form-control" id="freeregdate" style="border: none;">
                            <fmt:formatDate value="${free.freeregdate }" pattern="yyyy-MM-dd"/>  
                        </span>
                    </div>
                    <div class="col-sm-1" >
                        <span class="form-control" id="freeviewpoint" style="border: none; text-align:center">${free.freeviewpoint }</span>
                    </div>
                </div> 
                	<div class="row" style="border:1px solid #ccc;">     
	                    <div class="col-sm-12">
	                        <div id="freecontent" style="border: none; min-height: 800px; max-width: 923px;">${free.freecontent }</div>    
	                    </div>
	            </div>
                <div class="row"style="border: 1px solid #ccc;">
                    <label for="comment">댓글</label>
                    <div class="col-md-12">
                    	
						<table class="table table-bordered">
							<c:forEach var="comment" items="${free.commentlist }">
								<tr>
									<td class="col-sm-6">${comment.commentcontent }</td>
									<td class="col-sm-1">${comment.memberid }</td>
									<td class="col-sm-1"><fmt:formatDate value="${comment.commentregdate }"
											pattern="yyyy-MM-dd" /></td>
							<td class="col-sm-1">
								<button onclick="updateform?commentid=${comment.commentid }">수정</button>
		                    </td>
		                    <td class="col-sm-1">
		                   	 	<button type="button" onclick="deleteComment(${comment.commentid})">삭제</button>					
							</td>	
								</tr>
							</c:forEach>
						</table>

                       <!-- 원글에 댓글을 작성할 폼 -->
                        <form class="comment-form insert-form" action="commentregist" method="post" style="width: 100%;">
                            <input type="hidden" name="freeid" value="${free.freeid }"/>
                            <input type="hidden" name="memberid" value="${free.memberid }"/>
                            <!-- 댓글 폼의 텍스트 영역 -->
                            <textarea name="commentcontent" style="width:100%; min-height: 50px;">${empty memberid ? '댓글 작성을 위해 로그인이 필요 합니다.' : '' }</textarea>
                            <!-- 댓글 작성 버튼 -->
                            <div style="text-align: right;">
                                <button type="submit" class="btn btn-primary" style="width:100px; height:40px;">등록</button>
                            </div>
                        </form>
                        <br>
                        <br>

                       
                                 
                     </div>
                </div>                                                  
            </div><!-- end card -->              
        </div><!-- end col-md-12 -->
    </div><!-- end row  -->
</section>
<!-- /.content -->
<!-- REQUIRED SCRIPTS -->
<form role="form">
    <input type="hidden" name="freeid" value="${free.freeid }" />
</form>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
var formObj = document.querySelector("form[role='form']");

function submit_go(url){
    if(url=="remove.do" && !confirm("정말로 삭제하시겠습니까?")){
        return;
    }
    formObj.action=url;
    formObj.submit();
}

function deleteComment(commentid) {
    if (confirm("정말로 삭제하시겠습니까?")) {
        // 폼을 동적으로 생성합니다.
        var form = document.createElement("form");
        form.setAttribute("method", "post");
        form.setAttribute("action", "/free/commentremove");
        form.setAttribute("style", "display: none;"); // 폼을 보이지 않도록 설정합니다.

        // 폼에 댓글 ID를 전송할 hidden input을 추가합니다.
        var commentIdInput = document.createElement("input");
        commentIdInput.setAttribute("type", "hidden");
        commentIdInput.setAttribute("name", "commentid");
        commentIdInput.setAttribute("value", commentid);
        form.appendChild(commentIdInput);

        // 폼을 body에 추가합니다.
        document.body.appendChild(form);

        // 폼을 서버로 전송합니다.
        form.submit();

        // 댓글이 삭제된 후 이전 페이지로 돌아가도록 설정합니다.
        window.history.back();
    }
}

function registerComment() {
    var formData = {
        freeid: "${free.freeid}",
        memberid: "${free.memberid}",
        commentcontent: $("textarea[name='commentcontent']").val()
    }
}
</script>

<%@ include file="/WEB-INF/views/module/footer.jsp" %>
