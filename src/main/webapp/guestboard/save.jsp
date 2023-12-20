<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSP에서 java.sql 패키지의 하위 모든 클래스를 import
			java.util 패키지의 하위 모든 클래스를 import
 -->   
<%@ page import = "java.sql.* , java.util.*" %>    

<!--  클라이언트에서 넘어오는 한글이 깨지지 않도록 처리 -->
<% request.setCharacterEncoding("UTF-8"); %> 

<!-- 클라이언트에서 넘어오는 값을 받아서 출력 : request 객체 -->
<!-- 자바코드는 확장자 jsp로 저장 -->
<!-- Parameter :  ? 뒤에 넘어오는 값  -->
<% 
	// 자바 블럭
	
	//요청주소 : http://localhost:8181/JSP_PROJ/guestboard/save.jsp?name=sooyeon&email=aaa%40aaaa.com&subject=aaa&contents=ooooo+
	// Parameter : ? 뒤에 넘어오는 값 ( ?변수명=값&변수명=값&변수명=값)   //  파라미터 : ?name=sooyeon&email=aaa%40aaaa.com
	// 파라미터로 넘어오는 값은 모두 String 
	// %= : 출력해라 (띄어쓰면 안됨)
	String na = request.getParameter("name");       // 클라이언트에게 받은 값을 na 변수에 저장       
	String em = request.getParameter("email");              
	String sub = request.getParameter("subject");              
	String cont = request.getParameter("contents");              
	
%>    

<!--  DB Connection 객체를 불러들임 -->
<%@ include file ="../db_conn/db_conn_orcle.jsp" %>       <!-- db_conn_orcle.jsp 에 Connection 객체 들어있음 -->

<!--  Statement 객체를 사용해서 DB에 저장함 -->
<%

	// Client에서 받은 값을 DB에 저장
	
	String sql = null ;   // 변수 sql 에는 SQL 쿼리를 저장하는 변수
	Statement stmt = null ;    // stmt 변수 : SQL 쿼리를 담아서 DB에 적용하는 객체
	
	sql = "insert into guestboard (name , email , subject , content )" ;
	sql = sql + " values ('" + na + "','" + em + "','" + sub + "','" + cont+"')" ;    // values 앞에 공백이 꼭 들어가야 함 , 작은 따옴표도 주의
	
	// 2번째 sql = 최종 sql
	out.println(sql);
	
	// Statement 객체를 활성화  : COnnection 객체로 Statement 객체를 생성함
	stmt = conn.createStatement();

	// stmt 를 사용해서 DB에 값을 insert
	
	try {
		//DB에 값을 넣을 때 오류가 발생되더라도 전체 프로그램이 중지되지 않도록 설정
		stmt.execute(sql);		// Datebase에 저장완료								// 톰캣에서는 자동커밋됨 ( developer에서는 반드시 commit 필요)
								//stmt.execute(sql) : insert , update , delete  일 때는 그냥 execute를 사용
	} catch (Exception e) {
		
		e.printStackTrace();
		out.println("DB 저장에 실패했습니다.");
		
	
		
	}
//write .html에서 값을 넣으면 save.jsp으로 넘어와서 get파라미터를 통해 각 변수에 값이 저장됨

%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 변수에 담긴 값을 출력 -->
	
	<h2> 넘어오는 변수 값 출력 </h2>
	
	<%= na %>  <br>
	<%= em %>	<br>
	<%= sub %>	<br>
	<%= cont %>	<br>
      
    <h1> Statement </h1>     

</body>
</html>