<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.spring.dto.CalendarVO" %>
<%@ include file="/WEB-INF/views/module/base.jsp" %>
<%@ include file="/WEB-INF/views/module/header.jsp" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">
<style>
    /* 추가적인 스타일링이 필요한 경우 여기에 추가 */
</style>
<%@ include file="/WEB-INF/views/module/subbar.jsp" %>
<div class="container-fluid">
    <div id="calendar" style="width:60%; float:left;"></div>
</div>
<%@ include file="/WEB-INF/views/module/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<script src="<%=request.getContextPath() %>/resources/bootstrap/plugins/jquery/jquery.min.js"></script>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            initialView : 'dayGridMonth',
            headerToolbar : {
                start : 'prev next today',
                center : 'title',
                end : 'dayGridMonth,dayGridWeek,dayGridDay'
            },
            titleFormat : function(date) {
                return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
            },
            selectable : true,
            droppable : true,
            editable : true,
            nowIndicator: true,
            events : [
                <c:forEach var="event" items="${calendar}">
                    {
                    	title: '${event.content}',
                        start: convertToISODate('${event.startd}'),
                        end: convertToISODate('${event.endd}'),
                    },
                </c:forEach>
            ]
        });
        calendar.render();
    });

    function convertToISODate(dateString) {
        var parts = dateString.split(' ');
        var datePart = parts[0];
        var timePart = parts[1];
        var dateParts = datePart.split('-');
        var timeParts = timePart.split(':');
        var year = parseInt(dateParts[0], 10);
        var month = parseInt(dateParts[1], 10) - 1;
        var day = parseInt(dateParts[2], 10);
        var hour = parseInt(timeParts[0], 10);
        var minute = parseInt(timeParts[1], 10);
        var second = parseInt(timeParts[2], 10);
        // UTC로 설정하여 올바른 ISO 날짜 형식으로 변환합니다.
        return new Date(Date.UTC(year, month, day, hour, minute, second)).toISOString();
    }

</script>
