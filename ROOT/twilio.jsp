<%@ page language="java" import="com.tfnlab.mysql.User,com.tfnlab.mysql.UserDao,java.lang.Thread,org.apache.commons.io.IOUtils,org.apache.commons.io.output.*,java.nio.charset.Charset,java.io.*,java.util.*,java.awt.image.BufferedImage,javax.imageio.ImageIO,java.io.OutputStream,java.io.FileInputStream,java.io.File"%>
<%@ page import="java.io.FileOutputStream"%>
<%@ page import="com.tfnlab.mysql.Order" %>
<%@ page import="com.tfnlab.mysql.OrderDao" %>
<%@ page import="com.tfnlab.business.Email_Manager" %>
<%@ page import="java.util.UUID" %>
<%@ page import="com.tfnlab.mysql.Entity" %>
<%@ page import="com.tfnlab.mysql.EntityDao" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.FileWriter" %>
<%@ page import="java.io.BufferedWriter" %>
<%@ page import="com.tfnlab.api.con.APIConfig" %><?xml version="1.0" encoding="UTF-8"?>
<Response><%

UserDao dao = new UserDao();
String username = request.getParameter("username");
User user = dao.getUserByUsername(username);
String digits = request.getParameter("Digits");

try{
      File file = new File(ac.getPdfloc() + uuid.toString() + ".txt");
      FileWriter fw = new FileWriter(file);
      BufferedWriter bw = new BufferedWriter(fw);
      bw.write(user.getTwilio_voice_forward_phone()+ "<CONTENT>" + request.getParameter("From") + "<CONTENT>call for " + request.getParameter("username") +  " From " + request.getParameter("From"));
      bw.close();

      Process pweb3 = new ProcessBuilder("python3", "/var/lib/tomcat9/webapps/py/smssend.py", uuid.toString(), uuid.toString()).start();
      String stderr = IOUtils.toString(pweb3.getErrorStream(), Charset.defaultCharset());
      String stdout = IOUtils.toString(pweb3.getInputStream(), Charset.defaultCharset());
      rm = stdout + stderr + " TEST ";
}catch(IOException ex){
      rm = ex.getMessage();
}

if(digits==null){%>
    <Gather action="twilio.jsp?username=<%=request.getParameter("username")%>" numDigits="1">
        <Say><%=user.getTwilio_voice_message()%></Say>
    </Gather>
    <Say>Sorry, I didn't receive any input. Goodbye!</Say>
<%} %>
<%if(digits!=null){%>
    <%if(digits.equals("1")){%>
      <Say>You pressed 1, forwarding to sales</Say>
      <Dial>
        <Number><%=user.getTwilio_voice_forward_phone()%></Number>
      </Dial>
    <%}%>
    <%if(digits.equals("2")){%>
      <Say>You pressed 2, forwarding to support</Say>
      <Dial>
        <Number><%=user.getTwilio_voice_forward_phone()%></Number>
      </Dial>
    <%}%>
    <%if(!digits.equals("2") && !digits.equals("1")){%>
      <Say>Invalid option. Goodbye</Say>
    <%}%>
<%}%>
</Response>
