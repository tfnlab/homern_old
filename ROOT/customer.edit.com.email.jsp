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
<%@ page import="com.tfnlab.business.Email_Manager" %>
<%@ page import="java.util.UUID" %>
<%@ page import="com.tfnlab.mysql.Entity" %>
<%@ page import="com.tfnlab.mysql.EntityDao" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileWriter" %>
<%@ page import="java.io.BufferedWriter" %>
<%@ page import="com.tfnlab.api.con.APIConfig" %><%

UUID uuid = UUID.randomUUID();
int customerId = 0;
String username = (String) session.getAttribute("username");
User usernameOBJ = (User) session.getAttribute("usernameOBJ");
if (request.getParameter("customerId") != null && !request.getParameter("customerId").isEmpty()) {
  customerId = Integer.parseInt(request.getParameter("customerId"));
}
  // Get the content from the query parameter
            APIConfig ac = new APIConfig();


                        Entity entity = new Entity();
                        EntityDao ed = new EntityDao();
                        entity = ed.getEntityById(customerId);
                        Email_Manager eM = new Email_Manager();

            File file = new File(ac.getPdfloc() + uuid.toString() + ".txt");
            FileWriter fw = new FileWriter(file);
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write(entity.getEmail() + "<CONTENT>CustomerEmail<CONTENT>" +request.getParameter("orderCom"));
            bw.close();

              Thread newThread = new Thread(() -> {
                          Process pweb3 = new ProcessBuilder("python3", "/var/lib/tomcat9/webapps/py/sendmail.py", "uuid", uuid.toString()).start();
                          String stderr = IOUtils.toString(pweb3.getErrorStream(), Charset.defaultCharset());
                          String stdout = IOUtils.toString(pweb3.getInputStream(), Charset.defaultCharset());
              });
              newThread.start();
            //eM.sendMail(entity.getEmail(), request.getParameter("subject"), request.getParameter("orderCom"));
%><%=uuid.toString()%> - DONE
