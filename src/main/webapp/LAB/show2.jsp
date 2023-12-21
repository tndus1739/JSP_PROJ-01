<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.* , java.util.*" %>    
    
<%@ include file = "../db_conn/db_conn_oracle.jsp" %>  

<%
		//DB에 값을 읽어와서 ResultSet 객체에 저장
		
		String sql = null ;
		PreparedStatement pstmt = null ;
		ResultSet rs = null ;
		
		sql = " select * from soso order by subject asc" ;
		

		// pstmt 객체 활성화
		
		pstmt = conn.prepareStatement(sql);
		

		try { 
			
		rs = pstmt.executeQuery();
			
			
		}  catch (Exception e ) {
			
			out. print ("DB 접속에 실패했습니다.") ;
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
  <table width = "500px" border = "2">
  <tr> <th> 이름 </th>  <th> 이메일 </th>  <th> 제목 </th>  <th>  내용 </th> </tr>
	
	<%  
		if (rs.next()){
			do {
	%>
       
       <!--  출력되는 내용 -->
		<tr> <td> <%= rs.getString("name") %>  </td> 
			 <td> <%= rs.getString("email") %>  </td>
			 <td> <%= rs.getString("subject") %>  </td>
			 <td> <%= rs.getString("content") %>  </td>
		</tr>		


	<%
			} while (rs.next());
			
		} else {
			out.println("DB에서 값이 존재하지 않습니다.");
		}
	%>

</table>

</body>
</html>