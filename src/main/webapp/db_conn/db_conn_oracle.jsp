<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.*" %>

<%
	Connection conn = null ;           // Connection 객체의 변수 : conn 초기화   // type : Connection
	String driver = "oracle.jdbc.driver.OracleDriver";     // ojdbc11.jar // 오라클 라이브러리를 driver 변수에 담는 것
	String url = "jdbc:oracle:thin:@localhost:1521:XE";	   // oracle을 접속할 수 있는 JDBC  // 1521번 XE 데이터에 연결하겠다. 
 
	// 예외 설정 : 오류가 발생하더라도 프로그램이 중지되지 않도록 설정
	try {                             				  
		                              // try 블락에서 오류 발생시 catch 블락이 작동
		// try 블락				
		Class.forName(driver);			// 위의 driver 를 로드
		conn = DriverManager.getConnection(url , "C##HR" , "1234");  // url : 오라클의 1521번 데이터베이스에 접속하겠다. 
										// 위의 url 집어넣음
	    //JSP 에서 출력하라
//	    out.println("DB 연결이 성공했습니다.");					// 정상작동됐으면 주석처리
		
		
	}catch (Exception e) {
		// catch 불락: try 블락에 오류가 있을 때만 작동
		out.println("DB 연결이 실패했습니다.");
				
		// DB 연결이 실패시 오류난 정보를 콘솔에 자세하게 출력
		e.printStackTrace();
				
				
				
	}
	
//		out.println (" <br><br> ");                     // JSP에서 출력할 때 : out.println ( ); 
//		out.println (" 프로그램이 정상 작동되었습니다. ");
	
	%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border = "2">
<tr> <td>  오라클 </td> </tr>
</table>
</body>
</html>