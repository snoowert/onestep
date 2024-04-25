<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/module/header.jsp" %>
<script>
 var qnaid="<%= request.getAttribute("qnaid") %>";
	alert("답변이 등록 되었습니다.");
	window.opener.location.href ='main?qnaid='+qnaid;
	window.opener.location.reload();
</script>