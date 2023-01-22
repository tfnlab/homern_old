<%
String usernameCheck = (String) session.getAttribute("username");
if (usernameCheck == null || usernameCheck.isEmpty() || usernameCheck.length() < 2 ) {
     RequestDispatcher dispatcher = request.getRequestDispatcher("signin.jsp");
     dispatcher.forward(request, response);
}
%>