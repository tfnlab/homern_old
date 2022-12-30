<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tfnlab.mysql.User"%>
<%@ page import="com.tfnlab.mysql.UserDao" %>
<style>
  nav {
    display: flex; /* display links as flex items */
    justify-content: space-between; /* distribute links evenly across the width of the container */
  }

  nav a {
    padding: 0 10px; /* add padding to the left and right of each link */
  }
</style>
<nav>
  <a href="user.menu.jsp"><i class="fas fa-home"></i> Home</a>
  <a href="order.list.jsp"><i class="fas fa-shopping-cart"></i> Orders</a>
  <a href="product.list.jsp"><i class="fas fa-box"></i> Products</a>
  <a href="customer.list.jsp"><i class="fas fa-users"></i> Customers</a>
  <a href="event.list.jsp"><i class="fas fa-calendar"></i> Events</a>
  <a href="technician.list.jsp"><i class="fas fa-wrench"></i> Technicians</a>
  <a href="user.edit.jsp"><i class="fas fa-cog"></i> User Settings</a>
</nav>

<!--
        <p>
        <a href="user.menu.jsp">Home</a> |
        <a href="order.list.jsp">Orders</a> |
        <a href="order.new.jsp">Order</a> |
        <a href="product.list.jsp">Products</a> |
        <a href="product.new.jsp">Product</a> |
        <a href="customer.list.jsp">Customers</a> |
        <a href="customer.new.jsp">Customer</a> |
        <a href="event.list.jsp">Events</a> |
        <a href="event.new.jsp">Event</a> |
        <a href="technician.list.jsp">Technicians</a> |
        <a href="technician.new.jsp">Technician</a> |
        <a href="user.edit.jsp">User <i class="fas fa-cog"></i></a>
      </p>
-->
