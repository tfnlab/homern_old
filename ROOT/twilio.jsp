<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tfnlab.mysql.User"%>
<%@ page import="com.tfnlab.mysql.UserDao" %>
<%

UserDao dao = new UserDao();
String username = (String) session.getAttribute("username");
User user = dao.getUserByUsername(username);

%>
<?xml version="1.0" encoding="UTF-8"?>
<Response>
    <Say><%=user.getTwilio_voice_message()%></Say>
    <Dial>
        <Number sendDigits="wwww1928">
            <%=user.getPhone()%>
        </Number>
    </Dial>
</Response>
