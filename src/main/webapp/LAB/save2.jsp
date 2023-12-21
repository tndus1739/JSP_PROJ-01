<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "java.sql.* , java.util.*" %>

<%

String na = request.getParameter("name");  
String age = request.getParameter("age");
String we = request.getParameter("weight");
String addr =request.getParameter("addr");
String ph =request.getParameter("phone");


%>

<%@ include file ="../db_conn/db_conn_oracle.jsp" %>
 
<%
	String sql = null ;
    PreparedStatement pstmt = null ;  // pstmt : 객체변수
    
    sql = "insert into mem ( name , age , weight , addr , phone )" ;
    sql = sql + " values (?,?,?,?,?)";
	// 변수값을 ? 로 처리
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, na);
	pstmt.setString(2, age);
	pstmt.setString(3, we);
	pstmt.setString(4, addr);
	pstmt.setString(5, ph);


	try {
	
	pstmt.executeUpdate(); 
		
		
	}  catch (Exception e) {
	
	e.printStackTrace();
	out.println("DB 저장에 실패 했습니다.")	;
		
		
	}
	
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3> ★ 변수의 값 출력★</h3>

	<%= na %> <br>
	<%= age %> <br>
	<%= we %> <br>
	<%= addr %> <br>
	<%= ph %> <br>
	

	<h3> ★ PreparedStatement 사용 ★</h3>

</body>
</html>