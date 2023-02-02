<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tfnlab.mysql.User"%>
<%@ page import="com.tfnlab.mysql.UserDao" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.tfnlab.mysql.Order" %>
<%@ page import="com.tfnlab.mysql.OrderDao" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ include file="auth.jsp" %>
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
          <li>Orders</li>
        </ol>
        <h2>Orders</h2>
      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Blog Section ======= -->
    <section id="blog" class="blog">
      <div class="container px-4 px-lg-5">
        <h2>Orders</h2>
        <HR>
        <%@ include file="user.menu.nav.jsp" %>
          <HR>
            <a href="order.new.jsp" tabindex="2" ><i class="fas fa-plus"></i> Order</a>
          <HR>
        <%
                String searchKey = request.getParameter("searchKey");
                OrderDao orderDao = new OrderDao();
                String username = (String) session.getAttribute("username");

                List<Order> orders = null;
                HashMap<Integer, Order> ordersMap = new HashMap<>();
                if (searchKey != null && searchKey.trim().length() > 0) {
                    orders = orderDao.getCustomerOrdersSearchKey(searchKey, username);
                }else{
                    searchKey = "";
                    orders = orderDao.getCustomerOrdersDetails(username);
                    ordersMap = orderDao.getCustomerOrdersDetailsPaid(username);
                }
                %>
                <form action="order.list.jsp" method="post">
                  <div class="form-group">
                    <label for="firstName">Search Key</label>
                    <input type="text" class="form-control" id="searchKey" name="searchKey" value="<%= searchKey %>" tabindex="3">
                  </div>
                  <HR>
                  <button type="submit" class="btn btn-primary" tabindex="4" >Search</button>
                </form>
                <HR>
                <%
                    int tabindex = 5;

                        Calendar calendar = Calendar.getInstance();
                        Date today = calendar.getTime(); // current date
                %>
              <% for (Order order : orders) { %>
                <% String color = order.getShipDate().after(today) ? "#C8E6C9" : "#FFCDD2"; %>
                <div class="container-fluid p-5" style="background-color: <%=color%>">
                  <div class="card p-3">
                Order ID: <%= order.getOrderId() %><br>
                Order Status: <%= order.getStatus() %><br>
                Name: <%= order.getOrderName() %><br>
                  Description: <%= order.getOrderDescription() %><br>
                Date: <%= order.getOrderDate() %><br>
                Project Address: <%= order.getShippingAddress() %><br>
                <!-- Location : <%= order.getShippingAddresslat() %> ,<%= order.getShippingAddresslng() %><br> -->
                Billing Address: <%= order.getBillingAddress() %><br>
                <!-- Location : <%= order.getBillingAddresslat() %> ,<%= order.getBillingAddresslng() %><br> -->
                Payment Method: <%= order.getPaymentMethod() %><br>
                Total: <%= order.getOrderTotal() %><br>
                <H3>Products</h3>
                <a href="order.edit.jsp?orderId=<%= order.getOrderId() %>" class="btn btn-primary" tabindex="<%=tabindex%>" >More Info</a><br>

                <%
                  tabindex +=1;
                %>
                  </div>
                </div>
                <HR>
              <% } %>


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
