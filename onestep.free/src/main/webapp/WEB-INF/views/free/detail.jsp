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
            <div class="row justify-content-end" style="margin-right: 10px;"> <!-- 수정 및 삭제 버튼을 오른쪽으로 정렬 -->
			    <button type="button" id="modify" style="width:80px; height:40px; margin-right: 10px;background-color: transparent;text-decoration: none;border-color: transparent;" onclick="submit_go('modifyForm.do');">수정</button> <!-- 버튼 텍스트 및 스타일 수정 -->
			    <button type="button" id="remove" style="width:80px; height:40px; margin-right: 10px;background-color: transparent;text-decoration: none;border-color: transparent;" onclick="submit_go('remove.do');">삭제</button> <!-- 버튼 텍스트 및 스타일 수정 -->
			</div>

                <div class="row" style="padding: 1px; background-color: aliceblue;">
                    <div class="col-sm-12" style="border-top: 1px solid;border-bottom: 1px solid;border-color: var(--color-bd-outer);padding: .5rem .75rem;font-size: 1.2rem;">
                        <span class="font-weight-bold" id="freetitle" style="border: none;font-size: 2rem;">${free.freetitle }</span> <!-- 제목을 진하게 표시 -->
                    </div>
                </div>
                <div class="row col-sm-12" style="border-bottom: 1px solid;border-color: var(--color-bd-outer);padding: .5rem .75rem;font-size: 1.2rem;" >
                    <div class="col-sm-9">
                        <span id="memberid" style="border: none;font-size: 25px;text-align:center">${free.memberid }</span> <!-- 작성자를 진하게 표시 -->
                    </div>
                    <div class="right col-sm-2">
                        <span class="form-control" id="freeregdate" style="border: none;text-align:center">
                            <fmt:formatDate value="${free.freeregdate }" pattern="yyyy-MM-dd"/>  
                        </span>
                    </div>
                    <div class="col-sm-1">
                        <span class="form-control" id="freeviewpoint" style="border: none; text-align:center">${free.freeviewpoint }</span>
                    </div>
                </div>
                <br>
                <div class="row" style="border-bottom: 1px solid;border-color: var(--color-bd-outer);padding: .5rem .75rem;font-size: 1.2rem;">     
                    <div class="col-sm-12">
                        <div id="freecontent" style="border: none; min-height: 800px; max-width: 100%;">${free.freecontent }</div>
                    </div>
                </div>
				 <div class="row title font-weight-bold" style="border-bottom: 1px solid;border-color: var(--color-bd-outer);padding: .5rem .75rem;font-size: 1.2rem;">
				    댓글
				 </div>
				 <br>
				 <br>
				 <c:forEach var="comment" items="${free.commentlist}">
				    <div class="row" style="border:1px solid #dee2e6; background-color: aliceblue;">
				        <span class="font-weight-bold" style="font-size: 1.3rem; padding-left: 10px;padding-top: 5px;">${comment.memberid}&nbsp;</span>
				        <div class="right" style="font-size: .85rem; margin-left: auto;">
				            <fmt:formatDate value="${comment.commentregdate}" pattern="yyyy-MM-dd"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				            <span class="sep"></span>
				            <button type="button" style="width:80px; height:40px; margin-right: 10px; background-color: transparent; text-decoration: none; border-color: transparent;" onclick="window.open('modifycommentForm?commentid=${comment.commentid}', '_blank', 'width=600,height=400')"><span class="icon ion-compose"></span>수정</button>
				            
				            <span class="sep"></span>&nbsp;&nbsp;
				            <button type="button" style="width:80px; height:40px; margin-right: 10px; background-color: transparent; text-decoration: none; border-color: transparent;" onclick="deleteComment(${comment.commentid})"><span class="icon ion-trash-b"></span>삭제</button>
				            
				            <span class="sep"></span>
				        </div>
				    </div>
				    <div class="row" style="border:1px solid #dee2e6;">
				        <div class="text"><pre class="">${comment.commentcontent}</pre></div>
				    </div>
				    <br>
				</c:forEach>


                        <!-- 댓글 입력 폼 -->
                        <form class="comment-form insert-form" action="commentregist" method="post" style="width: 100%;">
						    <div class="row" style="border: 1px solid #dee2e6;">
						        <input type="hidden" name="freeid" value="${free.freeid}" />
						        <input class="font-weight-bold" name="memberid" style="border: none; padding-left: 10px;font-size: 1.2rem;margin-top: auto;" value="${free.memberid}" />
						    </div>                  
						
						    <div class="row" style="margin-bottom: 10px;"> <!-- 댓글 텍스트 입력 영역 -->
						        <textarea class="reply-form-textarea" name="commentcontent" required="required" style="width: 100%; min-height: 80px; border: 1px solid #dee2e6;">내용을 입력</textarea>
						    </div>
							<div class="float-left">
								<button type="button" style="width: 80px; height: 40px; background-color: transparent; text-decoration: none; border-color: black; margin-top: auto;" onclick="goToMainPage()">메인으로</button>
						    </div>
						    <div class="row" style="display: flex; justify-content: flex-end;"> <!-- 등록 버튼 영역 -->
						   		<button style="width: 80px; height: 40px; background-color: transparent; text-decoration: none; border-color: black; margin-top: auto;">등록</button>
						    </div>
						</form>

                    </div>
                </div>                                                  
            </div><!-- end card -->              

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

        var freeid = document.createElement("input");
        freeid.setAttribute("type", "hidden");
        freeid.setAttribute("name", "freeid");
        freeid.setAttribute("value", "${free.freeid}");
        form.appendChild(freeid);
        // 폼을 body에 추가합니다.
        document.body.appendChild(form);

        // 폼을 서버로 전송합니다.
        form.submit();

    }
}

function goToMainPage() {
    window.location.href = "/free/main"; // 메인 페이지로 이동하는 URL로 대체해야 함
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
