<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tfnlab.mysql.User"%>
<%@ page import="com.tfnlab.mysql.UserDao" %>
<style>
  select#navbar option::before {
    font-family: "Font Awesome 5 Free";
    content: attr(data-icon);
    margin-right: 10px;
  }
</style>
<select id="navbar" class="navbar order-last order-lg-0">
  <option value="user.menu.jsp" data-icon="&#xf015;">Home</option>
  <option value="user.edit.jsp" data-icon="&#xf013;">Marketing</option>
  <option value="technician.list.jsp" data-icon="&#xf0ad;">Technicians</option>
  <option value="product.list.jsp" data-icon="&#xf187;">Products</option>
  <option value="customer.list.jsp" data-icon="&#xf0c0;">Customers</option>
  <option value="order.list.jsp" data-icon="&#xf07a;">Orders</option>
  <option value="event.list.jsp" data-icon="&#xf073;">Events</option>
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
