<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>

<%
	// 한번만 설정하면 됨
	Connection conn = null ;
	String driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/mydb";  

	// 예외 처리 ( 프로그램 오류 (Error)를 예외라고 함)
	
	try {		// try 불락에서 오류가 발상하도라도 프로그램이 멈추지 않도록 함
	
		Class.forName(driver);   
		conn = DriverManager.getConnection(url, "root" , "1234");  // connecton 객체가 잘 만들어진 것
		
		// conn이 오류가 없으면 작동됨	
		
	//	out.println("MYSQL 서버에 성공적으로 접속했습니다.");  // 연결 잘됐으면 주석처리
		
	} catch (Exception e ){
		
		// try 불락의 오류가 있을 때만 작동
		out.println("MYSQL 서버에 접속실패 했습니다.");
		
		// DB 연결이 실패시 오류난 정보를 콘솔에 자세하게 출력
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

</body>
</html>