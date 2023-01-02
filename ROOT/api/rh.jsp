<%@ page import="com.tfnlab.mysql.User"%>
<%@ page import="com.tfnlab.mysql.UserDao" %>
<%@ page import="com.tfnlab.mysql.Entity" %>
<%@ page import="com.tfnlab.business.MotherfuckerDao" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Enumeration" %><%
        String apiAction = request.getParameter("apiAction");
        if (apiAction != null && apiAction.trim().length() > 0) {
              if(apiAction.equals("signin")){
                      MotherfuckerDao mferDao = new MotherfuckerDao();
                      String customerId = request.getParameter("customerId");
                      String api_key = request.getParameter("api_key");
                      String username = request.getParameter("username");
                      String password = request.getParameter("password");
                      Entity entity = mferDao.getMotherFucker(customerId, api_key, username, password);
                      %>apiAction
                          <%=entity.getEmail()%>
                      <%
              }
              if(apiAction.equals("register")){
                      %>apiAction<%

              }
        }
%>
