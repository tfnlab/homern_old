<%@ page import="com.tfnlab.mysql.User"%>
<%@ page import="com.tfnlab.mysql.UserDao" %>
<%@ page import="com.tfnlab.mysql.Entity" %>
<%@ page import="com.tfnlab.business.MotherfuckerDao" %>
<%@ page import="com.tfnlab.business.MFOrder" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.math.BigDecimal" %>

<%@ page import="com.tfnlab.mysql.Technician" %>
<%@ page import="com.tfnlab.mysql.TechnicianDao" %>
<%@ page import="com.tfnlab.mysql.OrderTechniciansDAO" %>
<%@ page import="com.tfnlab.mysql.Event" %>
<%@ page import="com.tfnlab.mysql.EventDao" %>

<%@ page import="com.tfnlab.mysql.OrderTechnicians" %>
<%@ page import="com.tfnlab.mysql.ProductLineItem" %>
<%@ page import="com.tfnlab.mysql.OrderCustomer" %>
<%@ page import="java.util.Enumeration" %><%
        String apiAction = request.getParameter("apiAction");
        if (apiAction != null && apiAction.trim().length() > 0) {
           try{
              if(apiAction.equals("signin")){
                      MotherfuckerDao mferDao = new MotherfuckerDao();
                      String customerId = request.getParameter("customerId");
                      String api_key = request.getParameter("api_key");
                      String username = request.getParameter("username");
                      String password = request.getParameter("password");
                      Entity entity = mferDao.signinMotherFucker(customerId, api_key, username, password);
                      %>

                      First Name: <%= entity.getFirstName() %><br>
                      Last Name: <%= entity.getLastName() %><br>
                      Address: <%= entity.getAddress() %><br>
                      Phone: <%= entity.getPhone() %><br>
                      Email: <%= entity.getEmail() %><br>
                      <HR>
                      <a href="orders.jsp" >Get Orders</a>

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
                      if(entity!=null){
                      %>
                        <a href="signin.jsp" >Login</a>
                      <%
                      }else{
                        %>Unable to Sign Up<%
                      }

              }
              if(apiAction.equals("getOrders")){
                  MotherfuckerDao mferDao = new MotherfuckerDao();
                  String customerId = request.getParameter("customerId");
                  String api_key = request.getParameter("api_key");
                  String username = request.getParameter("username");
                  String password = request.getParameter("password");

                  Entity entity = mferDao.signinMotherFucker(customerId, api_key, username, password);
                          %>

                          First Name: <%= entity.getFirstName() %><br>
                          Last Name: <%= entity.getLastName() %><br>
                          Address: <%= entity.getAddress() %><br>
                          Phone: <%= entity.getPhone() %><br>
                          Email: <%= entity.getEmail() %><br>
                          <HR>
                          <a href="orders.jsp" >Get Orders</a>
                          <HR>
                          <%

                  List<OrderCustomer> ocList= mferDao.getOrders(customerId, api_key, username, password);

                      for (OrderCustomer ocItem : ocList) {
                        %>
                         Order ID:
                         <a href="order.jsp?orderId=<%= ocItem.getOrder().getOrderId() %>" > <%= ocItem.getOrder().getOrderId() %></a><br>
                         Name: <%= ocItem.getOrder().getOrderName() %><br>
                         Description: <%= ocItem.getOrder().getOrderDescription() %><br>
                         <hr>
                         <%
                      }
                      if (ocList.isEmpty()) {
                        %>
                        <p>Sorry, we could not find any projects matching your criteria.</p>
                        <p>You may want to try modifying your search parameters or creating a new project.</p>
                        <p><a href="order.new.jsp" class="btn btn-primary" >Create a new project</a></p>
                        <%
                      }


              }
              if(apiAction.equals("getOrder")){
                MotherfuckerDao mferDao = new MotherfuckerDao();
                String customerId = request.getParameter("customerId");
                String api_key = request.getParameter("api_key");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                int orderId = 0;
                if (request.getParameter("orderId") != null && !request.getParameter("orderId").isEmpty()) {
                  orderId = Integer.parseInt(request.getParameter("orderId"));
                }

                Entity entity = mferDao.signinMotherFucker(customerId, api_key, username, password);
                        %>
                        First Name: <%= entity.getFirstName() %><br>
                        Last Name: <%= entity.getLastName() %><br>
                        Address: <%= entity.getAddress() %><br>
                        Phone: <%= entity.getPhone() %><br>
                        Email: <%= entity.getEmail() %><br>
                        <HR>
                        <a href="orders.jsp" >Get Orders</a>
                        <HR>
                        <%
                            MFOrder mfo =  mferDao.getOrder(customerId, api_key, username, password, orderId);
                            List<ProductLineItem> pliList = mfo.getPlItems();
                            BigDecimal invTotal  = new BigDecimal("0");
                            for (ProductLineItem plItem : pliList) {
                                   invTotal = invTotal.add(plItem.getTotal());
                           %>
                               Tech Name: <%= plItem.getName() %><br>
                               Tech Description: <%= plItem.getDescription() %><br>
                               Tech Units: <%= plItem.getQuantity() %><br>
                               Tech Price: <%= plItem.getPrice() %><br>
                               Tech Price: <%= plItem.getTotal() %><br>
                               <hr>

                        <%
                            }
                        %>
                        <HR>
                              <%
                                EventDao evd = new EventDao();
                                TechnicianDao technicianDao = new TechnicianDao();

                                HashMap<Integer, Event> eMap = new HashMap<>();
                                HashMap<Integer, Technician> tMap = new HashMap<>();
                                if(lI.size()>0){
                                    eMap = evd.getEventsByUsernameMap(username);
                                    tMap = technicianDao.getTechniciansByUsernameMap(username);
                                }
                              %>
                        <%
                            List<OrderTechnicians> lI = mfo.getOcItems();
                            for (OrderTechnicians technician : lI) {
                        %>
                               ID: <%= technician.getId() %><br>
                               Tech ID: <%= technician.getTechnicianId() %><br>
                               <%=tMap.get(Integer.valueOf(technician.getTechnicianId())).getTechnicianName() %>
                               -- <BR>
                               <%=eMap.get(Integer.valueOf(technician.getEventId())).getTitle() %>
                               -- <a href="order.edit.schedule.jsp?orderId=<%=orderId%>&tlid=<%= technician.getId() %>" >remove<a><br>
                               <hr>

                        <%
                            }
                        %>
                        <%


              }
          }catch(Exception ex){
                %><%=request.getParameter("api_key")%><%
                %><%=request.getParameter("customerId")%><%
                %>EXCEPTION RAISED : <%=ex.getMessage()%><%
          }
        }
%>
