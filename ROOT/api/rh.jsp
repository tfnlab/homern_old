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
                      Entity entity = mferDao.signinMotherFucker(customerId, api_key, username, password);
                      %>apiAction
                          <%=entity.getEmail()%>
                      <%
              }
              if(apiAction.equals("signup")){
                      MotherfuckerDao mferDao = new MotherfuckerDao();
                      String customerId = request.getParameter("customerId");
                      String api_key = request.getParameter("api_key");
                      Entity entity = new Entity();
                      entity = entity.generateSampleEntity();
//                      entity.setId(Integer.parseInt(request.getParameter("id")));
                      entity.setUsername(customerId);
                      entity.setFirstName(request.getParameter("firstName"));
                      entity.setLastName(request.getParameter("lastName"));
                      entity.setEmail(request.getParameter("email"));
                      entity.setPhone(request.getParameter("phone"));
                      entity.setAddress(request.getParameter("address"));
                      entity.setCity(request.getParameter("city"));
                      entity.setState(request.getParameter("state"));
                      entity.setZipcode(request.getParameter("zipcode"));
                      entity.setCountry(request.getParameter("country"));
                      entity.setUsername_entity(request.getParameter("username"));
                      entity.setPassword(request.getParameter("password"));

                      entity = mferDao.signupMotherFucker(customerId, api_key, entity);

                      %>apiAction

                        <%=entity.getId()%>
                      <%

              }
        }
%>
