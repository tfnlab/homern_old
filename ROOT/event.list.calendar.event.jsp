<%@page import="java.util.List"%>
<%@page import="com.tfnlab.mysql.Event"%>
<%@page import="com.tfnlab.mysql.EventDao"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="application/json"%>
<%
List<Event> events = new ArrayList<Event>();
EventDao dao = new EventDao();
String username = (String) session.getAttribute("username");
try {
    events = dao.getEventsByUsername(username, 0);
} catch (SQLException e) {
    e.printStackTrace();
}
SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
%>
[<%for (Event event : events) {%>{    "title": "<%=event.getTitle()%>",    "start": "<%=formatter.format(event.getStartTime())%>"    <%if (event.getEndTime() != null) {%>    ,    "end": "<%=formatter.format(event.getEndTime())%>"    <%}%>},<%}%>]
