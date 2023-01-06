<%@ page language="java" import="com.tfnlab.mysql.User,com.tfnlab.mysql.UserDao" %><%

UserDao dao = new UserDao();
String username = request.getParameter("username");
User user = dao.getUserByUsername(username);

%><?xml version="1.0" encoding="UTF-8"?>
<Response>
    <Say><%=user.getTwilio_voice_message()%></Say>
    <Dial>
        <Number sendDigits="wwww1928">
            <%=user.getPhone()%>
        </Number>
    </Dial>
</Response>
