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
	String na = request.getParameter("name");              
	String em = request.getParameter("email");              
	String sub = request.getParameter("subject");              
	String cont = request.getParameter("contents");              

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
         

</body>
</html>