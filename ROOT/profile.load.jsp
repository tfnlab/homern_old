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

double average_review = reviewDAO.getAverageRatingByTokenId(token_id);
String formatted_average_review = String.format("%.2f", average_review);

%>
<h3>Average Rating <%=formatted_average_review%></h3>
<hr>
<% for (Review review : reviews) { %>
   <%=review.getName()%><BR>
   <%=review.getComment()%><BR>
   <%=review.getRating()%><BR>
   <HR>
<%}%>
