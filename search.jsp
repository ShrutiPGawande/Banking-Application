<%@page import="bank.model.Register"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%if(!session.isNew()){
	 Register robj=null; 
	 robj=(Register)session.getAttribute("result"); 
	 out.println(robj.getRegno()+" "+robj.getCustname()+" "+robj.getUsername()+" "+robj.getPassword()+" "+robj.getAccbal());
	
}
%>
</body>
</html>