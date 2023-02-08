<%@ page import="java.io.*, java.util.*, javax.servlet.*, javax.servlet.http.*, org.apache.commons.fileupload.ServletFileUpload" %>
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
          // Handle the uploaded file stream
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
      }
    } catch (FileUploadException e) {
      // Handle the exception
    }
  }
%>
