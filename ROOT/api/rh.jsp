<%@ page import="com.tfnlab.mysql.User"%>
<%@ page import="com.tfnlab.mysql.UserDao" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Enumeration" %><%
        String apiAction = request.getParameter("apiAction");
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
        if (apiAction != null && apiAction.trim().length() > 0) {
              if(apiAction.equals("signin")){
                      %>apiAction<%
              }
              if(apiAction.equals("register")){
                      %>apiAction<%

              }
        }
%>  
