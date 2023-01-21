<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tfnlab.mysql.User"%>
<%@ page import="com.tfnlab.mysql.UserDao" %>
<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Home Renovation Nation - Sign-up</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" crossorigin="anonymous" />
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Presento - v3.9.1
  * Template URL: https://bootstrapmade.com/presento-bootstrap-corporate-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>
    function callGeo(sk, fNameLink) {
        document.getElementById(fNameLink.substring(0,fNameLink.length-2)).value = sk;
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
          if (this.readyState == 4 && this.status == 200) {
            let items = this.responseText.split('<ITEM>');
            fNamenew = items[items.length-1];
            fNamenew = removeTrailingSpaces(fNamenew);
            document.getElementById(fNamenew+"lat").value = items[0];
            document.getElementById(fNamenew+"lng").value = items[1];


          }
        };
        const encodedString = encodeURIComponent(sk);
        var urlString = "GeocodingExample.jsp?search=" + encodedString + "&sfor=" + fNameLink;
        xhttp.open("GET", urlString, true);
        xhttp.send();
    }
    function removeTrailingSpaces(str) {
            return str.replace(/\s+$/g, "");
    }
    function callAC(sfor) {
      var xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
          let items = this.responseText.split('<ITEM>');
          fName = items[items.length-1];
          fName = removeTrailingSpaces(fName);
          for (let i = 0; i < items.length-1; i++) {
            if (items[i].length > 5) {
              let newL = "<li>" + "<a href=\"javascript:void(0)\" onclick=\"callGeo('" + items[i] +"' , '" + fName+ "')\" >" + items[i] + "</a>" + "</li>";
              document.getElementById(fName).innerHTML = document.getElementById(fName).innerHTML  + newL;
            }
          }
        }
      };
      let elName = sfor.name + "ac";
      let search = document.getElementById(sfor.name).value;

      if (search.length > 5) {
        document.getElementById(elName).innerHTML = "";
        var urlString = "GoogleAutocomplete.jsp?search=" + search + "&sfor=" + sfor.name;
        xhttp.open("GET", urlString, true);
        xhttp.send();
      }
    }

  </script>
</head>

