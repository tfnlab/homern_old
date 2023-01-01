<%@ page import="com.tfnlab.mysql.User"%>
<%@ page import="com.tfnlab.mysql.UserDao" %>

        <%
        String firstName = request.getParameter("firstName");
        String middleInitial = request.getParameter("middleInitial");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String ogId = request.getParameter("ogId");
        String address = request.getParameter("address");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String zipcode = request.getParameter("zipcode");
        String business_type = request.getParameter("business_type");
        String url_website = request.getParameter("url_website");
        String url_yelp = request.getParameter("url_yelp");
        String url_google = request.getParameter("url_google");
        String url_twitter = request.getParameter("url_twitter");
        String url_tiktok = request.getParameter("url_tiktok");
        String url_snap = request.getParameter("url_snap");
        String url_instagram = request.getParameter("url_instagram");
        String url_facebook = request.getParameter("url_facebook");
        String referred_by = request.getParameter("referred_by");

                // Validate form data
                if (username != null && username.trim().length() > 0) {
                  username = username.toLowerCase();
                  User user = new User(firstName, middleInitial, lastName, email, phone, username, password, ogId, address, city, state, zipcode, "0", "0", business_type, "", "", url_website, url_yelp, url_google, url_twitter, url_tiktok, url_snap, url_instagram, url_facebook, referred_by, "url_linkedin", "token_linkedin", "token_twitter_c_key", "token_twitter_c_secret", "token_twitter_a", "token_twitter_a_secret");
                  UserDao dao = new UserDao();
                  try {
                      boolean pv = true;
                      String um = "Thank you for signing in";
                      if (username == null || username.isEmpty()) {
                        pv = false;
                        um  = "Username can't be Empty";
                      }
                      if (password == null || password.isEmpty()) {
                        pv = false;
                        um  = "Password can't be Empty";
                      }

                      if(pv){
                        pv = dao.loginUser(user);
                      }
                        if(pv){
                          um  = "Thank you for signing in! You are now able to access the main menu. Simply click 'Next' to proceed.";
                          user = dao.getUserByUsername(username);
                          session.setAttribute("username", username);
                          session.setAttribute("usernameOBJ", user);
                        }else{
                          um  = "Unable to Login, you are NOT signed in";
                        }
                        %>
                        <p>
                          <%=um%>
                          <%
                          if(pv){
                          %>
                            <BR>
                            <BR>
                            <HR>
                            <%if(user.getBusiness_type().equals("home-owner")){%>
                              <a href="https://homerenovationnation.com/customer/user.menu.jsp">NEXT</a>
                            <%}else{%>
                              <a href="https://homerenovationnation.com/user.menu.jsp">NEXT</a>
                            <%}%>
                            <HR>
                          <%
                          }
                          %>
                        </p>
                        <%

                  } catch (Exception e) {
                      %><%="An error occurred: " + e.getMessage()%><%
                  }

                }
                %> YOU GOT IT 
