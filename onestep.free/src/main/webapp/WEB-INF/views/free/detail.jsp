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
                    <h4>댓글</h4>
                    <div class="col-md-12">
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
                        <!--<c:if test="${sessionScope eq freecomment.memberid}">-->
                        	<a href="updateform?num=${freecomment.commentid }">수정</a>
                        	<a href="javascript:" onclick="deletecomment()">삭제</a>
                        <!--</c:if>-->
                       
                                 
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

<script>
var formObj = document.querySelector("form[role='form']");

function submit_go(url){
    if(url=="remove.do" && !confirm("정말로 삭제하시겠습니까?")){
        return;
    }
    formObj.action=url;
    formObj.submit();
}

function deletecomment(){
	const isDelete=confirm("댓글을 삭제 하겠습니까?");
	if(isDelete){
		location.href="delete?num=${freecomment.commentid}";
	}
}
</script>

<%@ include file="/WEB-INF/views/module/footer.jsp" %>
