<%@page import="com.itextpdf.kernel.pdf.PdfDocument"%>
<%@page import="com.itextpdf.kernel.pdf.PdfWriter"%>
<%@page import="com.itextpdf.layout.Document"%>
<%@page import="com.itextpdf.layout.element.Paragraph"%>
<%@page import="java.io.FileOutputStream"%>

<%
  // Get the content from the query parameter
  String content = request.getParameter("orderCom");

  // Create a Document and a PdfWriter
  Document document = new Document();
  PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("document.pdf"));

  // Open the document
  document.open();

  // Add the content as a paragraph
  document.add(new Paragraph(content));

  // Close the document
  document.close();
%>
