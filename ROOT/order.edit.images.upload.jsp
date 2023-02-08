<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*, org.apache.commons.fileupload.*, org.apache.commons.fileupload.servlet.*, org.apache.commons.fileupload.disk.*" %>
<%@ page import="com.tfnlab.mysql.User"%>
<%@ page import="com.tfnlab.mysql.UserDao" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.tfnlab.mysql.Order" %>
<%@ page import="com.tfnlab.mysql.OrderDao" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.tfnlab.mysql.Technician" %>
<%@ page import="com.tfnlab.mysql.TechnicianDao" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="com.tfnlab.api.con.APIConfig" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="javax.servlet.http.Part" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="java.util.Collection" %>
<%@ page import="javax.servlet.http.Part" %>
<%
  boolean isMultipart = ServletFileUpload.isMultipartContent(request);

  if (isMultipart) {
    FileItemFactory factory = new DiskFileItemFactory();
    ServletFileUpload upload = new ServletFileUpload(factory);

    try {
      List<FileItem> items = upload.parseRequest(request);

      for (FileItem item : items) {
        if (!item.isFormField()) {
              InputStream fileStream = item.getInputStream();
              String fileName = item.getName();
              FileOutputStream outputStream = new FileOutputStream(new File("/var/lib/tomcat9/webapps/images/" + fileName));
              int read = 0;
              byte[] bytes = new byte[1024];
              while ((read = fileStream.read(bytes)) != -1) {
                outputStream.write(bytes, 0, read);
              }
              outputStream.flush();
              outputStream.close();
              fileStream.close();
        }
      }
    } catch (FileUploadException e) {
      // Handle the exception
    }
  }
%> DONE
