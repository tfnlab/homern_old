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
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Home Renovation Nation - Order List</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">



  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" crossorigin="anonymous" />
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"></script>

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Presento - v3.9.1
  * Template URL: https://bootstrapmade.com/presento-bootstrap-corporate-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>
    function callTFNLab() {
      var xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
          document.getElementById("status").innerHTML = this.responseText;
          const el = document.createElement('textarea');
          el.value =  this.responseText;
          el.setAttribute('readonly', '');
          el.style.position = 'absolute';
          el.style.left = '-9999px';
          document.body.appendChild(el);
          el.select();
          document.execCommand('copy');
          document.body.removeChild(el);

        }
      };
      var urlString = "gennft.jsp?walletid=" + document.getElementById("walletid").value
      document.getElementById("start").style.display="none";
      document.getElementById("status").innerHTML = "Started Avatar Generation, give it a minute. <img src=\"assets/img/wait.gif\" />";
      xhttp.open("GET", urlString, true);
      xhttp.send();
    }

    function callCopy() {
      const el = document.createElement('textarea');
      el.value =  document.getElementById("status").innerHTML;
      el.setAttribute('readonly', '');
      el.style.position = 'absolute';
      el.style.left = '-9999px';
      document.body.appendChild(el);
      el.select();
      document.execCommand('copy');
      document.body.removeChild(el);
    }
  </script>
</head>

<body>
  <%@ include file="include.header.jsp" %>

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="index.html">Home</a></li>
          <li>Events</li>
        </ol>
        <h2>Events</h2>
      </div>
    </section><!-- End Breadcrumbs -->

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

                <HR>
                <div id="calendar"></div>

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

  <%@ include file="include.footer.jsp" %>

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
  
  <script>
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
  </script>
</body>

</html>
