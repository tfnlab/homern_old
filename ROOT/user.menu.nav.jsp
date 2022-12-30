<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tfnlab.mysql.User"%>
<%@ page import="com.tfnlab.mysql.UserDao" %>
<script>
  function goToUrl() {
    var select = document.getElementById("navbar");
    var option = select.options[select.selectedIndex];
    var url = option.value;
    window.location.href = url;
  }
  document.getElementById("navbar").addEventListener("change", goToUrl);
</script>

<select id="navbar" class="navbar order-last order-lg-0">
  <option value="user.menu.jsp"><i class="fas fa-home"></i> Home</option>
  <option value="user.edit.jsp"><i class="fas fa-cog"></i> Marketing</option>
  <option value="technician.list.jsp"><i class="fas fa-wrench"></i> Technicians</option>
  <option value="product.list.jsp"><i class="fas fa-box"></i> Products</option>
  <option value="customer.list.jsp"><i class="fas fa-users"></i> Customers</option>
  <option value="order.list.jsp"><i class="fas fa-shopping-cart"></i> Orders</option>
  <option value="event.list.jsp"><i class="fas fa-calendar"></i> Events</option>
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
