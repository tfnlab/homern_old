<%@ page language="java" import="com.tfnlab.mysql.TemplateDao,com.tfnlab.mysql.Template,java.util.UUID,java.lang.Thread,org.apache.commons.io.IOUtils,org.apache.commons.io.output.*,java.nio.charset.Charset,java.io.*,java.util.*,java.awt.image.BufferedImage,javax.imageio.ImageIO,java.io.OutputStream,java.io.FileInputStream,java.io.File"%><%

  String username = (String) session.getAttribute("username");
  UUID uuid = UUID.randomUUID();
  String strRes = "";
  Template tmp = new Template();
		tmp = tmp.createTestTemplate();
    tmp.setId(uuid);
  TemplateDao tD = new TemplateDao();
  tD.addTemplate(tmp);

  if(username!=null && username.length() >1 ){
    Process pweb3 = new ProcessBuilder("python3", "/var/lib/tomcat9/webapps/py/hrn.py", request.getParameter("comType")).start();
    String stderr = IOUtils.toString(pweb3.getErrorStream(), Charset.defaultCharset());
    String stdout = IOUtils.toString(pweb3.getInputStream(), Charset.defaultCharset());
    strRes = stdout;
  }
 %><%= strRes  + " \n  UUID " + uuid %>
