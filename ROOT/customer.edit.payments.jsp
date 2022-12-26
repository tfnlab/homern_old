<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tfnlab.mysql.User"%>
<%@ page import="com.tfnlab.mysql.UserDao" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.tfnlab.mysql.Order" %>
<%@ page import="com.tfnlab.mysql.OrderDao" %>
<%@ page import="com.tfnlab.mysql.Entity" %>
<%@ page import="com.tfnlab.mysql.EntityDao" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<%@ page import="com.tfnlab.mysql.Payment" %>
<%@ page import="com.tfnlab.mysql.PaymentDao" %>


<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Home Renovation Nation - Customer</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
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
  <%
    int eId = 0;
    String username = (String) session.getAttribute("username");
    User usernameOBJ = (User) session.getAttribute("usernameOBJ");
    if (request.getParameter("customerId") != null && !request.getParameter("customerId").isEmpty()) {
      eId = Integer.parseInt(request.getParameter("customerId"));
    }
  %>
  <!-- =======================================================
  * Template Name: Presento - v3.9.1
  * Template URL: https://bootstrapmade.com/presento-bootstrap-corporate-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>
    function callGeo(sk, fNameLink) {
        document.getElementById(fNameLink.substring(0,fNameLink.length-2)).value = sk;
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
            let items = this.responseText.split('<ITEM>');
            fNamenew = items[items.length-1];
            fNamenew = removeTrailingSpaces(fNamenew);
            document.getElementById(fNamenew+"lat").value = items[0];
            document.getElementById(fNamenew+"lng").value = items[1];


          }
        };
        const encodedString = encodeURIComponent(sk);
        var urlString = "GeocodingExample.jsp?search=" + encodedString + "&sfor=" + fNameLink;
        xhttp.open("GET", urlString, true);
        xhttp.send();
    }
    function removeTrailingSpaces(str) {
            return str.replace(/\s+$/g, "");
    }
    function callAC(sfor) {
      var xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
          let items = this.responseText.split('<ITEM>');
          fName = items[items.length-1];
          fName = removeTrailingSpaces(fName);
          for (let i = 0; i < items.length-1; i++) {
            if (items[i].length > 5) {
              let newL = "<li>" + "<a href=\"javascript:void(0)\" onclick=\"callGeo('" + items[i] +"' , '" + fName+ "')\" >" + items[i] + "</a>" + "</li>";
              document.getElementById(fName).innerHTML = document.getElementById(fName).innerHTML  + newL;
            }
          }
        }
      };
      let elName = sfor.name + "ac";
      let search = document.getElementById(sfor.name).value;

      if (search.length > 5) {
        document.getElementById(elName).innerHTML = "";
        var urlString = "GoogleAutocomplete.jsp?search=" + search + "&sfor=" + sfor.name;
        xhttp.open("GET", urlString, true);
        xhttp.send();
      }
    }

  </script>
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center">
    <div class="container d-flex align-items-center">
      <h1 class="logo me-auto"><a href="index.html">HRN</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt=""></a>-->

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a class="nav-link scrollto" href="index.html#hero">Home</a></li>
          <li><a class="nav-link scrollto active" href="avatar.html">Avatar</a></li>
          <li><a class="nav-link scrollto" href="index.html#services">Services</a></li>
          <li><a class="nav-link scrollto " href="index.html#portfolio">Portfolio</a></li>
          <li><a class="nav-link scrollto" href="index.html#team">Team</a></li>
          <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

      <a href="https://forms.gle/vdU9zvFTZJ9eKAsz6" class="get-started-btn scrollto">Get Started</a>
    </div>
  </header><!-- End Header -->

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="index.html">Home</a></li>
          <li>Customer</li>
        </ol>
        <h2>Customer</h2>
      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Blog Section ======= -->
    <section id="blog" class="blog">
      <div class="container px-4 px-lg-5">
        <h2>Customer</h2>
        <%@ include file="user.menu.nav.jsp" %>

        <%
                long currentTimeMillis = System.currentTimeMillis();
                Timestamp currentTime = new Timestamp(currentTimeMillis);
                String paymentAmountStr = request.getParameter("paymentAmount");

                Entity entity = new Entity();
                EntityDao ed = new EntityDao();
                PaymentDao pDao = new PaymentDao();
                if (paymentAmountStr != null && paymentAmountStr.trim().length() > 0) {
                      %>
                      <%
                        Integer customerId = Integer.parseInt(request.getParameter("customerId"));
                        Date paymentDate = null;
                        Date expectedPostDate = null;
                        Date effectiveDate = null;
                        BigDecimal paymentAmount = BigDecimal.valueOf(Double.parseDouble(request.getParameter("paymentAmount")));
                        String paymentMethod = request.getParameter("paymentMethod");
                        Boolean hasCleared = Boolean.parseBoolean(request.getParameter("hasCleared"));
                        Boolean hasReversed = Boolean.parseBoolean(request.getParameter("hasReversed"));
                        Date createdAt = null;
                        Date lastUpdatedAt = null;
                        String createdBy = username;
                        Integer lastModifiedBy = 0;
                        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

                        if (request.getParameter("paymentDate") != null) {
                            try {
                                paymentDate = dateFormat.parse(request.getParameter("paymentDate"));
                            } catch (ParseException e) {
                                paymentDate = dateFormat.parse("1980-24-10");
                            }
                        }
                        if (request.getParameter("expectedPostDate") != null) {
                            try {
                                expectedPostDate = dateFormat.parse(request.getParameter("expectedPostDate"));
                            } catch (ParseException e) {
                                expectedPostDate = dateFormat.parse("1980-24-10");
                            }
                        }
                        if (request.getParameter("effectiveDate") != null) {
                            try {
                                effectiveDate = dateFormat.parse(request.getParameter("effectiveDate"));
                            } catch (ParseException e) {
                                effectiveDate = dateFormat.parse("1980-24-10");
                            }
                        }
                        if (request.getParameter("createdAt") != null) {
                            try {
                                createdAt = dateFormat.parse(request.getParameter("createdAt"));
                            } catch (ParseException e) {
                                createdAt = dateFormat.parse("1980-24-10");
                            }
                        }
                        if (request.getParameter("lastUpdatedAt") != null) {
                            try {
                                lastUpdatedAt = dateFormat.parse(request.getParameter("lastUpdatedAt"));
                            } catch (ParseException e) {
                                lastUpdatedAt = dateFormat.parse("1980-24-10");
                            }
                        }

                        Payment payment = new Payment(0, customerId, paymentDate, expectedPostDate, effectiveDate, paymentAmount, paymentMethod, hasCleared, hasReversed, createdAt, lastUpdatedAt, createdBy, lastModifiedBy);
                        pDao.insertPayment(payment);
                      %>

                        Payment Saved
                      <%
                }
                  entity = ed.getEntityById(eId);
        %>
        <form action="customer.edit.payments.jsp" method="post">
          <div class="form-group">
            <label for="id">ID</label>
            <input type="text" class="form-control" id="customerId" name="customerId" value="<%= entity.getId() %>" readonly disable >
          </div>
          <div class="form-group">
            <label for="firstName">First Name</label>
            <input type="text" class="form-control" id="firstName" name="firstName" value="<%= entity.getFirstName() %>" disable >
          </div>
          <div class="form-group">
            <label for="lastName">Last Name</label>
            <input type="text" class="form-control" id="lastName" name="lastName" value="<%= entity.getLastName() %>" disable >
          </div>
          <div class="form-group">
            <label for="email">Email</label>
            <input type="email" class="form-control" id="email" name="email" value="<%= entity.getEmail() %>" disable >
          </div>
          <div class="form-group">
            <label for="phone">Phone</label>
            <input type="tel" class="form-control" id="phone" name="phone" disabled >
          </div>
          <div class="form-group">
            <label for="paymentDate">Payment Date</label>
            <input type="date" class="form-control" id="paymentDate" name="paymentDate" placeholder="Enter payment date">
          </div>
          <div class="form-group">
            <label for="expectedPostDate">Expected Post Date</label>
            <input type="date" class="form-control" id="expectedPostDate" name="expectedPostDate" placeholder="Enter expected post date">
          </div>
          <div class="form-group">
            <label for="effectiveDate">Effective Date</label>
            <input type="date" class="form-control" id="effectiveDate" name="effectiveDate" placeholder="Enter effective date">
          </div>
          <div class="form-group">
            <label for="paymentAmount">Payment Amount</label>
            <input type="number" class="form-control" id="paymentAmount" name="paymentAmount" placeholder="Enter payment amount">
          </div>
          <div class="form-group">
            <label for="paymentMethod">Payment Method</label>
            <input type="text" class="form-control" id="paymentMethod" name="paymentMethod" placeholder="Enter payment method">
          </div>
          <div class="form-group form-check">
            <input type="checkbox" class="form-check-input" id="hasCleared" name="hasCleared">
            <label class="form-check-label" for="hasCleared">Has Cleared</label>
          </div>
          <div class="form-group form-check">
            <input type="checkbox" class="form-check-input" id="hasReversed" name="hasReversed">
                <label class="form-check-label" for="hasReversed">Has Reversed</label>
              </div>
              <div class="form-group">
                <label for="createdAt">Created At</label>
                <input type="date" class="form-control" id="createdAt" name="createdAt" placeholder="Enter created at date">
              </div>
              <div class="form-group">
                <label for="lastUpdatedAt">Last Updated At</label>
                <input type="date" class="form-control" id="lastUpdatedAt" name="lastUpdatedAt" placeholder="Enter last updated at date">
              </div>
              <div class="form-group">
                <label for="createdBy">Created By</label>
                <input type="text" class="form-control" id="createdBy" name="createdBy" placeholder="Enter created by">
              </div>
              <div class="form-group">
                <label for="lastUpdatedBy">Last Updated By</label>
                <input type="text" class="form-control" id="lastUpdatedBy" name="lastUpdatedBy" placeholder="Enter last updated by">
              </div>
              <button type="submit" class="btn btn-primary">Submit</button>
            </form>

            <%

                List<Payment> pList = pDao.getPayments(order.getOrderId(), username);
                BigDecimal pTotal  = new BigDecimal("0");
                for (ProductLineItem pItem : pliList) {
                       pTotal = pTotal.add(pItem.getTotal());
               %>
                   ID: <%= pItem.getPaymentId() %><br>
                   Tech Price: <%= pItem.getPaymentAmount() %><br>
                   -- <a href="customer.edit.payments.jsp?remove=yes&orderId=<%=orderId%>&pid=<%= plItem.getPaymentId() %>" >remove<a><br>
                   <hr>

            <%
                }
            %>

      </div>

    </section><!-- End Blog Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">

    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6 footer-contact">
            <h3>Presento<span>.</span></h3>
            <p>
              A108 Adam Street <br>
              New York, NY 535022<br>
              United States <br><br>
              <strong>Phone:</strong> +1 5589 55488 55<br>
              <strong>Email:</strong> info@example.com<br>
            </p>
          </div>

          <div class="col-lg-2 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Services</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
            </ul>
          </div>

          <div class="col-lg-4 col-md-6 footer-newsletter">
            <h4>Join Our Newsletter</h4>
            <p>
              Sign up to learn more about technology and information management.
            </p>
            <form action="" method="post">
              <input type="email" name="email"><input type="submit" value="Subscribe">
            </form>
          </div>

        </div>
      </div>
    </div>

    <div class="container d-md-flex py-4">

      <div class="me-md-auto text-center text-md-start">
        <div class="copyright">
          &copy; Copyright <strong><span>Presento</span></strong>. All Rights Reserved
        </div>
        <div class="credits">
          <!-- All the links in the footer should remain intact. -->
          <!-- You can delete the links only if you purchased the pro version. -->
          <!-- Licensing information: https://bootstrapmade.com/license/ -->
          <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/presento-bootstrap-corporate-template/ -->
          Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
        </div>
      </div>
      <div class="social-links text-center text-md-end pt-3 pt-md-0">
        <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
        <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
        <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
        <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
        <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
      </div>
    </div>
  </footer><!-- End Footer -->

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
