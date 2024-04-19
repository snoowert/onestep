<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/module/header.jsp" %>

<script>
	alert("수정 되었습니다.");
	location.href="detail?qnaid=${param.qnaid}";
</script>