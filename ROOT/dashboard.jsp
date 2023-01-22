<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tfnlab.mysql.User"%>
<%@ page import="com.tfnlab.mysql.UserDao" %>
<%@ page import="com.tfnlab.mysql.OrderDao" %>
<%@ page import="com.tfnlab.mysql.EntityDao" %>
<%@ page import="com.tfnlab.mysql.EventDao" %>
<%@ page import="com.tfnlab.mysql.TechnicianDao" %>
<%@ page import="com.tfnlab.mysql.ProductDao" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.math.BigDecimal" %>
<%
String usernameCheck = (String) session.getAttribute("username");
if (usernameCheck == null || usernameCheck.isEmpty() || usernameCheck.length() < 2 ) {
     response.sendRedirect("index.html");
}
          User user = (User)session.getAttribute("usernameOBJ");
          if(user == null){
                response.sendRedirect("index.html");
          }
          String username = (String) session.getAttribute("username");
          OrderDao oDao = new OrderDao();
          EntityDao eDao = new EntityDao();
          EventDao eventDao = new EventDao();
          TechnicianDao tDao = new TechnicianDao();
          ProductDao pDao = new ProductDao();

%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Home Renovation Nation - Sign-up</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" crossorigin="anonymous" />
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

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
          <li><a href="user.menu.jsp">Home</a></li>
          <li>Service Operations Center</li>
        </ol>
      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Blog Section ======= -->
    <section id="blog" class="blog">
      <div class="container px-4 px-lg-5">
        <h2>Dashboard</h2>
        <HR>
        <%@ include file="user.menu.nav.jsp" %>

          <div class="container mt-5">
            <h4><%=user.getBusiness_name()%> Dashboard</h4>
            <HR>
              <%=user.getTs()%>
              <%
              Calendar today = Calendar.getInstance();

              // Get the calendar object for the given java.sql.Timestamp object
              Calendar inputTimestamp = Calendar.getInstance();
              inputTimestamp.setTimeInMillis(user.getTs().getTime());

              // Subtract the input timestamp from the current date
              long diff = today.getTimeInMillis() - inputTimestamp.getTimeInMillis();

              // Divide the difference by the number of milliseconds in a day to get the number of days
              long diffDays = diff / (24 * 60 * 60 * 1000);

              %> Member for <a href="user.edit.pay.jsp" ><%=diffDays%></a> Days
            <HR>
            Orders: <%=oDao.getCustomerOrderCount(username)%>
            <HR>
            <table class="table">
              <thead>
                <tr>
                  <th scope="col">Status</th>
                  <th scope="col">Count</th>
                  <th scope="col">Total</th>
                </tr>
              </thead>
              <tbody>
                <%
//                  String[] statuses = {};
                  String[] statuses = {"Proposal", "Estimate", "Order Placement", "Invoicing", "Payment", "Delivery", "Fulfillment"};
                  for (String sstatus : statuses) {
                %>
                <tr>
                  <td><a href="order.list.jsp?searchKey=<%= sstatus %>" ><%= sstatus %></a></td>
                  <td>
                      <% int count = oDao.getCustomerOrderCount(username, sstatus);%>
                      <%= count %>
                  </td>
                  <td>
                      <%if(count>0){%>
                          <% try{
                              %><%=oDao.getCustomerOrderTotal(username, sstatus)%><%
                            }catch(Exception ex){
                              %><%=ex.getMessage()%><%
                            }
                          %>
                      <%}else{%>
                        0
                      <%}%>
                  </td>

                </tr>
                <%
                  }
                %>
              </tbody>
            </table>

            <HR>
            Customers: <a href="customer.list.jsp"><%=eDao.getEntityCountByUsername(username)%></a>
            <HR>
            Products:   <a href="product.list.jsp"><%=pDao.getCountByUsername(username)%></a>
            <HR>
            Technicians:  <a href="technician.list.jsp"><%=tDao.getTechnicianCountByUsername(username)%></a>
            <HR>
            Events: <a href="event.list.jsp"><%=eventDao.getEventCountByUsername(username)%></a>
            <HR>
          </div>
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

</body>

</html>
