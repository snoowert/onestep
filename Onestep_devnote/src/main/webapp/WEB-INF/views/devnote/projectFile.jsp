<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/module/base.jsp" %>
<%@ include file="/WEB-INF/views/module/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ include file="/WEB-INF/views/module/subbar.jsp" %>

<style>
	.btn-sm {
		width:25px;
		height:30px;
	}
	/*input.img-button {
       background: url("/images/delete.png") no-repeat;
        border: none;
        width: 32px;
        height: 32px;
        cursor: pointer;
      */
      }
</style>

<section class="content w-75 p-3 mx-auto">
    <div class="card">
        <div class="card-header with-border">
            <div id="keyword" class="card-tools" style="width:450px;">
                <div class="input-group row">
                    <select class="form-control col-md-3" name="searchType" id="searchType">
                        <option value="t" ${pageMaker.searchType eq 't' ? 'selected':'' }>제 목</option>
                    </select>
                    <input class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." value="${pageMaker.keyword }"/>
                    <span class="input-group-append">
                        <button class="btn btn-primary" type="button" id="searchBtn" data-card-widget="search" onclick="search_list(1);">
                            <i class="fa fa-fw fa-search"></i>
                        </button>
                    </span>
                </div>
            </div>
        </div>
        <div class="card-body">
            <table class="table table-bordered text-center">
                <thead>
                    <tr>
                        <th style="width:10%;">번 호</th>
                        <th style="width:40%;">파일명</th>
                        <th style="width:15%;">등록자</th>
                        <th style="width:10%;">다운수</th>
                        <th style="width:7%">  </th>
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${empty projectFileList}">
                        <tr>
                            <td colspan="5">해당 내용이 없습니다.</td>
                        </tr>
                    </c:if>
                    <c:forEach items="${projectFileList}" var="projectFile">
                        <tr>
                            <td>${projectFile.fileId }</td>
                            <td id="boardTitle" style="text-align:left;max-width: 100px; overflow: hidden;
                            white-space: nowrap; text-overflow: ellipsis;">
                            <span class="col-sm-12 ">${projectFile.fileName }</span>
                            </td>
                            <td>${projectFile.memberId }</td>
                            <td><span class="badge bg-red">${projectFile.fileDownCnt }</span></td>
                        	<td><input type="button" class="img-button" alt="삭제"></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="card-footer">
            <%@ include file="/WEB-INF/views/module/pagination.jsp" %>
        </div>
    </div>
    <button type="button" class="btn btn-primary btn float-right" id="registBtn" 
    	    onclick="OpenWindow('projectFile_upload?projectId=${project.projectId}', '자료등록', 800, 600);">파일 업로드</button>

</section>

<%@ include file="/WEB-INF/views/module/footer.jsp" %>


<script>
function OpenWindow(UrlStr, WinTitle, WinWidth, WinHeight) {
	winleft = (screen.width - WinWidth) / 2;
	wintop = (screen.height - WinHeight) / 2;
	var win = window.open(UrlStr , WinTitle , "scrollbars=yes,width="+ WinWidth
							+",height="+ WinHeight +", top="+ wintop +", left=" 
							+ winleft +", resizable=yes, status=yes"  );
	win.focus() ; 
}


</script>