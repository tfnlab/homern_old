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
<%@ page import="java.text.SimpleDateFormat" %>
<%@ include file="auth.jsp" %>
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


    <!-- Include the Bootstrap CSS file -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- Include the Bootstrap Datepicker CSS file -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw==" crossorigin="anonymous" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" crossorigin="anonymous" />
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
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
<%
  OrderDao dao = new OrderDao();

  int orderId = 0;
  String username = (String) session.getAttribute("username");
  User usernameOBJ = (User) session.getAttribute("usernameOBJ");
  if (request.getParameter("orderId") != null && !request.getParameter("orderId").isEmpty()) {
    orderId = Integer.parseInt(request.getParameter("orderId"));
  }
%>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>
    function callCoreLocator(sk) {
      var xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            alert(this.responseText);
//          let items = this.responseText.split('<ITEM>');
//          fNamenew = items[items.length-1];
//          fNamenew = removeTrailingSpaces(fNamenew);
//          document.getElementById(fNamenew+"lat").value = items[0];
//          document.getElementById(fNamenew+"lng").value = items[1];
//          document.getElementById(fNamenew+"zip").value = items[2];
        }
      };
      myString = document.getElementById(sk.slice(0, -2)).value.replace("Los Angeles", "");
      const encodedString = encodeURIComponent(myString);
      var urlString = "corelogic.jsp?search=" + encodedString + "&zip=" + document.getElementById(sk+"zip").value;
      xhttp.open("GET", urlString, true);
      xhttp.send();

    }
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
            document.getElementById(fNamenew+"zip").value = items[2];
            callCoreLocator(fNamenew);
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
    function getCom() {
      var select = document.getElementById("customer-touch-points");
      var selectedOption = select.options[select.selectedIndex];
      var com = selectedOption.value;
      var orderId = <%=orderId%>;
      var url = "order.edit.com.jsp?orderId=" + orderId +  "&comType=" + com;
      window.open(url, "_self");
    }
    function getSchedule() {
      var select = document.getElementById("customer-touch-points");
      var selectedOption = select.options[select.selectedIndex];
      var com = selectedOption.value;
      var orderId = <%=orderId%>;
      var url = "order.edit.schedule.jsp?orderId=" + orderId +  "&comType=" + com;
      window.open(url, "_self");
    }
    function getProducts() {
      var orderId = <%=orderId%>;
      var url = "order.edit.products.jsp?orderId=" + orderId ;
      window.open(url, "_self");
    }
    function getDiscounts() {
      var orderId = <%=orderId%>;
      var url = "order.edit.discounts.jsp?orderId=" + orderId ;
      window.open(url, "_self");
    }

    function getCustomers() {
      var orderId = <%=orderId%>;
      var url = "order.edit.customers.jsp?orderId=" + orderId ;
      window.open(url, "_self");
    }
    function getPayments() {
      var orderId = <%=orderId%>;
      var url = "order.edit.payments.jsp?orderId=" + orderId ;
      window.open(url, "_self");
    }
    function getRebates() {
      var orderId = <%=orderId%>;
      var url = "order.edit.rebates.jsp?orderId=" + orderId ;
      window.open(url, "_self");
    }
    function calculateFee(){
        var select = document.getElementById("paymentMethod");
        var selectedValue = select.options[select.selectedIndex].value;
        if(selectedValue == "stripe"){
            var amount = document.getElementById("orderTotal").value;
            var amount_percentage = <%=usernameOBJ.getStripe_fee()%>;
            var finalAmount = amount / (1 - (amount_percentage / 100));
            document.getElementById("orderTotalAfterFee").value = finalAmount.toFixed(2);
        }else{
            var amount = document.getElementById("orderTotal").value;
            document.getElementById("orderTotalAfterFee").value = amount;
        }
    }

    window.onload = function() {
        calculateFee();
    };

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
          <li>Order</li>
        </ol>
        <h2>Order</h2>
      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Blog Section ======= -->
    <section id="blog" class="blog">
      <div class="container px-4 px-lg-5">
        <h2>Order</h2>
        <HR>
        <%@ include file="user.menu.nav.jsp" %>
        <hr>
          <select id="customer-touch-points" tabindex="2">
            <option value="greeting">Greeting</option>
            <option value="interestletter">Interest letter</option>
            <option value="proposal">Proposal</option>
            <option value="invoicing">Invoicing</option>
            <option value="thankyou">Thank you</option>
            <option value="paymentrequest">Payment request</option>
            <option value="latepaymentrequest">Late Payment request</option>
            <option value="paymentconfirmation">Payment confirmation</option>
            <option value="progressupdate">Progress update</option>
            <option value="changeorderrequest">Change order request</option>
            <option value="warrantyormaintenanceinformation">Warranty or maintenance information</option>
            <option value="customersatisfactionsurvey">Customer satisfaction survey</option>
            <option value="followup">Follow-up</option>
            <option value="estimaterequest">Estimate request</option>
            <option value="scheduling">Scheduling</option>
            <option value="sitevisit">Site visit</option>
            <option value="permitapplication">Permit application</option>
          </select>
            <HR>
          <button class="btn btn-primary" onclick="getCom()"  tabindex="3">Correspondence</button>
          <button class="btn btn-primary" onclick="getCustomers()" tabindex="6">Customers</button>
          <button class="btn btn-primary" onclick="getSchedule()" tabindex="4">Schedule</button>
          <button class="btn btn-primary" onclick="getDiscounts()" tabindex="5">Discounts</button>
          <button class="btn btn-primary" onclick="getRebates()" tabindex="5">Rebates</button>
          <button class="btn btn-primary" onclick="getProducts()" tabindex="5">Invoice</button>
          <button class="btn btn-primary" onclick="getPayments()" tabindex="7">Payments</button>
        <hr>

        <%

                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
                String shippingAddress = request.getParameter("shippingAddress");
                // Validate form data
                String orderName = request.getParameter("orderName");
                if (orderName != null && orderName.trim().length() > 0) {

                      long currentTimeMillis = System.currentTimeMillis();
                      Timestamp currentTime = new Timestamp(currentTimeMillis);
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
                      if (request.getParameter("shippingAddressaclat") == null || request.getParameter("shippingAddressaclat").isEmpty()) {
                        shippingAddressaclat = "0.0";
                      }
                      if (request.getParameter("shippingAddressaclng") == null || request.getParameter("shippingAddressaclng").isEmpty()) {
                        shippingAddressaclng = "0.0";
                      }
                      if (request.getParameter("billingAddressaclat") == null || request.getParameter("billingAddressaclat").isEmpty()) {
                        billingAddressaclat = "0.0";
                      }
                      if (request.getParameter("billingAddressaclng") == null || request.getParameter("billingAddressaclng").isEmpty()) {
                        billingAddressaclng = "0.0";
                      }
                      BigDecimal shippingAddressEstPrice = new BigDecimal("0");
                      if (request.getParameter("shippingAddressEstPrice") != null && !request.getParameter("shippingAddressEstPrice").isEmpty()) {
                          shippingAddressEstPrice = new BigDecimal(request.getParameter("shippingAddressEstPrice"));
                      }

                      BigDecimal shippingAddressLastSalePrice = new BigDecimal("0");
                      if (request.getParameter("shippingAddressLastSalePrice") != null && !request.getParameter("shippingAddressLastSalePrice").isEmpty()) {
                          shippingAddressLastSalePrice = new BigDecimal(request.getParameter("shippingAddressLastSalePrice"));
                      }

                      BigDecimal shippingAddressEstPriceHigh = new BigDecimal("0");
                      if (request.getParameter("shippingAddressEstPriceHigh") != null && !request.getParameter("shippingAddressEstPriceHigh").isEmpty()) {
                          shippingAddressEstPriceHigh = new BigDecimal(request.getParameter("shippingAddressEstPriceHigh"));
                      }

                      BigDecimal shippingAddressEstPriceLow = new BigDecimal("0");
                      if (request.getParameter("shippingAddressEstPriceLow") != null && !request.getParameter("shippingAddressEstPriceLow").isEmpty()) {
                          shippingAddressEstPriceLow = new BigDecimal(request.getParameter("shippingAddressEstPriceLow"));
                      }
                      Date orderDate = new Date();
                      Date shippingDate = new Date();
                        try{
                           orderDate = dateFormat.parse(request.getParameter("orderDate"));
                           shippingDate = dateFormat.parse(request.getParameter("shipDate"));
                        } catch (Exception e) {
                          %><%="Error parsing date and time string: " + e.getMessage()%><%
                      }
                      Timestamp createdAt = currentTime;
                      Timestamp updatedAt = currentTime;
                      Timestamp deletedAt = currentTime;
                      String orderDescription = request.getParameter("orderDescription");
                      String status = request.getParameter("status");
                      Order order = new Order(orderId, username, orderDate, shippingDate, shippingAddress, billingAddress, paymentMethod, orderTotal, createdAt, updatedAt, deletedAt, orderName, orderDescription, shippingAddressaclat, shippingAddressaclng, billingAddressaclat, billingAddressaclng, status);
                      order.setShippingAddressEstPrice(shippingAddressEstPrice);
                      order.setShippingAddressLastSalePrice(shippingAddressLastSalePrice);
                      order.setShippingAddressEstPriceHigh(shippingAddressEstPriceHigh);
                      order.setShippingAddressEstPriceLow(shippingAddressEstPriceLow);
                      dao.updateOrder(order);

                }
        %>
        <%
          Order order = dao.getOrderByOrderId(orderId, username);

            String currentStatus = order.getStatus();
        %>
        <!-- ======= Contact Section ======= -->

        <form action="order.edit.jsp" method="POST">
            Order ID<%= order.getOrderId() %>
            <HR>
          <div class="form-group">
            <label for="order-status">Order Status</label>
            <select class="form-control" id="status" name="status">
              <%
                String[] statuses = {"Proposal", "Estimate", "Order Placement", "Invoicing", "Payment", "Delivery", "Fulfillment"};
                for (String sstatus : statuses) {
              %>
              <option value="<%= sstatus %>" <%= sstatus.equals(currentStatus) ? "selected" : "" %>><%= sstatus %></option>
              <%
                }
              %>
            </select>
          </div>
                 <%
                    SimpleDateFormat formatterHH = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
                 %>
          <label for="orderId">Order Name:</label><br>
          <input type="text" id="orderName" name="orderName" value="<%= order.getOrderName() %>"  tabindex="8"><br>
          <label for="orderId">Order Description:</label><br>
          <textarea class="form-control" id="orderDescription" name="orderDescription" rows="5"  tabindex="9"><%= order.getOrderDescription() %></textarea>
          <input type="hidden" id="orderId" name="orderId" value="<%= order.getOrderId() %>">
          <div class="form-group">
            <label for="endTime">Invoice Date:</label>
            <input type="datetime-local" class="form-control" name="orderDate" value="<%= formatterHH.format(order.getOrderDate()) %>" datepicker  tabindex="10">
          </div>
          <label for="shipDate">Project Date:</label><br>
          <input class="form-control" type="datetime-local" id="shipDate" name="shipDate" placeholder="yyyy-MM-dd" value="<%= formatterHH.format(order.getShipDate()) %>"  tabindex="11"><br>
          <label for="shippingAddress">Project Address:</label><br>
          <input class="form-control" type="text" id="shippingAddress" name="shippingAddress" value="<%= order.getShippingAddress() %>" onkeypress="callAC(this)"  tabindex="12"><br>
          <input type="hidden" id="shippingAddressaclat" name="shippingAddressaclat" value="<%= order.getShippingAddresslat() %>">
          <input type="hidden" id="shippingAddressaclng" name="shippingAddressaclng" value="<%= order.getShippingAddresslng() %>">
          <input type="hidden" id="shippingAddressaczip" name="shippingAddressaczip" value="" >
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
          <input class="form-control" type="text" id="billingAddress" name="billingAddress" value="<%= order.getBillingAddress() %>" onkeypress="callAC(this)"  tabindex="13"><br>
          <input type="hidden" id="billingAddressaclat" name="billingAddressaclat" value="<%= order.getBillingAddresslat() %>">
          <input type="hidden" id="billingAddressaclng" name="billingAddressaclng" value="<%= order.getBillingAddresslng() %>">
          <input type="hidden" id="billingAddressaczip" name="billingAddressaczip" >
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
<div class="form-group">
  <label for="paymentMethod">Payment Method</label>
  <select class="form-control" id="paymentMethod" name="paymentMethod" onchange="calculateFee()">
    <option value="cash" <%= "cash".equals(order.getPaymentMethod()) ? "selected" : "" %>>Cash</option>
    <option value="check" <%= "check".equals(order.getPaymentMethod()) ? "selected" : "" %>>Check</option>
    <option value="creditCard" <%= "creditCard".equals(order.getPaymentMethod()) ? "selected" : "" %>>Credit Card</option>
    <option value="debitCard" <%= "debitCard".equals(order.getPaymentMethod()) ? "selected" : "" %>>Debit Card</option>
    <option value="paypal" <%= "paypal".equals(order.getPaymentMethod()) ? "selected" : "" %>>Paypal</option>
    <option value="applePay" <%= "applePay".equals(order.getPaymentMethod()) ? "selected" : "" %>>Apple Pay</option>
    <option value="stripe" <%= "stripe".equals(order.getPaymentMethod()) ? "selected" : "" %>>Stripe</option>
    <option value="zelle" <%= "zelle".equals(order.getPaymentMethod()) ? "selected" : "" %>>Zelle</option>

  </select>
