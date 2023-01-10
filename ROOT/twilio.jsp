<%@ page language="java" import="com.tfnlab.mysql.User,com.tfnlab.mysql.UserDao" %><%

UserDao dao = new UserDao();
String username = request.getParameter("username");
User user = dao.getUserByUsername(username);

%><?xml version="1.0" encoding="UTF-8"?>
<Response>
    <Gather action="#handle-key-press" numDigits="1">
        <Say><%=user.getTwilio_voice_message()%></Say>
    </Gather>
    <Say>Sorry, I didn't receive any input. Goodbye!</Say>
    <Redirect method="GET">
        <Say>You pressed 1, forwarding to sales</Say>
        <Dial><%=user.getTwilio_voice_forward_phone()%></Dial>
    </Redirect>
    <Redirect method="GET">
        <Say>You pressed 2, forwarding to support</Say>
        <Dial><%=user.getTwilio_voice_forward_phone()%></Dial>
    </Redirect>
    <Redirect method="GET">
        <Say>Invalid option. Goodbye</Say>
    </Redirect>
</Response>
