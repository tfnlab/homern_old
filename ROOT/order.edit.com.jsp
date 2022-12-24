<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tfnlab.mysql.User"%>
<%@ page import="com.tfnlab.mysql.UserDao" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.tfnlab.mysql.Order" %>
<%@ page import="com.tfnlab.mysql.OrderDao" %>
<%@ page import="java.net.URLDecoder" %>
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
    OrderDao dao = new OrderDao();

    int orderId = 0;
    String username = (String) session.getAttribute("username");
    User usernameOBJ = (User) session.getAttribute("usernameOBJ");
    if (request.getParameter("orderId") != null && !request.getParameter("orderId").isEmpty()) {
      orderId = Integer.parseInt(request.getParameter("orderId"));
    }

    String comType = request.getParameter("comType");

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
    function getMessage() {
      //genmessage.jsp?comType=latepaymentrequest
      var xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {

          document.getElementById("orderCom").innerHTML = this.responseText.trim();
        }
      };
      var select = document.getElementById("customer-touch-points");
      var selectedOption = select.options[select.selectedIndex];
      var text = selectedOption.text;
      var select2 = document.getElementById("business-type");
      var selectedOption2 = select.options[select2.selectedIndex];
      var text2 = selectedOption2.text;
      const encodedString = encodeURIComponent(text);
      const encodedString2 = encodeURIComponent(text2);
      var urlString = "genmessage.jsp?comType=" + encodedString + "&business-type=" + encodedString2;
      xhttp.open("GET", urlString, true);
      xhttp.send();
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
    function getCom() {
      var select = document.getElementById("customer-touch-points");
      var selectedOption = select.options[select.selectedIndex];
      var com = selectedOption.value;
      var orderId = <%=orderId%>;
      var url = "order.edit.com.jsp?orderId=" + orderId +  "&comType=" + com;
      window.open(url, "_self");
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
          <li>Order</li>
        </ol>
        <h2>Order</h2>
      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Blog Section ======= -->
    <section id="blog" class="blog">
      <div class="container px-4 px-lg-5">
        <h2>Order - Customer Touch Points </h2>
        <%@ include file="user.menu.nav.jsp" %>
        <HR>
          <div class="form-group">
            <label for="business-type">Select a type of business:</label>
            <select class="form-control" id="business-type" name="business-type">
              <option value="general-contractor">General contractor</option>
              <option value="carpenter">Carpenter</option>
              <option value="plumber">Plumber</option>
              <option value="electrician">Electrician</option>
              <option value="hvac-technician">HVAC technician</option>
              <option value="landscaper">Landscaper</option>
              <option value="roofing-contractor">Roofing contractor</option>
              <option value="painter">Painter</option>
              <option value="flooring-contractor">Flooring contractor</option>
            </select>
          </div>

        <hr>
          <select id="customer-touch-points" name="customer-touch-points">
            <option value="greeting" <%if(comType.equals("greeting")){%>selected<%}%> >Greeting</option>
            <option value="interestletter" <%if(comType.equals("interestletter")){%>selected<%}%> >Interest letter</option>
            <option value="proposal" <%if(comType.equals("proposal")){%>selected<%}%> >Proposal</option>
            <option value="invoicing" <%if(comType.equals("invoicing")){%>selected<%}%> >Invoicing</option>
            <option value="thankyou" <%if(comType.equals("thankyou")){%>selected<%}%> >Thank you</option>
            <option value="paymentrequest" <%if(comType.equals("paymentrequest")){%>selected<%}%> >Payment request</option>
            <option value="latepaymentrequest" <%if(comType.equals("latepaymentrequest")){%>selected<%}%> >Late Payment request</option>
            <option value="paymentconfirmation" <%if(comType.equals("paymentconfirmation")){%>selected<%}%> >Payment confirmation</option>
            <option value="progressupdate" <%if(comType.equals("progressupdate")){%>selected<%}%> >Progress update</option>
            <option value="changeorderrequest" <%if(comType.equals("changeorderrequest")){%>selected<%}%> >Change order request</option>
            <option value="warrantyormaintenanceinformation" <%if(comType.equals("warrantyormaintenanceinformation")){%>selected<%}%> >Warranty or maintenance information</option>
            <option value="customersatisfactionsurvey" <%if(comType.equals("customersatisfactionsurvey")){%>selected<%}%> >Customer satisfaction survey</option>
            <option value="followup" <%if(comType.equals("followup")){%>selected<%}%> >Follow-up</option>
            <option value="estimaterequest" <%if(comType.equals("estimaterequest")){%>selected<%}%> >Estimate request</option>
            <option value="scheduling" <%if(comType.equals("scheduling")){%>selected<%}%> >Scheduling</option>
            <option value="sitevisit" <%if(comType.equals("sitevisit")){%>selected<%}%> >Site visit</option>
            <option value="permitapplication" <%if(comType.equals("permitapplication")){%>selected<%}%> >Permit application</option>
          </select>

          <HR>
          <a href="javascript:void(0)" onclick="getMessage()">Generate Message</a>
          <HR>
        <%

                String shippingAddress = request.getParameter("shippingAddress");
                // Validate form data
                if (shippingAddress != null && shippingAddress.trim().length() > 0) {

                      long currentTimeMillis = System.currentTimeMillis();
                      Timestamp currentTime = new Timestamp(currentTimeMillis);
                      Date orderDate = new Date();
                      Date shippingDate = new Date();
                      String shippingAddressaclat = request.getParameter("shippingAddressaclat");
                      String shippingAddressaclng = request.getParameter("shippingAddressaclng");
                      String billingAddress = request.getParameter("billingAddress");
                      String billingAddressaclat = request.getParameter("billingAddressaclat");
                      String billingAddressaclng = request.getParameter("billingAddressaclng");
                      String paymentMethod = request.getParameter("paymentMethod");
                      BigDecimal orderTotal = new BigDecimal("0");
                      if (request.getParameter("orderTotal") != null && !request.getParameter("orderTotal").isEmpty()) {
                        orderTotal = new BigDecimal(request.getParameter("orderTotal"));
                      }
                      Timestamp createdAt = currentTime;
                      Timestamp updatedAt = currentTime;
                      Timestamp deletedAt = currentTime;
                      String orderName = request.getParameter("orderName");
                      String orderDescription = request.getParameter("orderDescription");
                      Order order = new Order(orderId, username, orderDate, shippingDate, shippingAddress, billingAddress, paymentMethod, orderTotal, createdAt, updatedAt, deletedAt, orderName, orderDescription, shippingAddressaclat, shippingAddressaclng, billingAddressaclat, billingAddressaclng );
                      dao.updateOrder(order);

                }
        %>
        <%
          Order order = dao.getOrderByOrderId(orderId);
        %>
        <!-- ======= Contact Section ======= -->

        <form action="order.edit.com.print.jsp" method="POST" >
          <label for="orderId">Order Name:</label><br>
          <input type="text" id="orderName" name="orderName" value="<%= order.getOrderName() %>"><br>
          <label for="orderId">Order Description:</label><br>
          <textarea class="form-control" id="orderDescription" name="orderDescription" rows="5"><%= order.getOrderDescription() %></textarea>
          <label for="orderId">Touch Point</label><br>
          <textarea class="form-control" id="orderCom" name="orderCom" rows="5"></textarea>

          <label for="orderId">Order ID:</label><br>
          <input type="text" id="orderId" name="orderId" value="<%= order.getOrderId() %>"><br>
          <label for="username">Username:</label><br>
          <input type="text" id="username" name="username" value="<%= order.getUsername() %>"><br>
          <label for="orderDate">Order Date:</label><br>
          <input type="text" id="orderDate" name="orderDate" placeholder="yyyy-MM-dd" value="<%= order.getOrderDate() %>"><br>
          <label for="shipDate">Ship Date:</label><br>
          <input type="text" id="shipDate" name="shipDate" placeholder="yyyy-MM-dd" value="<%= order.getShipDate() %>"><br>
          <label for="shippingAddress">Shipping Address:</label><br>
          <input class="form-control" type="text" id="shippingAddress" name="shippingAddress" value="<%= order.getShippingAddress() %>" onkeypress="callAC(this)"><br>
          <input type="hidden" id="shippingAddressaclat" name="shippingAddressaclat" value="<%= order.getShippingAddresslat() %>">
          <input type="hidden" id="shippingAddressaclng" name="shippingAddressaclng" value="<%= order.getShippingAddresslng() %>">
          <ul id="shippingAddressac" name="shippingAddressac"></ul>
          <hr>
            <%
              String uAddPls = usernameOBJ.getAddress().replace(" ", "+");
            if(usernameOBJ!=null && usernameOBJ.getAddress() !=null){
              String sAddSpcS = order.getShippingAddress().replace(" ", "-");
              String sAddPlsS = order.getShippingAddress().replace(" ", "+");
              String sAddEncS = URLDecoder.decode(order.getShippingAddress(), "UTF-8");

              String uAddEnc = URLDecoder.decode(usernameOBJ.getAddress(), "UTF-8");
                    %>
                    <a href="https://www.google.com/maps/search/?api=1&query=<%=sAddEncS%>">Google</a> |
                    <a href="https://maps.apple.com/?address=<%=sAddEncS%>">Apple</a> |
                    <a href="https://www.waze.com/en/directions?navigate=yes&latlng=<%=order.getShippingAddresslat()%>,<%=order.getShippingAddresslng()%>">Waze</a> |
                    <a href="https://wego.here.com/directions/mix//<%=sAddSpcS%>:e-eyJuYW1lIjoiMTMyNSBOLCBMYW1lciBBdmUsIEJ1cmJhaywgQ0EgOTA4NTAiLCJhZGRyZXNzIjoiMTMyNSBOLCBMYW1lciBBdmUsIEJ1cmJhaywgQ0EgOTA4NTAiLCJsYXRpdHVkZSI6MzQuMTgzNjYyLCJsb25naXR1ZGUiOi0xMTguMzI2MTAyfQ==?map=<%=order.getShippingAddresslat()%>,<%=order.getShippingAddresslng()%>,15,normal">HERE</a> |
                    <a href="https://www.bing.com/maps?osid=a8d44b60-4f0c-4e4a-b9c7-3a3b3f597628&cp=<%=order.getShippingAddresslat()%>~<%=order.getShippingAddresslng()%>&lvl=15&style=r">Bing</a> |
                    <a href="https://www.openstreetmap.org/search?query=<%=sAddEncS%>"#map=15/<%=order.getShippingAddresslat()%>/<%=order.getShippingAddresslng()%>">OSM</a> |
                    <a href="https://www.tomtom.com/en_gb/maps/maps/point?lat=<%=order.getShippingAddresslat()%>&lon=<%=order.getShippingAddresslng()%>">TomTom</a>
                    <hr>
                    <a href="https://www.google.com/maps/dir/?api=1&origin=<%=uAddPls%>&destination=<%=sAddPlsS%>">Get directions</a>
              <%
                  }
              %>

          <hr>

          <label for="billingAddress">Billing Address:</label><br>
          <input class="form-control" type="text" id="billingAddress" name="billingAddress" value="<%= order.getBillingAddress() %>" onkeypress="callAC(this)"><br>
          <input type="hidden" id="billingAddressaclat" name="billingAddressaclat" value="<%= order.getBillingAddresslat() %>">
          <input type="hidden" id="billingAddressaclng" name="billingAddressaclng" value="<%= order.getBillingAddresslng() %>">
          <ul id="billingAddressac" name="billingAddressac"></ul>
          <hr>
            <%
              String sAddPls = order.getBillingAddress().replace(" ", "+");
              String sAddSpc = order.getBillingAddress().replace(" ", "-");
              String sAddEnc = URLDecoder.decode(order.getBillingAddress(), "UTF-8");
            %>
            <a href="https://www.google.com/maps/search/?api=1&query=<%=sAddEnc%>">Google</a> |
            <a href="https://maps.apple.com/?address=<%=sAddEnc%>">Apple</a> |
            <a href="https://www.waze.com/en/directions?navigate=yes&latlng=<%=order.getBillingAddresslat()%>,<%=order.getBillingAddresslng()%>">Waze</a> |
            <a href="https://wego.here.com/directions/mix//<%=sAddSpc%>:e-eyJuYW1lIjoiMTMyNSBOLCBMYW1lciBBdmUsIEJ1cmJhaywgQ0EgOTA4NTAiLCJhZGRyZXNzIjoiMTMyNSBOLCBMYW1lciBBdmUsIEJ1cmJhaywgQ0EgOTA4NTAiLCJsYXRpdHVkZSI6MzQuMTgzNjYyLCJsb25naXR1ZGUiOi0xMTguMzI2MTAyfQ==?map=34.18366,-118.3261,15,normal">HERE</a> |
            <a href="https://www.bing.com/maps?osid=a8d44b60-4f0c-4e4a-b9c7-3a3b3f597628&cp=<%=order.getBillingAddresslat()%>~<%=order.getBillingAddresslng()%>&lvl=15&style=r">Bing</a> |
            <a href="https://www.openstreetmap.org/search?query=<%=sAddEnc%>"#map=15/<%=order.getBillingAddresslat()%>/<%=order.getBillingAddresslng()%>">OSM</a> |
            <a href="https://www.tomtom.com/en_gb/maps/maps/point?lat=<%=order.getBillingAddresslat()%>&lon=<%=order.getBillingAddresslng()%>">TomTom</a>
            <hr>
            <a href="https://www.google.com/maps/dir/?api=1&origin=<%=uAddPls%>&destination=<%=sAddPls%>">Get directions</a>
          <hr>
          <label for="paymentMethod">Payment Method:</label><br>
          <input type="text" id="paymentMethod" name="paymentMethod" value="<%= order.getPaymentMethod() %>"><br>
          <label for="orderTotal">Order Total:</label><br>
          <input type="text" id="orderTotal" name="orderTotal" value="<%= order.getOrderTotal() %>"><br>
          <label for="timestamp">Timestamp:</label><br>
          <input type="text" id="timestamp" name="timestamp" value="<%= order.getTimestamp() %>"><br>
          <label for="ts">TS:</label><br>
          <input type="text" id="ts" name="ts" value="<%= order.getTs() %>"><br>
          <label for="lastModified">Last Modified:</label><br>
          <input type="text" id="lastModified" name="lastModified" value="<%= order.getLastModified() %>"><br><br>
          <input type="submit" value="Submit">
        </form>

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
