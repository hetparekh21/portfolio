<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="java.util.Base64" %>
<%
	String a = application.getAttribute("user_id").toString();
	String encodedString = Base64.getEncoder().encodeToString(a.getBytes());
%>
<a href="Portfolio_1/index.jsp?userId=<%= encodedString %>" target="_blank">portfolio 1</a>
<a href="Portfolio_2/index.jsp?userId=<%= encodedString %>" target="_blank">portfolio 2</a>
</body>
</html>