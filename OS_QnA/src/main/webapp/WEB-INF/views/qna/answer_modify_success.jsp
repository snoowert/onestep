<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
var qnaid="<%= request.getAttribute("qnaid") %>";
alert("답변이 수정 되었습니다.");
location.href ='detail?qnaid='+qnaid;
</script>