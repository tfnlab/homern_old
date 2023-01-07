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
          <li><a href="user.menu.jsp">Home</a></li>
          <li>Service Operations Center</li>
        </ol>
      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Blog Section ======= -->
    <section id="blog" class="blog">
      <div class="container px-4 px-lg-5">
          <div class="container mt-5">
            <h4>Service Operations Center</h4>
            <hr>
              <style>
                .fa {
                  font-size: 48px;
                  margin-right: 10px;
                }
                a:hover {
                  color: blue;
                  text-decoration: underline;
                }
                .link-col {
                  display: flex;
                  flex-direction: column;
                  align-items: center;
                }
                a {
                  padding: 10px;
                }
              </style>

              <div class="row">
                <div class="col-3 link-col">
                  <a href="user.menu.jsp"><i class="fa fa-home"></i></a>
                  <p>Home</p>
                </div>
                <div class="col-3 link-col">
                  <a href="dashboard.jsp"><i class="fa fa-cog"></i></a>
                  <p>Dashboard</p>
                </div>
                <div class="col-3 link-col">
                  <a href="user.edit.jsp"><i class="fa fa-handshake"></i></a>
                  <p>Marketing</p>
                </div>
                <div class="col-3 link-col">
                  <a href="technician.list.jsp"><i class="fa fa-wrench"></i></a>
                  <p>Technicians</p>
                </div>
              </div>
              <div class="row">
                <div class="col-3 link-col">
                  <a href="product.list.jsp"><i class="fa fa-box"></i></a>
                  <p>Products</p>
                </div>
                <div class="col-3 link-col">
                  <a href="customer.list.jsp"><i class="fa fa-users"></i></a>
                  <p>Customers</p>
                </div>
                <div class="col-3 link-col">
                  <a href="order.list.jsp"><i class="fa fa-shopping-cart"></i></a>
                  <p>Orders</p>
                </div>
                <div class="col-3 link-col">
                  <a href="event.list.jsp"><i class="fa fa-calendar"></i></a>
                  <p>Events</p>
                </div>
              </div>

            <HR>
            <p>Our home service software offers a range of features to help companies streamline their operations:</p>
            <ul>
              <li><strong>Scheduling and dispatch:</strong> our software can help schedule and dispatch technicians to service calls and manage their work schedules.</li>
              <li><strong>Customer relationship management (CRM):</strong> our software can help companies manage customer relationships by storing customer information, tracking interactions, and managing communication with customers.</li>
              <li><strong>Invoicing and billing:</strong> our software can help companies create and manage invoices, process payments, and track billing.</li>
              <li><strong>Inventory management:</strong> our software can help companies track inventory levels, reorder supplies, and manage the purchase and use of parts and equipment.</li>
              <li><strong>Service history:</strong> our software can help companies track service history for individual customers and equipment, including the type of service provided, the technician who performed the service, and the parts used.</li>
              <li><strong>Reporting:</strong> our software can generate reports on a variety of metrics, such as service history, customer interactions, and financial performance.</li>
              <li><strong>Mobile functionality:</strong> many of our software programs have mobile apps that allow technicians to access and update information on the go.</li>
              <li><strong>Integration with other systems:</strong> our software may integrate with other business systems, such as accounting software or CRM software, to streamline workflows and improve efficiency.</li>
            </ul>
            <HR>
            <h4>Mind-Blowing Updates: What's in Store</h4>
            <p>Get ready to have your minds blown, because we've got a whole bunch of new features and bug fixes that are sure to blow your socks off. These updates are going to take your user experience to a whole new level, and we can't wait for you to get your hands on them. Trust us, these are the kinds of features and bug fixes that you'll be talking about for years to come. So stay tuned and get ready to take your productivity (or whatever else you're using our product for) to the next level!</p>
            <li>
              Keep track of all your home renovation projects and events with our new calendar integration! When you use our software to schedule updates or events, they will automatically be added to your Google calendar. This means you'll never miss an important deadline or meeting, and you can easily keep track of your progress on all your renovation projects in one place. Plus, with the convenience of having everything in your Google calendar, you can easily access and view your renovation schedule from any device. Upgrade your home renovation process with this handy new feature!
            </li>
            <li>
              Easily receive payments in cryptocurrency with our new wallet address feature! Now you can add your name service address or any other cryptocurrency wallet address to your profile, and it will be displayed across all of our media channels. This means that anyone who wants to send you a payment in cryptocurrency can easily find and use your address. Plus, with the added convenience of having your address displayed in a prominent location, you can easily receive payments from multiple sources without having to share your address individually. Upgrade your payment process with this convenient new feature!
            </li>
            <li>
              Keep track of your inventory like a pro with our new tracking feature! With this handy tool, you can easily see how much of each item you have in stock, set low stock alerts, and even keep track of how much you've sold. Whether you're managing a small store or a large warehouse, this feature will help you stay on top of your inventory and ensure that you always have what you need. Plus, with the ability to easily see your inventory levels at a glance, you can make more informed purchasing decisions and avoid running out of stock. Streamline your inventory management process with this convenient new feature!
            </li>
            <li>
              Gain valuable insights into your business with our new order analysis feature! Now you can easily see how your orders are performing and make informed decisions about your business. With this tool, you can track your cash flow status, calculate your profit margin, and see how long it takes to deliver orders. Whether you're running a small online store or a large e-commerce business, this feature will help you understand your performance and identify areas for improvement. Plus, with the ability to view all this information in one place, you can save time and make more informed decisions about your business. Take control of your orders with this powerful new feature!
            </li>
            <li style='color: yellow;'>
                Feature: Add event to Google Calendar from invoice:
                Description: This feature allows the user to easily schedule a payment or follow-up action by clicking a link in an invoice PDF. The link will open an event in the user's default calendar app, allowing the user to edit and save the event.
            </li>
            <li style='color: yellow;'>
              Feature: Closed tag for orders
              Description: This feature allows users to mark orders as "closed" by adding a closed tag to the order details. The closed tag can be used to indicate that an order has been completed or is no longer active.

              The closed tag is also searchable, so users can use the search screen to find orders based on their closed status. In the search screen, orders that have a closed tag will be marked as green or red to indicate their closed status.

              This feature is useful for keeping track of orders that have been completed or are no longer active, and for quickly finding orders based on their closed status. It helps users to manage their orders more efficiently and to stay organized.

              To implement this feature, you will need to add a closed tag field to the order details screen, and to modify the search screen to allow users to search for orders based on their closed status. You will also need to add logic to mark orders as green or red in the search screen based on their closed status.
            </li>
            <li>
              Feature: Enhanced order search and location management

