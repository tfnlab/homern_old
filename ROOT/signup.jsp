<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tfnlab.mysql.User"%>
<%@ page import="com.tfnlab.mysql.UserDao" %>
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
    function callTFNLab() {
      var xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
          document.getElementById("status").innerHTML = this.responseText;
          const el = document.createElement('textarea');
          el.value =  this.responseText;
          el.setAttribute('readonly', '');
          el.style.position = 'absolute';
          el.style.left = '-9999px';
          document.body.appendChild(el);
          el.select();
          document.execCommand('copy');
          document.body.removeChild(el);

        }
      };
      var urlString = "gennft.jsp?walletid=" + document.getElementById("walletid").value
      document.getElementById("start").style.display="none";
      document.getElementById("status").innerHTML = "Started Avatar Generation, give it a minute. <img src=\"assets/img/wait.gif\" />";
      xhttp.open("GET", urlString, true);
      xhttp.send();
    }

    function callCopy() {
      const el = document.createElement('textarea');
      el.value =  document.getElementById("status").innerHTML;
      el.setAttribute('readonly', '');
      el.style.position = 'absolute';
      el.style.left = '-9999px';
      document.body.appendChild(el);
      el.select();
      document.execCommand('copy');
      document.body.removeChild(el);
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
          <li><a class="nav-link scrollto" href="tel:8669325118">(866) 932-5118</a></li>
          <li><a class="nav-link scrollto" href="index.html#hero">Home</a></li>
          <li><a class="nav-link scrollto" href="index.html#services">Services</a></li>
          <li><a class="nav-link scrollto" href="index.html#portfolio">Portfolio</a></li>
          <li><a class="nav-link scrollto" href="index.html#team">Team</a></li>
          <li><a class="nav-link scrollto" href="index.html#contact">Contact</a></li>
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

      <a href="signin.jsp" class="get-started-btn scrollto">Sign-In</a>
    </div>
  </header><!-- End Header -->

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="index.html">Home</a></li>
          <li>Sign-up</li>
        </ol>
        <h2>Sign-up</h2>
      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Blog Section ======= -->
    <section id="blog" class="blog">
      <div class="container px-4 px-lg-5">
        <h2>Sign-Up</h2>
        <%
                String firstName = request.getParameter("firstName");
                String middleInitial = request.getParameter("middleInitial");
                String lastName = request.getParameter("lastName");
                String email = request.getParameter("email");
                String phone = request.getParameter("phone");
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                String ogId = "odId";
                String address = request.getParameter("address");
                String city = request.getParameter("city");
                String state = request.getParameter("state");
                String zipcode = request.getParameter("zipcode");
                String addressaclat = "0";
                String addressaclng = "0";
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
                if (firstName != null && firstName.trim().length() > 0) {
                  username = username.toLowerCase();
                  email = email.toLowerCase();
                  User user = new User(firstName, middleInitial, lastName, email, phone, username, password, ogId, address, city, state, zipcode, "0", "0", business_type, "", "", "url_website", "url_yelp", "url_google", "url_twitter", "url_tiktok", "url_snap", "url_instagram", "url_facebook", referred_by, "url_linkedin", "token_linkedin", "token_twitter_c_key", "token_twitter_c_secret", "token_twitter_a", "token_twitter_a_secret");
                  UserDao dao = new UserDao();
                  try {
                      boolean pv = true;
                      String um = "Thank you for joining";
                      if (email == null || email.isEmpty()) {
                        pv = false;
                        um  = "Email can't be Empty";
                      }
                      if (username == null || username.isEmpty()) {
                        pv = false;
                        um  = "Username can't be Empty";
                      }
                      if (password == null || password.isEmpty()) {
                        pv = false;
                        um  = "Password can't be Empty";
                      }
                      if(dao.isUsernameTaken(username)){
                        pv = false;
                        um  = "Username is taken";
                      }else if(dao.isEmailTaken(email)){
                        pv = false;
                        um  = "Email is already a user";
                      }

                      if(username.equals(referred_by)){
                        pv = false;
                        um  = "Username can not equal to referred by";
                      }

                      if(pv){
                        dao.insertUser(user);
                        user = dao.getUserByUsername(username);
                        session.setAttribute("username", username);
                        session.setAttribute("usernameOBJ", user);
                        um  = "Thank you for joining";
                      }
                        %>
                        <p>
                          <%=um%>
                          <%if(pv){%>
                              <hr>
                              Dear new customer,<BR><BR>
                              Welcome to Home Renovation Nation! Whether you're a homeowner looking to renovate your home or a contractor looking to grow your business, our platform has everything you need to get started. Sign up for free to access expert advice, connect with a community of homeowners, use our project planner tool, and receive discounts on products and services. Our system, built with advanced artificial intelligence, offers a wealth of functionality and capabilities to help you succeed in your home renovation journey. Join today and start exploring all that Home Renovation Nation has to offer. If you have any questions or need assistance, don't hesitate to reach out to us.
                              <BR><BR>
                              To start, let's finish setting up your user account so you can start using 'Home Renovation Nation' right away. Once that's done, you'll have full access to all the tools and resources available on Home Renovation Nation. We hope you find this system useful and helpful in your home renovation journey. If you have any questions or need assistance, don't hesitate to reach out to us.
                              <BR><BR>
                              Sincerely,
                              <BR><BR>
                              Home Renovation Nation
                              <%if(business_type.equals("home-owner")){%>
                                <a href="https://homerenovationnation.com/customer/user.edit.jsp">Finish User Profile</a>
                              <%}else{%>
                                <a href="https://homerenovationnation.com/user.edit.jsp">Finish User Profile</a>
                              <%}%>
                          <%}%>
                        </p>
                        <%
                  } catch (Exception e) {
                      %><%="An error occurred: " + e.getMessage()%><%
                  }


                }else{

                // Validate other fields as necessary

                // Create User object and set its fields


        %>
            <!-- ======= Contact Section ======= -->
                <p>
                Welcome to <b>Home Renovation Nation</b>! If you're considering a home renovation project, our platform is here to help. Sign up for free to access expert advice, connect with a community of homeowners, use our project planner tool, and receive discounts on products and services. Our system, built with advanced artificial intelligence, offers a wealth of functionality and capabilities to help you succeed in your home renovation journey. Join today and start exploring all that Home Renovation Nation has to offer. If you have any questions or need assistance, don't hesitate to reach out to us.
                </p>

                <form action="signup.jsp" method="POST">
                  <div class="form-group  mt-3">
                    <label for="business-type">Select a type of business:</label>
                    <select class="form-control  mt-1" id="business_type" name="business_type">
                      <option value="home-owner">Home Owner</option>
                      <option value="general-contractor">General contractor</option>
                      <option value="carpenter">Carpenter</option>
                      <option value="plumber">Plumber</option>
                      <option value="electrician">Electrician</option>
                      <option value="hvac-technician">HVAC technician</option>
                      <option value="landscaper">Landscaper</option>
                      <option value="roofing-contractor">Roofing contractor</option>
                      <option value="painter">Painter</option>
                      <option value="flooring-contractor">Flooring contractor</option>
                    </select>
                  </div>
                  <HR>

                    <div class="form-group mt-3">
                  <div class="row">
                    <div class="col">
              		<label for="firstName">First Name:</label><br>
              		<input type="text"  class="form-control mt-1" id="firstName" name="firstName"  required><br>
                    </div>
                    <div class="col">
              		<label for="middleInitial">Middle Initial:</label><br>
              		<input type="text"  class="form-control mt-1" id="middleInitial" name="middleInitial"><br>
                    </div>
                    <div class="col">
              		<label for="lastName">Last Name:</label><br>
              		<input type="text"  class="form-control mt-1" id="lastName" name="lastName" required><br>
                    </div>
                  </div>
                    </div>

                  <div class="form-group mt-3">
              		<label for="email">Email:</label><br>
              		<input type="email"  class="form-control" id="email" name="email" required><br>
                  </div>
                  <div class="form-group mt-3">
              		<label for="phone">Phone:</label><br>
              		<input type="text"  class="form-control" id="phone" name="phone" required><br>
                  </div>
                  <div class="form-group mt-3">
              		<label for="username">Username:</label><br>
              		<input type="text"  class="form-control" id="username" name="username" required><br>
                  </div>
                  <div class="form-group mt-3">
              		<label for="password">Password:</label><br>
              		<input type="password"  class="form-control" id="password" name="password" required><br>
                  </div>
                  <div class="form-group mt-3">
                  <label for="address">Address:</label><br>
              		<input type="text"  class="form-control" id="address" name="address" required><br>
                  </div>


                  <div class="form-group mt-3">


                  <div class="row">
                  <div class="col">
                  <label for="city">City:</label><br>
              		<input type="text"  class="form-control" id="city" name="city" required><br>
                  </div>
                  <div class="col">
                  <label for="state">State:</label><br>
              		<input type="text"  class="form-control" id="state" name="state" required ><br>
                    </div>
                    <div class="col">
                    <label for="state">Zip:</label><br>
                    <input type="text"  class="form-control" id="zipcode" name="zipcode" required><br><br>
                    </div>
                  </div>
                  </div>
                  <div class="form-group  mt-3">
                    <label for="url_facebook">Referred By</label>
                    <input type="text" class="form-control" id="referred_by" name="referred_by" <% if (request.getParameter("referred_by") !=null) { %>value="<%=request.getParameter("referred_by")%>" <% } %> >
                  </div>
                  <hr class="mt-3">
                      <button type="submit" class="btn btn-primary">Sign-up</button>
                  	</form>

                 <%}%>
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
