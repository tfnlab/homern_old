<%@ page import="com.tfnlab.api.con.GeocodingExample,java.util.Vector, java.io.IOException" %>
<%
  GeocodingExample geocodingExample = new GeocodingExample();
  try {
    String[] results = geocodingExample.search("1325 N Lamer St");
      %><%=results[0]%><ITEM><%
      %><%=results[1]%><%
  } catch (IOException e) {
    // handle the exception here
  } finally {
    // close the input stream and scanner objects here
  }
%>

ITEM DONE