Description: This feature enhances the order search and location management capabilities of the system by adding the ability to search for orders based on start dates or end dates, and to change the ship location of an order to the project location on the order detail screen.

With this feature, users can easily find orders that are starting or ending within a specific time frame by searching for orders based on their start dates or end dates. This is useful for finding orders that are currently active or that are coming up in the future.

In addition, users can change the ship location of an order to the project location on the order detail screen. This is useful for situations where the ship location needs to be changed to match the location of the project.

This feature helps users to more easily manage orders and to stay organized by providing enhanced search and location management capabilities. To implement this feature, you will need to add start date and end date fields to the order details screen, and to modify the order search screen to allow users to search for orders based on start dates or end dates. You will also need to add logic to allow users to change the ship location of an order to the project location on the order detail screen.
            </li>
            <li>
              Feature: Order search by location and distance

              Description: This feature allows users to search for orders based on location, and to return the search results sorted by distance to the specified location.

              With this feature, users can easily find orders that are located near a specific location by searching for orders based on location. The search results will be sorted by distance to the specified location, so users can see which orders are closest to the location they are interested in.

              This feature is useful for finding orders that are located in a specific area, or for finding orders that are close to a particular location. To implement this feature, you will need to add a location field to the order details screen, and to modify the order search screen to allow users to search for orders based on location. You will also need to add logic to sort the search results by distance to the specified location.
            </li>
            <li style='color: yellow;'>
              A password reset feature with email and text message capability allows users to reset their account password in the event that they have forgotten it or can no longer access their account. This can be done through a password reset form, where the user is required to enter their email address or phone number.

Upon submission of the form, a reset password link is sent to the user's email address or a code is sent to the user's phone number via text message. The user can then use the link or code to reset their password and gain access to their account.

This feature can be particularly useful for users who have multiple accounts and may have trouble remembering all of their passwords, or for users who have lost access to their account due to a change in their email address or phone number. It can also provide an additional layer of security by requiring the user to verify their identity through their email address or phone number before being able to reset their password.
              </li>
          </div>
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
