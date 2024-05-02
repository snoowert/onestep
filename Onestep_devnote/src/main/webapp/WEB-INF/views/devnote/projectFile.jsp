<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/module/base.jsp" %>
<%@ include file="/WEB-INF/views/module/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ include file="/WEB-INF/views/module/subbar.jsp" %>

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
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${empty projectFileList}">
                        <tr>
                            <td colspan="4">해당 내용이 없습니다.</td>
                        </tr>
                    </c:if>
                    <c:forEach items="${projectFileList}" var="projectFile">
                        <tr>
                            <td>${projectFile.fileid }</td>
                            <td id="boardTitle" style="text-align:left;max-width: 100px; overflow: hidden;
                            white-space: nowrap; text-overflow: ellipsis;">
                                <a href="detail.do?pdsid=${projectFile.fileId }&from=list">
                                    <span class="col-sm-12 ">${projectFile.fileTitle }</span>
                                </a>
                            </td>
                            <td>${projectFile.memberId }</td>
                            <td><span class="badge bg-red">${projectFile.fileDownCnt }</span></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="card-footer">
            <%@ include file="/WEB-INF/views/module/pagination.jsp" %>
        </div>
    </div>
    <button type="button" class="btn btn-primary btn float-right" id="registBtn" onclick="location='registForm'">자료 등록</button>

</section>

<%@ include file="/WEB-INF/views/module/footer.jsp" %>