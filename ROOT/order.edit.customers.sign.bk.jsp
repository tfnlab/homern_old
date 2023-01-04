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


      alert('Test 2');
      // Set the value of the signature input to the blob
      var formData = new FormData();

      // Append the blob to the form data
      formData.append('signature', blob, 'signature.png');

      // Submit the form using the FormData object
      fetch('order.edit.customers.sign.save.jsp', {
        method: 'POST',
        body: formData
      })
      .then(function(response) {
        response.text().then(function(text) {
          // Display the text
          alert(text);
        });
      })
      .catch(function(error) {
        // Handle any errors
      });
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


</body>

</html>
