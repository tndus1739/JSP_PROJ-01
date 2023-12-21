<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSP에서 java.sql 패키지의 하위 모든 클래스를 import       // HTML 언어와 JAVA언어가 혼재해 있을 때는 JSp파일로 저장
			java.util 패키지의 하위 모든 클래스를 import
 -->   
<%@ page import = "java.sql.* , java.util.*" %>    <!-- 바로 import 하면 안되고 page를 입력후 inport -->  

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
<%@ include file ="../db_conn/db_conn_oracle.jsp" %>       <!-- db_conn_orcle.jsp 에 Connection 객체 들어있음 -->

<!--  PreparedStatement 객체를 사용해서 DB에 저장함 -->
<%

	// Client엥서 받은 값을 DB에 저장
	
	String sql = null ;   // 변수 sql 에는 SQL 쿼리를 저장하는 변수
	PreparedStatement pstmt = null ;    // stmt 변수 : SQL 쿼리를 담아서 DB에 적용하는 객체
	
	sql = "insert into guestboard (name , email , subject , content )" ;
	sql = sql + " values (?,?,?,?)" ;    // PreparedStatement 는  values 에 변수의 값이 들어올 때 ?로 처리함
//	out.println(sql);
	
	// PreparedStatement 객체를 활성화  : Connection 객체로 PreparedStatement 객체를 생성함
	
	pstmt = conn.prepareStatement(sql);  //prepareStatement 메소드에 ?라서 아직 값이 안들어가있는 상태이기 때문에 () 안에 sql쿼리를 넣어서 객체 생성
	

	// pstmt : ? 에 변수의 값을 할당 후 실행
			
	pstmt.setString(1, na);     // 왼쪽 숫자는 방번호
	pstmt.setString(2, em);		// 숫자일 경우 setInt , 실수일 경우 setDouble
	pstmt.setString(3, sub);
	pstmt.setString(4, cont);
	
	// stmt 를 사용해서 DB에 값을 insert
	try {
		//DB에 값을 넣을 때 오류가 발생되더라도 전체 프로그램이 중지되지 않도록 설정
		
		pstmt.executeUpdate();		// Datebase에 저장완료  (그냥 execute가 아니라 executeUpdate)					
									// 톰캣에서는 자동커밋됨 ( developer에서는 반드시 commit 필요)
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
         
	<h1> PreparedStatement </h1>

</body>
</html>