<%@page import="com.itextpdf.kernel.pdf.PdfDocument"%>
<%@page import="com.itextpdf.kernel.pdf.PdfWriter"%>
<%@page import="com.itextpdf.layout.Document"%>
<%@page import="com.itextpdf.layout.element.Paragraph"%>
<%@page import="java.io.FileOutputStream"%>
<%@ page import="com.tfnlab.mysql.Order" %>
<%@ page import="com.tfnlab.mysql.OrderDao" %>
<%@ page import="com.tfnlab.mysql.User"%>
<%@ page import="com.tfnlab.mysql.UserDao" %>
<%@ page import="com.tfnlab.business.Create_PDF" %>
<%@ page import="java.util.UUID" %>
<%@ page import="com.tfnlab.mysql.Entity" %>
<%@ page import="com.tfnlab.mysql.EntityDao" %>
<%@ page import="com.tfnlab.api.con.APIConfig" %><%
OrderDao dao = new OrderDao();

UUID uuid = UUID.randomUUID();
int customerId = 0;
String username = (String) session.getAttribute("username");
User usernameOBJ = (User) session.getAttribute("usernameOBJ");
if (request.getParameter("customerId") != null && !request.getParameter("customerId").isEmpty()) {
  customerId = Integer.parseInt(request.getParameter("customerId"));
}
  // Get the content from the query parameter

            Entity entity = new Entity();
            EntityDao ed = new EntityDao();


              entity = ed.getEntityById(customerId);
  create_PDF cpdf = new create_PDF();

  cpdf.createPD(uuid + ".pdf", entity, request.getParameter("orderCom"));
%>DONE

<%
  APIConfig conf = new APIConfig();
  String filename = uuid + ".pdf";
  String filepath = conf.getPdfloc();
  response.setContentType("APPLICATION/OCTET-STREAM");
  response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");

  java.io.FileInputStream fileInputStream=new java.io.FileInputStream(filepath + filename);

  int i;
  while ((i=fileInputStream.read()) != -1) {
    out.write(i);
  }
  fileInputStream.close();
%>
