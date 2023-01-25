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




      </div>

    </section><!-- End Blog Section -->

  </main><!-- End #main -->
    <div id='calendar'></div>
  </body>
</html>
