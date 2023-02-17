<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.tfnlab.mysql.Review" %>
<%@ page import="com.tfnlab.mysql.ReviewDAO" %>

<%
  String name = request.getParameter("name");
  String email = request.getParameter("email");
  boolean success = true;

  if (success) {
%>
    <p>Review submitted successfully!</p>
<%
  } else {
%>
    <p>There was an error submitting your review.</p>
<%
  }
%>
