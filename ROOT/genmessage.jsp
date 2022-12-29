<%@ page language="java" import="com.tfnlab.mysql.Entity,com.tfnlab.mysql.EntityDao,com.tfnlab.mysql.Order,com.tfnlab.mysql.OrderDao,com.tfnlab.mysql.User,com.tfnlab.mysql.TemplateDao,com.tfnlab.mysql.Template,java.util.UUID,java.lang.Thread,org.apache.commons.io.IOUtils,org.apache.commons.io.output.*,java.nio.charset.Charset,java.io.*,java.util.*,java.awt.image.BufferedImage,javax.imageio.ImageIO,java.io.OutputStream,java.io.FileInputStream,java.io.File"%><%



  String username = (String) session.getAttribute("username");
  UUID uuid = UUID.randomUUID();
  String strRes = "";
  Template tmp = new Template();
		tmp = tmp.createTestTemplate();
  //  tmp.setId(uuid);
  TemplateDao tD = new TemplateDao();
  User usernameOBJ = (User) session.getAttribute("usernameOBJ");

  if(username!=null && username.length() >1 ){
    String messageName = "";
    int orderId = 0;
    if (request.getParameter("orderId") != null && !request.getParameter("orderId").isEmpty()) {
      orderId = Integer.parseInt(request.getParameter("orderId"));
    }
    int customerId = 0;
    if (request.getParameter("customerId") != null && !request.getParameter("customerId").isEmpty()) {
      customerId = Integer.parseInt(request.getParameter("customerId"));
    }
    if(orderId >0){
      OrderDao dao = new OrderDao();
      Order order = dao.getOrderByOrderId(orderId);
      messageName = order.getOrderName();
    }
    if(customerId>0){
      Entity entity = new Entity();
      EntityDao ed = new EntityDao();
        entity = ed.getEntityById(customerId);
        messageName = entity.getFirstName();
    }
//    String agm =   request.getParameter("comType") + " message for my "+ usernameOBJ.getBusiness_name() + " company, the person sending the message is named  " + usernameOBJ.getFirstName() + " " + usernameOBJ.getLastName() + ", The project or person name is " + messageName;
    String agm =   request.getParameter("comType") + " message from my business named '"+ usernameOBJ.getBusiness_name() + "', this message is from  person named '" + usernameOBJ.getFirstName() + " " + usernameOBJ.getLastName() + "', the message is for a customer named '" + messageName + "'";
    if(orderId==0 && customerId ==0){
      agm =   request.getParameter("comType") + " message from my business named '"+ usernameOBJ.getBusiness_name() + "', this message is from  person named '" + usernameOBJ.getFirstName() + " " + usernameOBJ.getLastName();
    }
    Process pweb3 = new ProcessBuilder("python3", "/var/lib/tomcat9/webapps/py/hrn.py", agm).start();
    String stderr = IOUtils.toString(pweb3.getErrorStream(), Charset.defaultCharset());
    String stdout = IOUtils.toString(pweb3.getInputStream(), Charset.defaultCharset());
    strRes = stdout;
//    tmp.tmp.setMessage(null)
    tmp.setMessage(strRes);
    tmp.setSubject(request.getParameter("comType"));
    tmp.setUsername(username);
    tmp.setActive(false);
    tmp.setPublic(false);
    tD.addTemplate(tmp);
  }
 %><%= strRes %>
