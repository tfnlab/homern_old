<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>
<%@ page import="com.tfnlab.mysql.Review" %>
<%@ page import="com.tfnlab.mysql.ReviewDAO" %>
<%@ page import="java.util.List" %>
 load reviews from page
<%
String token_id = request.getParameter("token_id");
ReviewDAO reviewDAO = new ReviewDAO();
List<Review> reviews = reviewDAO.getReviewsByTokenId(token_id);

%>



<% for (Review review : reviews) { %>
   <%=review.getName()%>
<%}%>
