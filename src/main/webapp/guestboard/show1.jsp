<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!--  java.sql.* : Connection , Statement, preparedStatement , RecodeSet 객체들이 들어있다.-->  
 <%@ page import = "java.sql.*" %>  
 
 <!-- conn 객체 : oracle XE 에 접속하기 위해 include 함 -->
<%@ include file ="../db_conn/db_conn_orcle.jsp" %>

 <%
	// 사용할 변수를 초기화  
 	String sql = null ;      // sql : 객체변수 // import를 했기 때문에 객체를 사용할 수 있는 것
 	Statement stmt = null ;
 	
 	ResultSet rs = null ;    // DataBase 의 테이블의 레코드를 담은 객체
 							 // select 쿼리를 하면 select한 결과를 ResultSet 객체에 담아야 함

 							 
 	//쿼리작성						 
 	sql = "select * from guestboard";     // select한 결과를  sql 에 담음 
 	
 	// Statement 객체 생성
 	stmt = conn.createStatement();         //stmt 는 Oracle의 XE DB 를 연결한 상태
 	
 	
 	
 	try {
 		// stmt 객체에 sql 쿼리를 넣어서 실행
 		rs =  stmt.executeQuery(sql);			// sql : select 문인 경우 stmt.executeQuery(sql); 사용 , rs : select 한 결과 레코드셋을 담은 객체
 												// cf)  stmt.execute(sql) : insert , update , delete  일 때는 그냥 execute를 사용
 	// rs 는 select한 결과 레코드셋을 담고 있다. 
 	// rs.next()    : 다음 레코드가 존재하면 true
 	
 	
 	} catch (Exception e) {
 		out.println("DB 접속에 문제가 생겼습니다.");
 		e.printStackTrace();
 	}
 
 %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
	<h2> DB의 값을 읽어와서 출력하는 페이지</h2>
	
	<%
		if (rs.next()) {     // rs의 레코드가 존재할 때 작동됨 , 커서가 다음 레코드로 위치함	
			do {
	%>
	    <table border = "1" width = "500px">
	    	<tr> <td colspan = "2"> <%= rs.getString("subject")%> </td> </tr>
	    	<tr> <td> 글쓴이 : </td> <td> <%= rs.getString("name") %></td> </tr>
	    	<tr> <td> 이메일 : </td> <td> <%= rs.getString("email") %> </td> </tr>
	    	<tr> <td> 글내용 : </td> <td> <%= rs.getString("content") %> </td> </tr>
	    	
	    	

	    </table>
		<br>
	<%
			} while (rs.next());
		}
	%>
	
	
	</center>	
</body>
</html>