<%@page import="com.itextpdf.kernel.pdf.PdfDocument"%>
<%@page import="com.itextpdf.kernel.pdf.PdfWriter"%>
<%@page import="com.itextpdf.layout.Document"%>
<%@page import="com.itextpdf.layout.element.Paragraph"%>
<%@page import="java.io.FileOutputStream"%>
<%@ page import="com.tfnlab.mysql.OrderDao" %>
<%@ page import="com.tfnlab.business.create_PDF" %>
<%@ page import="java.util.UUID" %>
<%
OrderDao dao = new OrderDao();

UUID uuid = UUID.randomUUID();
int orderId = 0;
String username = (String) session.getAttribute("username");
User usernameOBJ = (User) session.getAttribute("usernameOBJ");
if (request.getParameter("orderId") != null && !request.getParameter("orderId").isEmpty()) {
  orderId = Integer.parseInt(request.getParameter("orderId"));
}
  // Get the content from the query parameter
  Order order = dao.getOrderByOrderId(orderId);
  create_PDF cpdf = new create_PDF();

  cpdf.createPD(uuid + ".pdf", order, request.getParameter("orderCom"))
%>DONE
