<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	alert("피드 작성에 성공했습니다.");
    window.location.href = 'feed?projectId=${projectId }' + projectId;
	window.opener.location.reload();
</script>