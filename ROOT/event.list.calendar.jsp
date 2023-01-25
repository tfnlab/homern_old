<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tfnlab.mysql.User"%>
<%@ page import="com.tfnlab.mysql.UserDao" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.tfnlab.mysql.Order" %>
<%@ page import="com.tfnlab.mysql.OrderDao" %>
<%@ page import="com.tfnlab.mysql.Product" %>
<%@ page import="com.tfnlab.mysql.ProductDao" %>
<%@ page import="com.tfnlab.mysql.Event" %>
<%@ page import="com.tfnlab.mysql.EventDao" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="com.tfnlab.mysql.Technician" %>
<%@ page import="com.tfnlab.mysql.TechnicianDao" %>
<%@ page import="com.tfnlab.mysql.OrderTechnicians" %>
<%@ page import="com.tfnlab.mysql.OrderTechniciansDAO" %>
<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"></script>
    <script>
      $(document).ready(function() {
        $('#calendar').fullCalendar({
          events: [
            {
              title: 'Event 1',
              start: '2022-01-01'
            },
            {
              title: 'Event 2',
              start: '2022-01-05',
              end: '2022-01-07'
            }
          ]
        });
      });
    </script>
  </head>
  <body>
    <!-- ======= Blog Section ======= -->
    <section id="blog" class="blog">
      <div class="container px-4 px-lg-5">
        <h2>Events</h2>
        <HR>
        <%@ include file="user.menu.nav.jsp" %>
        <HR>
          <a href="event.new.jsp"><i class="fas fa-plus"></i> Event</a>
        <HR>
        <a href="event.list.jsp?sortBy=eventDate">Latest</a> |
        <a href="event.list.jsp?sortBy=eventDateDESC">Oldest</a>
        <HR>

        <%
                EventDao eDao = new EventDao();
                String username = (String) session.getAttribute("username");
                String remove = request.getParameter("remove");

                TechnicianDao technicianDao = new TechnicianDao();
                List<Technician> technicians = technicianDao.getTechniciansByUsernameActive(username);
                int eId = 0;
                if (request.getParameter("eventid") != null && !request.getParameter("eventid").isEmpty()) {
                  eId = Integer.parseInt(request.getParameter("eventid"));
                }
                if (remove != null && remove.trim().length() > 0) {
                    OrderTechniciansDAO otDao = new OrderTechniciansDAO();
                    otDao.deleteOrderTechniciansByEventId(eId, username);
                    eDao.deleteEventById(eId, username);
                }

                List<Event> events = null;

                String startTime = request.getParameter("start_time");
                String endTime = request.getParameter("end_time");
                String tIdstr = request.getParameter("technicianId");
                if (startTime != null && startTime.trim().length() > 0) {
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
                    Date startTimeDate = null;
                    Date endTimeDate = null;
                      try{
                         startTimeDate = dateFormat.parse(startTime);
                         endTimeDate = dateFormat.parse(endTime);
                         events = eDao.searchEventsByDateRange(startTimeDate , endTimeDate);
                      } catch (Exception e) {
              		      %><%="Error parsing date and time string: " + e.getMessage()%><%
              		    }
                }else{
                  if(request.getParameter("sortBy")!=null){
                    if(request.getParameter("sortBy").equals("eventDate")){
                      events = eDao.getEventsByUsername(username, 1);
                    }
                    if(request.getParameter("sortBy").equals("eventDateDESC")){
                      events = eDao.getEventsByUsername(username, 2);
                    }
                  }else{
                    events = eDao.getEventsByUsername(username, 0);
                  }
                }
                %>
                <%
                  if (startTime == null) {
                    startTime = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").format(new Date());
                  }
                  if (endTime == null) {
                    Calendar calendar = Calendar.getInstance();
                    calendar.setTime(new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").parse(startTime));
                    calendar.add(Calendar.DATE, 1);
                    calendar.set(Calendar.HOUR_OF_DAY, 19);
                    calendar.set(Calendar.MINUTE, 0);
                    calendar.set(Calendar.SECOND, 0);
                    calendar.set(Calendar.MILLISECOND, 0);
                    endTime = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").format(calendar.getTime());
                  }
                %>

                <%
                  // Get the value of the "technicianId" parameter
                  String technicianId = request.getParameter("technicianId");

                  // Set the value to "all" if it is null or empty
                  if (technicianId == null || technicianId.trim().length() == 0) {
                    technicianId = "all";
                  }
                %>


                <form method="post" action="event.list.jsp">
                  <div class="form-group">
                   <label for="technicianId">Technician:</label>
                   <select class="form-group" id="technicianId" name="technicianId" >
                         <option value="all" <%if(technicianId.equals("all")){%>selected<%}%> >All Technicians</option>
                       <% for (Technician technician : technicians) { %>
                         <option value="<%= technician.getTechnicianId() %>" <%if(technicianId.equals(String.valueOf(technician.getTechnicianId()))){%>selected<%}%>  ><%= technician.getTechnicianName() %></option>
                       <% } %>
                   </select>
                 </div>
                 <HR>
                  <div class="form-group">
                      <label for="start_time">Start Time</label>
                      <input type="datetime-local" class="form-control" id="start_time" name="start_time" required datepicker value="<%= startTime %>">
                  </div>
                  <BR>
                  <div class="form-group">
                    <label for="end_time">End Time</label>
                    <input type="datetime-local" class="form-control" id="end_time" name="end_time" required datepicker value="<%= endTime %>">
                  </div>
                  <HR>
                  <button type="submit" class="btn btn-primary">Filter</button>
                </form>


              <hr>
              <% if(events !=null) {%>
              <% for (Event event : events) { %>
                  <%
                    boolean showItem = true;
                    if (request.getParameter("technicianId") != null && !request.getParameter("technicianId").isEmpty()) {
                      if (!request.getParameter("technicianId").equals("all")) {
                        int tId = 0;
                        tId = Integer.parseInt(request.getParameter("technicianId"));
                        if(event.getTechnician().getTechnicianId() != tId){
                          showItem = false;
                        }
                      }
                    }
                  %>
                  <%if(showItem){%>
                Event Name: <%= event.getTitle() %><br>
                Event ID: <a href="event.edit.jsp?eventid=<%= event.getId() %>" ><%= event.getId() %></a><br>
                Event Description: <%= event.getDescription() %><br>
                Event Date: <%= event.getStartTime() %> - <%= event.getEndTime() %> <BR>
                <a href="event.list.jsp?eventid=<%= event.getId() %>&remove=yes" >REMOVE</a><br>
                <hr>
                  <%}%>
              <% } %>
              <% }%>


      </div>

    </section><!-- End Blog Section -->

  </main><!-- End #main -->
    <div id='calendar'></div>
  </body>
</html>
