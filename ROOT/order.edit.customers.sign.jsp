<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tfnlab.mysql.User"%>
<%@ page import="com.tfnlab.mysql.UserDao" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.tfnlab.mysql.Order" %>
<%@ page import="com.tfnlab.mysql.OrderDao" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.text.SimpleDateFormat" %>
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


    <!-- Include the Bootstrap CSS file -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- Include the Bootstrap Datepicker CSS file -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw==" crossorigin="anonymous" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" crossorigin="anonymous" />
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
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

</head>

<body>

  <!-- HTML page -->
  <canvas id="signature-canvas" width="400" height="200" style="border: 2px solid #000000;"></canvas>

  <form action="order.edit.customers.sign.jsp" id="signature-form" method="post" enctype="multipart/form-data">
    <input type="file" name="signature" id="signature-input" accept="image/*">
    <button type="submit">Upload Signature</button>
  </form>

  <script>
    // JavaScript code
    var canvas = document.getElementById('signature-canvas');
    var form = document.getElementById('signature-form');
    var input = document.getElementById('signature-input');

    // Set up an event listener for the form submission event
    form.addEventListener('submit', uploadSignature);

    function uploadSignature(event) {
      alert('Test');
      // Prevent the form from being submitted
      event.preventDefault();

      // Get the data URL of the canvas image
      var dataURL = canvas.toDataURL();

      // Create a blob from the data URL
      var blob = dataURLToBlob(dataURL);

      // Set the value of the signature input to the blob
      input.value = blob;

      // Submit the form
      form.submit();
    }

    function dataURLToBlob(dataURL) {
      // Convert the data URL to a binary string
      var binaryString = atob(dataURL.split(',')[1]);

      // Create an array of bytes from the binary string
      var byteArray = new Uint8Array(binaryString.length);
      for (var i = 0; i < binaryString.length; i++) {
        byteArray[i] = binaryString.charCodeAt(i);
      }

      // Create a blob from the array of bytes
      return new Blob([byteArray], { type: 'image/png' });
    }
  </script>


        <script>
          // JavaScript code
          var canvas = document.getElementById('signature-canvas');
          var context = canvas.getContext('2d');

          // Flag to track whether the user is currently drawing
          var isDrawing = false;

          // Set up event listeners for mouse and touch events
          canvas.addEventListener('mousedown', startSignature);
          canvas.addEventListener('mousemove', drawSignature);
          canvas.addEventListener('mouseup', endSignature);
          canvas.addEventListener('touchstart', startSignature);
          canvas.addEventListener('touchmove', drawSignature);
          canvas.addEventListener('touchend', endSignature);

          function startSignature(event) {
            // Start drawing the signature when the user begins a mouse or touch event
            isDrawing = true;
            context.moveTo(event.clientX, event.clientY);
          }

          function drawSignature(event) {
            if (isDrawing) {
              // Draw a line to the current mouse or touch position
              context.lineTo(event.clientX, event.clientY);
              context.stroke();
            }
          }

          function endSignature(event) {
            // Stop drawing the signature when the user ends the mouse or touch event
            isDrawing = false;
          }
        </script>



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
