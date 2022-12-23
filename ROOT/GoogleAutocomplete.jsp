<%@ page import="com.tfnlab.api.con.GoogleAutocomplete,java.util.Vector, java.io.IOException" %>
<%
  GoogleAutocomplete googleAutocomplete = new GoogleAutocomplete();
  try {
    Vector<String> results = googleAutocomplete.search("1325 N Lamer St");
    for (int i = 0; i < results.size(); i++) {
      String result = results.get(i);
      %><%=result%><ITEM><%
      // do something with the result here
    }
  } catch (IOException e) {
    // handle the exception here
  } finally {
    // close the input stream and scanner objects here
  }
%>

ITEM DONE
