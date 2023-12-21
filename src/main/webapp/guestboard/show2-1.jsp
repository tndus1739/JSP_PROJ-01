<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <%@ page import = "java.sql.* , java.util.*" %>   
   
<%@ include file = "../db_conn/db_conn_oracle.jsp" %>  

<%

	ArrayList  name = new ArrayList();       // DB에서 가져온 후 ArrayList에  name을 저장   // <String> 타입 생략가능 -> 넣어주면 오류메세지 사라짐
	ArrayList  email = new ArrayList();		// DB에서 가져온 후 ArrayList에  email을 저장
	ArrayList  subject = new ArrayList();	// DB에서 가져온 후 ArrayList에  subject을 저장
	ArrayList  content = new ArrayList();	// DB에서 가져온 후 ArrayList에  content을 저장 



	// DB에 값을 읽어와서 ResultSet 객체에 저장
	
	String sql = null ;
	PreparedStatement pstmt = null ;
	ResultSet rs = null ;

	
	sql = "select * from guestboard  order by name desc" ;		//select 쿼리이기 때문에 필드에 값을 넣어주지 않는다.
	
	// pstmt 객체 활성화
	pstmt = conn.prepareStatement(sql) ;
	
	try {
			// pstmt 객체를 실행 후 rs에 저장 : rs는 select한 모든 레코드를 저장
			rs = pstmt.executeQuery();

		
	} catch (Exception e)	{
		
		out.println("DB에서 select 중 오류가 발생되었습니다. ");
		e.printStackTrace();		
	}

	if (rs.next()) {
		
		do {
			name.add(rs.getString("name"));        // name : DB의 이름 레코드만 저장됨	// 커서가 있는 "name"필드의 값을 가져옴 , ArrayList name.에다가 add 메소드를 사용해서 값을 넣어줌
			email.add(rs.getString("email"));		// DB있는 값 끌고와서 ArrayList에 넣음
			subject.add(rs.getString("subject"));
			content.add(rs.getString("content"));
		
		
		} while (rs.next());
	}

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2> PreparedStatement 쿼리 실행 후 rs에 담아서 출력</h2>
	
	<table width = "600px" border="1">
		<tr> <th> 이름 </th> <th> 메일주소 </th> <th> 제목 </th> <th> 내용 </th> </tr>     
	
	
		<%
	
		// ArrayList에 0부터 마지막 방까지 순환하면서 필드의 내용을 출력
		
		for (int i = 0 ; i < name.size () ; i++) {                       // while 문도 가능
	
	
	%>
	
		<tr> <td> <%= name.get(i) %> </td>   <!--  name.get(i)  : 방번호 -->
			 <td> <%= email.get(i) %> </td> 
			 <td> <%= subject.get(i) %> </td> 
			 <td> <%= content.get(i) %> </td> 
		</tr>
	
	
	<%
	
		}
	%>
	
	
	
	

</table>





</body>
</html>