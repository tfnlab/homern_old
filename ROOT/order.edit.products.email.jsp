<%@ page language="java" import="java.lang.Thread,org.apache.commons.io.IOUtils,org.apache.commons.io.output.*,java.nio.charset.Charset,java.io.*,java.util.*,java.awt.image.BufferedImage,javax.imageio.ImageIO,java.io.OutputStream,java.io.FileInputStream,java.io.File"%>
<%@page import="com.itextpdf.kernel.pdf.PdfDocument"%>
<%@page import="com.itextpdf.kernel.pdf.PdfWriter"%>
<%@page import="com.itextpdf.layout.Document"%>
<%@page import="com.itextpdf.layout.element.Paragraph"%>
<%@page import="java.io.FileOutputStream"%>
<%@ page import="com.tfnlab.mysql.Order" %>
<%@ page import="com.tfnlab.mysql.OrderDao" %>
<%@ page import="com.tfnlab.mysql.User"%>
<%@ page import="com.tfnlab.mysql.UserDao" %>
<%@ page import="com.tfnlab.business.CreateInvoice" %>
<%@ page import="java.util.UUID" %>
<%@ page import="com.tfnlab.mysql.PaymentPostDao" %>
<%@ page import="com.tfnlab.api.con.APIConfig" %><%
OrderDao dao = new OrderDao();

UUID uuid = UUID.randomUUID();
int orderId = 0;
String username = (String) session.getAttribute("username");
User usernameOBJ = (User) session.getAttribute("usernameOBJ");
if (request.getParameter("orderId") != null && !request.getParameter("orderId").isEmpty()) {
  orderId = Integer.parseInt(request.getParameter("orderId"));
}
  // Get the content from the query parameter
  Order order = dao.getOrderByOrderId(orderId, username);
  CreateInvoice cpdf = new CreateInvoice();

  cpdf.createPD(uuid + ".pdf", order, request.getParameter("type"));
%>DONE

<%
  APIConfig conf = new APIConfig();
  String filename = uuid + ".pdf";
  String filepath = conf.getPdfloc();
  filepath + filename;


UUID uuid = UUID.randomUUID();
String rm = "";
  // Get the content from the query parameter
            APIConfig ac = new APIConfig();


                        Entity entity = new Entity();
                        EntityDao ed = new EntityDao();
                        entity = ed.getEntityById(customerId, username);
                        try{
                              File file = new File(ac.getPdfloc() + uuid.toString() + ".txt");
                              FileWriter fw = new FileWriter(file);
                              BufferedWriter bw = new BufferedWriter(fw);
                              bw.write(entity.getEmail() + "<CONTENT>" + request.getParameter("sub") + "<CONTENT>" +request.getParameter("com")+ "<CONTENT>" + usernameOBJ.getSendgrid_email());
                              bw.close();

                              Process pweb3 = new ProcessBuilder("python3", "/var/lib/tomcat9/webapps/py/sendmail.py", uuid.toString(), usernameOBJ.getSendgrid_key()).start();
                              String stderr = IOUtils.toString(pweb3.getErrorStream(), Charset.defaultCharset());
                              String stdout = IOUtils.toString(pweb3.getInputStream(), Charset.defaultCharset());
                              rm = stdout + stderr + " TEST ";
                          }catch(IOException ex){
                              rm = ex.getMessage();
                          }
            //eM.sendMail(entity.getEmail(), request.getParameter("subject"), request.getParameter("orderCom"));
%>TEST UPDATE : <%=uuid.toString()%> - DONE <%=rm%>

