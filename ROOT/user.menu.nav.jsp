<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tfnlab.mysql.User"%>
<%@ page import="com.tfnlab.mysql.UserDao" %>


<script>
  function goToUrl() {
    var select = document.getElementById("hrnnavbar");
    var option = select.options[select.selectedIndex];
    var url = option.value;
    window.open(url, "_self");
  }
  document.getElementById("navbar").addEventListener("change", goToUrl);
</script>
<%
  String currentUrl = request.getRequestURL().toString();
%>
<select name="hrnnavbar" id="hrnnavbar" onchange="goToUrl()" tabindex="1">
  <option value="user.menu.jsp" <%= currentUrl.indexOf("user.menu.jsp") != -1 ? "selected" : "" %> ><i class="fa fa-home"></i> Home</option>
  <option value="dashboard.jsp" <%= currentUrl.indexOf("dashboard.jsp") != -1 ? "selected" : "" %> ><i class="fa fa-cog"></i> Dashboard</option>
  <option value="user.edit.jsp" <%= currentUrl.indexOf("user.edit.jsp") != -1 ? "selected" : "" %> ><i class="fa fa-cog"></i> Marketing</option>
  <option value="technician.list.jsp" <%= currentUrl.indexOf("technician.list.jsp") != -1 ? "selected" : "" %> ><i class="fa fa-wrench"></i> Technicians</option>
  <option value="product.list.jsp" <%= currentUrl.indexOf("product.list.jsp") != -1 ? "selected" : "" %> ><i class="fa fa-box"></i> Products</option>
  <option value="customer.list.jsp" <%= currentUrl.indexOf("customer.list.jsp") != -1 ? "selected" : "" %> ><i class="fa fa-users"></i> Customers</option>
  <option value="order.list.jsp" <%= currentUrl.indexOf("order.list.jsp") != -1 ? "selected" : "" %> ><i class="fa fa-shopping-cart"></i> Orders</option>
  <option value="event.list.jsp" <%= currentUrl.indexOf("event.list.jsp") != -1 ? "selected" : "" %> ><i class="fa fa-calendar"></i> Events</option>
</select>

<script>
  function newCustomer() {
    window.open("customer.new.jsp", "_self");
  }
  function newOrder() {
    window.open("order.new.jsp", "_self");
  }
  function newProducts() {
    window.open("product.list.jsp", "_self");
  }
  function getCalendarView() {
    window.open("event.list.calendar.jsp", "_self");
  }
  document.addEventListener("keydown", function(event) {
    // Check if the "Ctrl" and "C" keys are pressed
    if (event.ctrlKey && event.keyCode == 67) {
      event.preventDefault();
      newCustomer();
    }
    if (event.ctrlKey && event.keyCode == 79) {
      event.preventDefault();
      newOrder();
    }
    if (event.ctrlKey && event.keyCode == 80) {
      event.preventDefault();
      newProducts();
    }
    if (event.ctrlKey && event.keyCode == 69) {
      event.getCalendarView();
      newProducts();
    }
  });
</script>
<!--
        <p>
        <a href="user.menu.jsp">Home</a> |
        <a href="order.list.jsp">Orders</a> |
        <a href="order.new.jsp">Order</a> |
        <a href="product.list.jsp">Products</a> |
        <a href="product.new.jsp">Product</a> |
        <a href="customer.list.jsp">Customers</a> |
        <a href="customer.new.jsp"><i class="fas fa-plus"></i>Customer</a> |
        <a href="event.list.jsp">Events</a> |
        <a href="event.new.jsp"><i class="fas fa-plus"></i>Event</a> |
        <a href="technician.list.jsp">Technicians</a> |
        <a href="technician.new.jsp"><i class="fas fa-plus"></i>Technician</a> |
        <a href="user.edit.jsp">User <i class="fas fa-cog"></i></a>
      </p>
-->
