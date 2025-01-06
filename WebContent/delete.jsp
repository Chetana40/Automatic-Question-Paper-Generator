<%@page import="com.project.*" %>
<%@page import="java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

 <%
   try{
	
     String id = request.getParameter("id") ;
     Connection con = Connect_DB.connect();
	 PreparedStatement ps1=con.prepareStatement("delete from question_tbl where id=?");
	 ps1.setString(1,id);
	 int i = ps1.executeUpdate();
	 if(i>0)
	 {
		response.sendRedirect("view.jsp");   
	 }
   }
  catch(Exception e)
{
	  e.printStackTrace();
	  response.sendRedirect("error.html");
}


%>

</body>
</html>