<%@ page language="java" import="java.util.UUID,java.lang.Thread,org.apache.commons.io.IOUtils,org.apache.commons.io.output.*,java.nio.charset.Charset,java.io.*,java.util.*,java.awt.image.BufferedImage,javax.imageio.ImageIO,java.io.OutputStream,java.io.FileInputStream,java.io.File"%>
<%
  UUID uuid = UUID.randomUUID();
  Process pweb3 = new ProcessBuilder("python3", "/var/lib/tomcat9/webapps/py/hrn.py", request.getParameter("comType")).start();
  String stderr = IOUtils.toString(pweb3.getErrorStream(), Charset.defaultCharset());
  String stdout = IOUtils.toString(pweb3.getInputStream(), Charset.defaultCharset());

 %>
 <%= "UUID " + stdout  + " \n " + uuid %>
