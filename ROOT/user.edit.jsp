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

  <!-- Google Fonts -->
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

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center">
    <div class="container d-flex align-items-center">
      <h1 class="logo me-auto"><a href="index.html">HRN</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt=""></a>-->

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a class="nav-link scrollto" href="index.html#hero">Home</a></li>
          <li><a class="nav-link scrollto active" href="avatar.html">Avatar</a></li>
          <li><a class="nav-link scrollto" href="index.html#services">Services</a></li>
          <li><a class="nav-link scrollto " href="index.html#portfolio">Portfolio</a></li>
          <li><a class="nav-link scrollto" href="index.html#team">Team</a></li>
          <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

      <a href="https://forms.gle/vdU9zvFTZJ9eKAsz6" class="get-started-btn scrollto">Get Started</a>
    </div>

  </header><!-- End Header -->

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="index.html">Home</a></li>
          <li>Home</li>
        </ol>
        <h2>User</h2>
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
         dao.updateUser(user);

         session.setAttribute("usernameOBJ", user);
     }

    User usernameOBJ = (User) session.getAttribute("usernameOBJ");
    user = dao.getUserByUsername(username);
    %>
    <!-- ======= Blog Section ======= -->
    <section id="blog" class="blog">
      <div class="container px-4 px-lg-5">
        <h2>User</h2>
        <%@ include file="user.menu.nav.jsp" %>
        <HR>
          <a href="user.edit.logo.jsp" >Upload Logo</a>
        <HR>


        <form method="post" action="user.edit.jsp">
          <form class="form-inline">
            <div class="form-group">
              <label for="orderId" class="mr-2">Business Name:</label>
              <input type="text" class="form-control" id="business_name" name="business_name" value="<%= user.getBusiness_name() %>">
            </div>
          </form>


           <div class="form-group">
              <label for="firstName">First Name</label>
              <input type="text" class="form-control" id="firstName" name="firstName" value="<%= user.getFirstName() %>">
           </div>
           <div class="form-group">
              <label for="middleInitial">Middle Initial</label>
              <input type="text" class="form-control" id="middleInitial" name="middleInitial" value="<%= user.getMiddleInitial() %>">
           </div>
           <div class="form-group">
              <label for="lastName">Last Name</label>
              <input type="text" class="form-control" id="lastName" name="lastName" value="<%= user.getLastName() %>">
           </div>
           <div class="form-group">
              <label for="email">Email</label>
              <input type="email" class="form-control" id="email" name="email" value="<%= user.getEmail() %>">
           </div>
           <div class="form-group">
              <label for="phone">Phone</label>
              <input type="text" class="form-control" id="phone" name="phone" value="<%= user.getPhone() %>">
           </div>
           <div class="form-group">
              <label for="ogId">OG ID</label>
              <input type="text" class="form-control" id="ogId" name="ogId" value="<%= user.getOgId() %>">
           </div>
           <div class="form-group">
              <label for="address">Address</label>
              <input type="text" class="form-control" id="address" name="address" value="<%= user.getAddress() %>" onkeypress="callAC(this)">
           </div>
           <input type="hidden" id="addressaclat" name="addressaclat" value="<%= user.getAddresslat() %>">
           <input type="hidden" id="addressaclng" name="addressaclng" value="<%= user.getAddresslng() %>">
           <div class="form-group">
             <ul id="addressac" name="addressac"></ul>
           </div>
           <%
           String address = usernameOBJ.getAddress();
           if (address != null && !address.isEmpty()) {

             String uAddSpc = usernameOBJ.getAddress().replace(" ", "-");
             String uAddPls = usernameOBJ.getAddress().replace(" ", "+");
             String uAddEnc = URLDecoder.decode(usernameOBJ.getAddress(), "UTF-8");
                   %>
             <div class="form-group">
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

           <div class="form-group">
              <label for="city">City</label>
              <input type="text" class="form-control" id="city" name="city" value="<%= user.getCity() %>">
           </div>
           <div class="form-group">
              <label for="state">State</label>
              <input type="text" class="form-control" id="state" name="state" value="<%= user.getState() %>">
           </div>
           <div class="form-group">
              <label for="zipcode">Zipcode</label>
              <input type="text" class="form-control" id="zipcode" name="zipcode" value="<%= user.getZipcode() %>">
           </div>
           <%
           String businessType = user.getBusiness_type();
           if (businessType == null || businessType.isEmpty()) {
             businessType = "general-contractor";
           }
           %>
           <div class="form-group">
             <label for="business-type">Select a type of business:</label>
             <select class="form-control" id="businesstype" name="businesstype">
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
           <div class="form-group">
           <label for="invoice_terms">Invoice Terms</label><br>
           <textarea class="form-control" id="invoice_terms" name="invoice_terms" rows="5"><%= user.getInvoice_terms() %></textarea>
           </div>

           <div class="form-group">
             <label for="url_website">Website</label>
             <input type="text" class="form-control" id="url_website" name="url_website" value="<%= user.getUrl_website() %>">
           </div>
           <div class="form-group">
             <label for="url_yelp">Yelp</label>
             <input type="text" class="form-control" id="url_yelp" name="url_yelp" value="<%= user.getUrl_yelp() %>">
           </div>
           <div class="form-group">
             <label for="url_google">Google</label>
             <input type="text" class="form-control" id="url_google" name="url_google" value="<%= user.getUrl_google() %>">
           </div>
           <div class="form-group">
             <label for="url_twitter">Twitter</label>
             <input type="text" class="form-control" id="url_twitter" name="url_twitter" value="<%= user.getUrl_twitter() %>">
           </div>
           <div class="form-group">
             <label for="url_tiktok">TikTok</label>
             <input type="text" class="form-control" id="url_tiktok" name="url_tiktok" value="<%= user.getUrl_tiktok() %>">
           </div>
           <div class="form-group">
             <label for="url_snap">Snapchat</label>
             <input type="text" class="form-control" id="url_snap" name="url_snap" value="<%= user.getUrl_snap() %>">
           </div>
           <div class="form-group">
             <label for="url_instagram">Instagram</label>
             <input type="text" class="form-control" id="url_instagram" name="url_instagram" value="<%= user.getUrl_instagram() %>">
           </div>
           <div class="form-group">
             <label for="url_facebook">Facebook</label>
             <input type="text" class="form-control" id="url_facebook" name="url_facebook" value="<%= user.getUrl_facebook() %>">
           </div>
           <div class="form-group">
             <label for="url_facebook">LinkedIn <a href="user.edit.linkedin.jsp"><i class="fas fa-check"></i></a></label>
             <input type="text" class="form-control" id="url_linkedin" name="url_linkedin" >
           </div>
           <div class="form-group">
             <label for="url_facebook">Referred by <a href="user.edit.referred_by.jsp"><i class="fas fa-check"></i></a></label>
             <input type="text" class="form-control" id="referred_by" name="referred_by" value="<%= user.getReferred_by() %>">
           </div>
           <BR>
           <BR>
           <button type="submit" class="btn btn-primary">Submit</button>
           </form>


      </div>

    </section><!-- End Blog Section -->

  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">

    <div class="footer-top">
      <div class="container">
        <div class="row">

          <div class="col-lg-3 col-md-6 footer-contact">
            <h3>Presento<span>.</span></h3>
            <p>
              A108 Adam Street <br>
              New York, NY 535022<br>
              United States <br><br>
              <strong>Phone:</strong> +1 5589 55488 55<br>
              <strong>Email:</strong> info@example.com<br>
            </p>
          </div>

          <div class="col-lg-2 col-md-6 footer-links">
            <h4>Useful Links</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
            </ul>
          </div>

          <div class="col-lg-3 col-md-6 footer-links">
            <h4>Our Services</h4>
            <ul>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
              <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
            </ul>
          </div>

          <div class="col-lg-4 col-md-6 footer-newsletter">
            <h4>Join Our Newsletter</h4>
            <p>
              Sign up to learn more about technology and information management.
            </p>
            <form action="" method="post">
              <input type="email" name="email"><input type="submit" value="Subscribe">
            </form>
          </div>

        </div>
      </div>
    </div>

    <div class="container d-md-flex py-4">

      <div class="me-md-auto text-center text-md-start">
        <div class="copyright">
          &copy; Copyright <strong><span>Presento</span></strong>. All Rights Reserved
        </div>
        <div class="credits">
          <!-- All the links in the footer should remain intact. -->
          <!-- You can delete the links only if you purchased the pro version. -->
          <!-- Licensing information: https://bootstrapmade.com/license/ -->
          <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/presento-bootstrap-corporate-template/ -->
          Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
        </div>
      </div>
      <div class="social-links text-center text-md-end pt-3 pt-md-0">
        <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
        <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
        <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
        <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
        <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
      </div>
    </div>
  </footer><!-- End Footer -->

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
