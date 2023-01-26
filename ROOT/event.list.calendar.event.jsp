<%@page import="java.util.List, java.util.ArrayList, com.tfnlab.mysql.Event, com.tfnlab.mysql.EventDao, java.sql.SQLException, java.text.SimpleDateFormat"%><%
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
[
<%
for (int i = 0; i < events.size(); i++) {
    Event event = events.get(i);
%>
    {    "title": "<%=event.getTitle()%>",    "start": "<%=formatter.format(event.getStartTime())%>"    <%if (event.getEndTime() != null) {%>    ,    "end": "<%=formatter.format(event.getEndTime())%>"    <%}%>, className: "orange" }
    <% if(i < events.size()-1){ %>,<% } %>
<% } %>
]