<body>

    <%@ include file="include.header.jsp" %>

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <ol>
            <li><a href="user.menu.jsp">Home</a></li>
            <li>Service Operations Center</li>
        </ol>
      </div>
    </section><!-- End Breadcrumbs -->
    <%
    UserDao dao = new UserDao();
    String username = (String) session.getAttribute("username");
       String firstName = request.getParameter("firstName");

      User user = new User();
      if (firstName != null && firstName.trim().length() > 0) {
         String middleInitial = request.getParameter("middleInitial");
         String lastName = request.getParameter("lastName");
         String email = request.getParameter("email");
         String phone = request.getParameter("phone");
         String ogId = request.getParameter("ogId");
         String address = request.getParameter("address");
         String city = request.getParameter("city");
         String state = request.getParameter("state");
         String zipcode = request.getParameter("zipcode");
         String addressaclat = request.getParameter("addressaclat");
         String addressaclng = request.getParameter("addressaclng");
         String business_type = request.getParameter("businesstype");
         String business_name = request.getParameter("business_name");
         String invoice_terms = request.getParameter("invoice_terms");
         String url_website = request.getParameter("url_website");
         String url_yelp = request.getParameter("url_yelp");
         String url_google = request.getParameter("url_google");
         String url_twitter = request.getParameter("url_twitter");
         String url_tiktok = request.getParameter("url_tiktok");
         String url_snap = request.getParameter("url_snap");
         String url_instagram = request.getParameter("url_instagram");
         String url_facebook = request.getParameter("url_facebook");
         String url_linkedin = request.getParameter("url_linkedin");
         String token_linkedin = request.getParameter("token_linkedin");
         String token_twitter_c_key = request.getParameter("token_twitter_c_key");
         String token_twitter_c_secret = request.getParameter("token_twitter_c_secret");
         String token_twitter_a = request.getParameter("token_twitter_a");
         String token_twitter_a_secret = request.getParameter("token_twitter_a_secret");
         String api_key = request.getParameter("api_key");
         String twilio_voice_message = request.getParameter("twilio_voice_message");
         String license_no = request.getParameter("license_no");
         String address2 = request.getParameter("address2");
         String twilio_voice_forward_phone = request.getParameter("twilio_voice_forward_phone");
         String stripe_key = request.getParameter("stripe_key");

         email = email.toLowerCase();

         user = dao.getUserByUsername(username);

         user.setFirstName(firstName);
         user.setMiddleInitial(middleInitial);
         user.setLastName(lastName);
         user.setEmail(email);
         user.setPhone(phone);
         user.setOgId(ogId);
         user.setAddress(address);
         user.setCity(city);
         user.setState(state);
         user.setZipcode(zipcode);
         user.setAddresslat(addressaclat);
         user.setAddresslng(addressaclng);
         user.setBusiness_type(business_type);
         user.setBusiness_name(business_name);
         user.setInvoice_terms(invoice_terms);

         user.setUrl_website(url_website);
         user.setUrl_yelp(url_yelp);
         user.setUrl_google(url_google);
         user.setUrl_twitter(url_twitter);
         user.setUrl_tiktok(url_tiktok);
         user.setUrl_snap(url_snap);
         user.setUrl_instagram(url_instagram);
         user.setUrl_facebook(url_facebook);
         user.setUrl_linkedin(url_linkedin);
         user.setToken_linkedin(token_linkedin);
         user.setToken_twitter_c_key(token_twitter_c_key);
         user.setToken_twitter_c_secret(token_twitter_c_secret);
         user.setToken_twitter_a(token_twitter_a);
         user.setToken_twitter_a_secret(token_twitter_a_secret);
         user.setApi_key(api_key);
         user.setTwilio_voice_message(twilio_voice_message);
         user.setLicense_no(license_no);
         user.setAddress2(address2);
         user.setTwilio_voice_forward_phone(twilio_voice_forward_phone);
         user.setStripe_key(stripe_key);
         dao.updateUser(user);

         session.setAttribute("usernameOBJ", user);
     }

    User usernameOBJ = (User) session.getAttribute("usernameOBJ");
    user = dao.getUserByUsername(username);
    %>
    <!-- ======= Blog Section ======= -->
    <section id="blog" class="blog">
      <div class="container px-4 px-lg-5">
        <h2>Marketing</h2>
        <HR>
        <%@ include file="user.menu.nav.jsp" %>

        <script>
          function goToUrlSUB() {
            var select = document.getElementById("hrnnavbarsub");
            var option = select.options[select.selectedIndex];
            var url = option.value;
            window.open(url, "_self");
          }
        </script>
          <HR>
          <select name="hrnnavbarsub" id="hrnnavbarsub" onchange="goToUrlSUB()" tabindex="1">
            <option value="#" >more </option>
            <option value="user.edit.logo.jsp" <%= currentUrl.indexOf("user.edit.referred_by.jsp") != -1 ? "selected" : "" %>><i class="fas fa-home"></i> Logo</option>
            <option value="user.edit.social.jsp" <%= currentUrl.indexOf("user.edit.social.jsp") != -1 ? "selected" : "" %>><i class="fas fa-cog"></i> Social</option>
            <option value="user.edit.referred_by.jsp" <%= currentUrl.indexOf("user.edit.referred_by.jsp") != -1 ? "selected" : "" %>><i class="fas fa-wrench"></i> Referrals</option>
          </select>
          <HR>
        <form method="post" action="user.edit.jsp">
          <div class="form-group mt-3">
            <label for="business_name" class="mr-2">Username:</label>
            <input type="text" class="form-control"  value="<%= user.getUsername() %>" disabled >
          </div>
            <div class="form-group mt-3">
              <label for="business_name" class="mr-2">Business Name:</label>
              <input type="text" class="form-control" id="business_name" name="business_name" value="<%= user.getBusiness_name() %>" tabindex="5" >
            </div>
           <div class="form-group  mt-3">
              <label for="firstName">First Name <a href="user.edit.qr.jsp?qrtype=name"><i class="fas fa-qrcode"></i></a></label>
              <input type="text" class="form-control" id="firstName" name="firstName" value="<%= user.getFirstName() %>"  tabindex="6">
           </div>
           <div class="form-group mt-3">
              <label for="middleInitial">Middle Initial</label>
              <input type="text" class="form-control" id="middleInitial" name="middleInitial" value="<%= user.getMiddleInitial() %>"  tabindex="7">
           </div>
           <div class="form-group mt-3">
              <label for="lastName">Last Name</label>
              <input type="text" class="form-control" id="lastName" name="lastName" value="<%= user.getLastName() %>"  tabindex="8">
           </div>
           <div class="form-group mt-3">
              <label for="email">Email</label>
              <input type="email" class="form-control" id="email" name="email" value="<%= user.getEmail() %>"  tabindex="9">
           </div>
           <div class="form-group mt-3">
              <label for="phone">Phone</label>
              <input type="text" class="form-control" id="phone" name="phone" value="<%= user.getPhone() %>"  tabindex="10">
           </div>
           <div class="form-group mt-3">
              <label for="ogId">OG ID</label>
              <input type="text" class="form-control" id="ogId" name="ogId" value="<%= user.getOgId() %>"  tabindex="11">
           </div>
           <div class="form-group mt-3">
              <label for="address">Address</label>
              <input type="text" class="form-control" id="address" name="address" value="<%= user.getAddress() %>" onkeypress="callAC(this)"  tabindex="12">
           </div>
           <input type="hidden" id="addressaclat" name="addressaclat" value="<%= user.getAddresslat() %>">
           <input type="hidden" id="addressaclng" name="addressaclng" value="<%= user.getAddresslng() %>">
           <div class="form-group mt-3">
             <ul id="addressac" name="addressac"></ul>
           </div>
           <%
           String address = usernameOBJ.getAddress();
           if (address != null && !address.isEmpty()) {

             String uAddSpc = usernameOBJ.getAddress().replace(" ", "-");
             String uAddPls = usernameOBJ.getAddress().replace(" ", "+");
             String uAddEnc = URLDecoder.decode(usernameOBJ.getAddress(), "UTF-8");
                   %>
             <div class="form-group mt-3">
               <hr>
               <a href="https://www.google.com/maps/search/?api=1&query=<%=uAddEnc%>">Google</a> |
               <a href="https://maps.apple.com/?address=<%=uAddEnc%>">Apple</a> |
               <a href="https://www.waze.com/en/directions?navigate=yes&latlng=<%=usernameOBJ.getAddresslat()%>,<%=usernameOBJ.getAddresslng()%>">Waze</a> |
               <a href="https://wego.here.com/directions/mix//<%=uAddSpc%>:e-eyJuYW1lIjoiMTMyNSBOLCBMYW1lciBBdmUsIEJ1cmJhaywgQ0EgOTA4NTAiLCJhZGRyZXNzIjoiMTMyNSBOLCBMYW1lciBBdmUsIEJ1cmJhaywgQ0EgOTA4NTAiLCJsYXRpdHVkZSI6MzQuMTgzNjYyLCJsb25naXR1ZGUiOi0xMTguMzI2MTAyfQ==?map=<%=usernameOBJ.getAddresslat()%>,<%=usernameOBJ.getAddresslng()%>,15,normal">HERE</a> |
               <a href="https://www.bing.com/maps?osid=a8d44b60-4f0c-4e4a-b9c7-3a3b3f597628&cp=<%=usernameOBJ.getAddresslat()%>~<%=usernameOBJ.getAddresslng()%>&lvl=15&style=r">Bing</a> |
               <a href="https://www.openstreetmap.org/search?query=<%=uAddEnc%>"#map=15/<%=usernameOBJ.getAddresslat()%>/<%=usernameOBJ.getAddresslng()%>">OSM</a> |
               <a href="https://www.tomtom.com/en_gb/maps/maps/point?lat=<%=usernameOBJ.getAddresslat()%>&lon=<%=usernameOBJ.getAddresslng()%>">TomTom</a>
               <hr>
             </div>

           <%}%>
           <div class="form-group mt-3">
              <label for="city">Address (Suite, Room or Apt) </label>
              <input type="text" class="form-control" id="address2" name="address2" value="<%= user.getAddress2() %>" tabindex="13">
           </div>
           <div class="form-group mt-3">
              <label for="city">City</label>
              <input type="text" class="form-control" id="city" name="city" value="<%= user.getCity() %>" tabindex="13">
           </div>
           <div class="form-group mt-3">
              <label for="state">State</label>
              <input type="text" class="form-control" id="state" name="state" value="<%= user.getState() %>" tabindex="14">
           </div>
           <div class="form-group mt-3">
              <label for="zipcode">Zipcode</label>
              <input type="text" class="form-control" id="zipcode" name="zipcode" value="<%= user.getZipcode() %>" tabindex="15">
           </div>
           <%
           String businessType = user.getBusiness_type();
           if (businessType == null || businessType.isEmpty()) {
             businessType = "general-contractor";
           }
           %>
           <div class="form-group mt-3">
             <label for="business-type">Select a type of business:</label>
             <select class="form-control" id="businesstype" name="businesstype"  tabindex="16">
               <option value="general-contractor" <% if (businessType.equals("general-contractor")) { %>selected<% } %>>General contractor</option>
               <option value="carpenter" <% if (businessType.equals("carpenter")) { %>selected<% } %>>Carpenter</option>
               <option value="plumber" <% if (businessType.equals("plumber")) { %>selected<% } %>>Plumber</option>
               <option value="electrician" <% if (businessType.equals("electrician")) { %>selected<% } %>>Electrician</option>
               <option value="hvac-technician" <% if (businessType.equals("hvac-technician")) { %>selected<% } %>>HVAC technician</option>
               <option value="landscaper" <% if (businessType.equals("landscaper")) { %>selected<% } %>>Landscaper</option>
               <option value="roofing-contractor" <% if (businessType.equals("roofing-contractor")) { %>selected<% } %>>Roofing contractor</option>
               <option value="painter" <% if (businessType.equals("painter")) { %>selected<% } %>>Painter</option>
               <option value="flooring-contractor" <% if (businessType.equals("flooring-contractor")) { %>selected<% } %>>Flooring contractor</option>
             </select>
           </div>
           <div class="form-group mt-3">
           <label for="invoice_terms">Invoice Terms</label><br>
           <textarea class="form-control" id="invoice_terms" name="invoice_terms" rows="5" tabindex="17"><%= user.getInvoice_terms() %></textarea>
           </div>

           <div class="form-group mt-3">
             <label for="url_website">Website <a href="user.edit.qr.jsp?qrtype=website"><i class="fas fa-qrcode"></i></a> </label>
             <input type="text" class="form-control" id="url_website" name="url_website" value="<%= user.getUrl_website() %>"  tabindex="18">
           </div>
           <div class="form-group mt-3">
             <label for="url_yelp">Yelp</label>
             <input type="text" class="form-control" id="url_yelp" name="url_yelp" value="<%= user.getUrl_yelp() %>">
           </div>
           <div class="form-group mt-3">
             <label for="url_google">Google</label>
             <input type="text" class="form-control" id="url_google" name="url_google" value="<%= user.getUrl_google() %>">
           </div>
           <div class="form-group mt-3">
             <label for="url_twitter">Twitter <a href="user.edit.social.jsp"><i class="fas fa-check"></i></a></label>
             <input type="text" class="form-control" id="url_twitter" name="url_twitter" value="<%= user.getUrl_twitter() %>">
           </div>
           <div class="form-group mt-3">
             <label for="url_twitter">Client Key</label>
             <input type="text" class="form-control" id="token_twitter_c_key" name="token_twitter_c_key" value="<%= user.getToken_twitter_c_key() %>">
           </div>
           <div class="form-group mt-3">
             <label for="url_twitter">Client Secret</label>
             <input type="text" class="form-control" id="token_twitter_c_secret" name="token_twitter_c_secret" value="<%= user.getToken_twitter_c_secret() %>">
           </div>
           <div class="form-group mt-3">
             <label for="url_twitter">Access Token Key</label>
             <input type="text" class="form-control" id="token_twitter_a" name="token_twitter_a" value="<%= user.getToken_twitter_a() %>">
           </div>
           <div class="form-group mt-3">
             <label for="url_twitter">Access Token Secret</label>
             <input type="text" class="form-control" id="token_twitter_a_secret" name="token_twitter_a_secret" value="<%= user.getToken_twitter_a_secret() %>">
           </div>
           <div class="form-group mt-3">
             <label for="url_tiktok">TikTok</label>
             <input type="text" class="form-control" id="url_tiktok" name="url_tiktok" value="<%= user.getUrl_tiktok() %>">
           </div>
           <div class="form-group mt-3">
             <label for="url_snap">Snapchat</label>
             <input type="text" class="form-control" id="url_snap" name="url_snap" value="<%= user.getUrl_snap() %>">
           </div>
           <div class="form-group mt-3">
             <label for="url_instagram">Instagram</label>
             <input type="text" class="form-control" id="url_instagram" name="url_instagram" value="<%= user.getUrl_instagram() %>">
           </div>
           <div class="form-group mt-3">
             <label for="url_facebook">Facebook</label>
             <input type="text" class="form-control" id="url_facebook" name="url_facebook" value="<%= user.getUrl_facebook() %>">
           </div>
           <div class="form-group mt-3">
             <label for="url_facebook">LinkedIn <a href="user.edit.social.jsp"><i class="fas fa-check"></i></a></label>
             <input type="text" class="form-control" id="url_linkedin" name="url_linkedin" value="<%= user.getUrl_linkedin()%>">
           </div>
           <div class="form-group mt-3">
             <label for="url_facebook">LinkedIn Access Code</label>
             <input type="text" class="form-control" id="token_linkedin" name="token_linkedin" value="<%= user.getToken_linkedin()%>">
           </div>
           <div class="form-group mt-3">
             <label for="referred_by">Referred by <a href="user.edit.referred_by.jsp"><i class="fas fa-check"></i></a></label>
             <input type="text" class="form-control" id="referred_by" name="referred_by" value="<%= user.getReferred_by() %>">
           </div>
           <div class="form-group mt-3">
             <label for="api_key">Website Api Key</label>
             <input type="text" class="form-control" id="api_key" name="api_key" value="<%= user.getApi_key() %>">
           </div>
           <div class="form-group mt-3">
             <label for="twilio_voice_message">Twilio Voice Message</label>
             <input type="text" class="form-control" id="twilio_voice_message" name="twilio_voice_message" value="<%= user.getTwilio_voice_message() %>">
           </div>

           <div class="form-group mt-3">
           <label for="license_no" class="mr-2">License No:</label>
           <input type="text" class="form-control" id="license_no" name="license_no" value="<%= user.getLicense_no() %>" tabindex="20" >
           </div>

           <div class="form-group mt-3">
           <label for="twilio_voice_forward_phone" class="mr-2">Twilio Voice Forward Phone:</label>
           <input type="text" class="form-control" id="twilio_voice_forward_phone" name="twilio_voice_forward_phone" value="<%= user.getTwilio_voice_forward_phone() %>" tabindex="20" >
           </div>
           <div class="form-group mt-3">
           <label for="stripe_key" class="mr-2">Stripe Key:</label>
           <input type="text" class="form-control" id="stripe_key" name="stripe_key" value="<%= user.getStripe_key() %>" tabindex="20" >
           </div>
           <div class="form-group mt-3">
             <button type="submit" class="btn btn-primary" tabindex="21">Submit</button>
           </div>
           </form>


      </div>

    </section><!-- End Blog Section -->

  </main><!-- End #main -->


      <%@ include file="include.footer.jsp" %>

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>
