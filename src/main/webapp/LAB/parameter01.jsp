<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    int a = 0 ;			 // 정수타입은 초기값을 0 으로 설정
    int b = 0 ;
    String c = null ;    // 객체형은 초기값을 null로 설정
    String d = null ;
    
    c = request.getParameter("aa");    // Parameter 로 넘어으는 변수의 값은 전부 String 이기 때문에 Integer.parseInt 를 사용해서 정수로 변환시켜야 함
    d = request.getParameter("bb");
    
    a = Integer.parseInt (c) ;
    b = Integer.parseInt (d) ;
    
    out.println ( a + "<p>") ;
    out.println ( b + "<p>") ;
    
   	a = Integer.parseInt(request.getParameter("cc")) ;
   	b = Integer.parseInt(request.getParameter("dd")) ;
    
    out.println ("<hr>");
   	out.println ( a + "<p>") ;
    out.println ( b + "<p>") ;
   	
   	
   	
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