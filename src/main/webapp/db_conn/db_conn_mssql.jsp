<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>

<%
	Connection conn = null ;
	String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	String url = "jdbc:sqlserver://localhost:1433;DatabaseName=myDB;encrypt=false";  // encrypt=false 암호화 하지 않겠다. // 세미콜론과 콜론 혼동주의
																					 // 공백 들어가면 안됨
	// 예외 처리 ( 프로그램 오류 (Error)를 예외라고 함)
	
	try {		// try 불락에서 오류가 발상하도라도 프로그램이 멈추지 않도록 함
	
		Class.forName(driver);    // driver  --> SQLServerDriver
		conn = DriverManager.getConnection(url, "sa" , "1234");
		
		// conn이 오류가 없으면 작동됨	
		
	//	out.println("MSSQL 서버에 <b>성공적</b>으로 접속했습니다. <br>");			// 정상작동됐으면 주석처리
		
	} catch (Exception e ){
		
		// try 불락ㄱ의 오류가 있을 때만 작동
		out.println("MSSQL 서버에 <b>접속실패</b>했습니다. <br>");
		
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