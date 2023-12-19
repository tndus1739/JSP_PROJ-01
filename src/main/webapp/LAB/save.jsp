<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.sql.* , java.util.*" %> 

<% 
	String na = request.getParameter("name");
	String age = request.getParameter("age");
	String we = request.getParameter("weight");
	String addr = request.getParameter("addr");
	String ph = request.getParameter("phone");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>  ★ 넘어오는 변수의 값 출력 ★ </h1>
	<hr>
	<%= na %>  <br>
	<%= age %> <br>
	<%= we %>  <br>
	<%= addr %> <br>
	<%= ph %>  <br>
	<hr>

</body>
</html>