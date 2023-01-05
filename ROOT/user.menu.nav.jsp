<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tfnlab.mysql.User"%>
<%@ page import="com.tfnlab.mysql.UserDao" %>


<%
  String currentUrl = request.getRequestURL().toString();
%>
<HR>
<style>
select {
  /* Style the select element */
}

option {
  /* Style the option elements */
  background-repeat: no-repeat;  /* Don't repeat the icon */
  background-position: center left;  /* Position the icon */
  padding-left: 20px;  /* Add some space for the icon */
}

option:not([disabled]):not([selected]) {
  background-image: url('data:image/svg+xml;utf8,' + attr(data-icon) + '');
}

select::before {
  content: attr(data-icon);
  /* Style the pseudo-element */
}
</style>
<select>
  <option data-icon="🌞" value="sunny">Sunny</option>
  <option data-icon="🌤" value="partly-cloudy">Partly cloudy</option>
  <option data-icon="⛈️" value="stormy">Stormy</option>
</select>
<HR>
  <li><a href="#"><i class="fa fa-home"></i> Home</a></li>
<HR>
<select name="hrnnavbar" id="hrnnavbar" onchange="goToUrl()" tabindex="1">
  <option value="home"><i class="fa fa-home"></i> Home</option>
  <option value="user.menu.jsp" <%= currentUrl.indexOf("user.menu.jsp") != -1 ? "selected" : "" %> ><i class="fa fa-home"></i> Home</option>
  <option value="dashboard.jsp" <%= currentUrl.indexOf("dashboard.jsp") != -1 ? "selected" : "" %> ><i class="fa fa-cog"></i> Dashboard</option>
  <option value="user.edit.jsp" <%= currentUrl.indexOf("user.edit.jsp") != -1 ? "selected" : "" %> ><i class="fa fa-cog"></i> Marketing</option>
  <option value="technician.list.jsp" <%= currentUrl.indexOf("technician.list.jsp") != -1 ? "selected" : "" %> ><i class="fa fa-wrench"></i> Technicians</option>
  <option value="product.list.jsp" <%= currentUrl.indexOf("product.list.jsp") != -1 ? "selected" : "" %> ><i class="fa fa-box"></i> Products</option>
  <option value="customer.list.jsp" <%= currentUrl.indexOf("customer.list.jsp") != -1 ? "selected" : "" %> ><i class="fa fa-users"></i> Customers</option>
  <option value="order.list.jsp" <%= currentUrl.indexOf("order.list.jsp") != -1 ? "selected" : "" %> ><i class="fa fa-shopping-cart"></i> Orders</option>
  <option value="event.list.jsp" <%= currentUrl.indexOf("event.list.jsp") != -1 ? "selected" : "" %> ><i class="fa fa-calendar"></i> Events</option>
</select>


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
