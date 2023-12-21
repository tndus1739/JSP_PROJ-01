<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    

 <%@ page import = "java.sql.* , java.util.*" %>    

<% 

	String na = request.getParameter("name");  
	String age = request.getParameter("age");
	String we =request.getParameter("weight");
	String addr =request.getParameter("addr");
	String ph =request.getParameter("phone");

%>

<%@ include file ="../db_conn/db_conn_oracle.jsp" %>

<%	
	// 변수설정
	String sql = null ;
	Statement stmt = null ;
	
	sql = "insert into soso ( name , age , weight , addr , phone )";
	sql = sql +  " values ('" + na + "','" + age + "','" + we + "','" + addr+ "','" + ph + "')";
	// statement : sql 쿼리에서 변수값을 다 집어넣음
	out.println(sql);
	
	stmt = conn.createStatement();
	
	
	try {
		
	stmt.execute(sql);
	

	} catch ( Exception e) {
		
	e.printStackTrace();
	out.println("DB 저장에 실패했습니다.");
		
	}
	
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>★ save1 ★</title>
</head>
<body>

	<h1> ★ 넘어오는 변수의 값 출력 ★ </h1>

	<%= na %> <br>
	<%= age %> <br>
	<%= we %> <br>
	<%= addr %> <br>
	<%= ph %> <br>

	<h4> Statement 사용 </h4>

</body>
</html>