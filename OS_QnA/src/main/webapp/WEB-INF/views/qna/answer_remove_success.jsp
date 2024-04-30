<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/module/header.jsp" %>
<script>
qnaid="<%= request.getAttribute("qnaid") %>";
alert("삭제 되었습니다.");
location.href ='detail?qnaid='+qnaid;
</script>