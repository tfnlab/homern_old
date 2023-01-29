<%@page import="java.util.List, java.util.ArrayList, com.tfnlab.mysql.Event, com.tfnlab.mysql.EventDao, java.sql.SQLException, java.text.SimpleDateFormat"%><%
List<Event> events = new ArrayList<Event>();
EventDao dao = new EventDao();
String username = (String) session.getAttribute("username");
try {

    if(request.getParameter("technicianId").equals("all")){
        events = dao.getEventsByUsername(username, 0);
    }else{
        int tId = 0;
        tId = Integer.parseInt(request.getParameter("technicianId"));
        events = dao.getEventsByUsername(username, 0, tId);
    }
} catch (SQLException e) {
    e.printStackTrace();
}
SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
%>
[
<%
for (int i = 0; i < events.size(); i++) {

    Event event = events.get(i);
    String color = "orange";
    String[] orderStates = {"Open", "Closed", "Cancelled", "On Hold", "Pending", "Shipped", "Delivered", "Refunded", "Returned", "Need Attention", "In Progress"};
    String[] orderColors = {"green", "red", "orange", "blue", "purple", "pink", "yellow", "brown", "gray", "black", "teal"};
    if(event.getEvent_status() !=null && event.getEvent_status().equals("closed")){
            color = "red";
    }
   for (int k = 0; k < orderStates.length; k++) {
     if(orderStates[k].toLowerCase().equals(event.getEvent_status())){
        color = orderColors[k];
     }
   }
    // https://homerenovationnation.com/event.edit.jsp?eventid=1 getId
%>
    {    "title": "<%=event.getTitle()%>",    "start": "<%=formatter.format(event.getStartTime())%>"    <%if (event.getEndTime() != null) {%>    ,    "end": "<%=formatter.format(event.getEndTime())%>"    <%}%>, "color": "<%=color%>", "url": "https://homerenovationnation.com/event.edit.jsp?eventid=<%=event.getId()%>", "description": "<%=event.getDescription()%>"  }
    <% if(i < events.size()-1){ %>,<% } %>
<% } %>
]
