<%@ page language="java" import="com.tfnlab.mysql.User,com.tfnlab.mysql.UserDao" %><%

UserDao dao = new UserDao();
String username = request.getParameter("username");
User user = dao.getUserByUsername(username);
if(request.getParameter("Digits")==null){
%><?xml version="1.0" encoding="UTF-8"?>
<Response>
    <Gather action="twilio.jsp" numDigits="1">
        <Say><%=user.getTwilio_voice_message()%></Say>
    </Gather>
    <Say>Sorry, I didn't receive any input. Goodbye!</Say>
</Response>
<%}else if(request.getPayments("Digits").equals("1")){%>
  <Redirect method="GET">
      <Say>You pressed 1, forwarding to sales</Say>
      <Dial><%=user.getTwilio_voice_forward_phone()%></Dial>
  </Redirect>
<%}else if(request.getPayments("Digits").equals("2")){%>
  <Redirect method="GET">
      <Say>You pressed 21, forwarding to support</Say>
      <Dial><%=user.getTwilio_voice_forward_phone()%></Dial>
  </Redirect>
<%}else{%>
  <Redirect method="GET">
      <Say>Invalid option. Goodbye</Say>
  </Redirect>
<%}%>
