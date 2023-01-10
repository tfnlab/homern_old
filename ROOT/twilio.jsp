<%@ page language="java" import="com.tfnlab.mysql.User,com.tfnlab.mysql.UserDao" %><?xml version="1.0" encoding="UTF-8"?>
<Response><%

UserDao dao = new UserDao();
String username = request.getParameter("username");
User user = dao.getUserByUsername(username);
if(request.getParameter("Digits")==null){
%>
    <Gather action="twilio.jsp" numDigits="1">
        <Say><%=user.getTwilio_voice_message()%></Say>
    </Gather>
    <Say>Sorry, I didn't receive any input. Goodbye!</Say>
<%}else if(request.getParameter("Digits").equals("1")){%>
      <Say>You pressed 1, forwarding to sales</Say>
      <Dial><%=user.getTwilio_voice_forward_phone()%></Dial>
<%}else if(request.getParameter("Digits").equals("2")){%>
      <Say>You pressed 21, forwarding to support</Say>
      <Dial><%=user.getTwilio_voice_forward_phone()%></Dial>
<%}else{%>
      <Say>Invalid option. Goodbye</Say>
<%}%>
</Response>