</div>


          <label for="orderTotal">Order Total:</label><br>
          <input type="text" id="orderTotal" name="orderTotal" value="<%= order.getOrderTotal() %>"  tabindex="15" onchange="calculateFee()" onkeypress="calculateFee()"><br>
          <hr>
          <label for="orderTotal">Order Total Fee Included:</label><br>
          <input type="text" id="orderTotalAfterFee" name="orderTotalAfterFee"  tabindex="16"><br>
          <hr>
          <h4>Property Info</h4>
          <hr>
          <div class="form-group">
              <label for="shippingAddressEstPrice">Estimated Price:</label>
              <input type="number" class="form-control" id="shippingAddressEstPrice" name="shippingAddressEstPrice" step="0.01" value="<%= order.getShippingAddressEstPrice() %>" tabindex="9">
          </div>
          <div class="form-group">
              <label for="shippingAddressLastSalePrice">Last Sale Price:</label>
              <input type="number" class="form-control" id="shippingAddressLastSalePrice" name="shippingAddressLastSalePrice" step="0.01" value="<%= order.getShippingAddressLastSalePrice() %>" tabindex="10">
          </div>
          <div class="form-group">
              <label for="shippingAddressEstPriceHigh">Estimated High Price:</label>
              <input type="number" class="form-control" id="shippingAddressEstPriceHigh" name="shippingAddressEstPriceHigh" step="0.01" value="<%= order.getShippingAddressEstPriceHigh() %>" tabindex="11">
          </div>
          <div class="form-group">
              <label for="shippingAddressEstPriceLow">Estimated Low Price:</label>
              <input type="number" class="form-control" id="shippingAddressEstPriceLow" name="shippingAddressEstPriceLow" step="0.01" value="<%= order.getShippingAddressEstPriceLow() %>" tabindex="12">
          </div>
          <input type="submit" value="Submit"  tabindex="16">
        </form>

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
    $(function () {
     var bindDatePicker = function() {
  		$(".date").datetimepicker({
          format:'YYYY-MM-DD',
  			icons: {
  				time: "fa fa-clock-o",
  				date: "fa fa-calendar",
  				up: "fa fa-arrow-up",
  				down: "fa fa-arrow-down"
  			}
  		}).find('input:first').on("blur",function () {
  			// check if the date is correct. We can accept dd-mm-yyyy and yyyy-mm-dd.
  			// update the format if it's yyyy-mm-dd
  			var date = parseDate($(this).val());

  			if (! isValidDate(date)) {
  				//create date based on momentjs (we have that)
  				date = moment().format('YYYY-MM-DD');
  			}

  			$(this).val(date);
  		});
  	}

     var isValidDate = function(value, format) {
  		format = format || false;
  		// lets parse the date to the best of our knowledge
  		if (format) {
  			value = parseDate(value);
  		}

  		var timestamp = Date.parse(value);

  		return isNaN(timestamp) == false;
     }

     var parseDate = function(value) {
  		var m = value.match(/^(\d{1,2})(\/|-)?(\d{1,2})(\/|-)?(\d{4})$/);
  		if (m)
  			value = m[5] + '-' + ("00" + m[3]).slice(-2) + '-' + ("00" + m[1]).slice(-2);

  		return value;
     }

     bindDatePicker();
   });
  </script>
</body>

</html>
