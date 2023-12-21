<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "java.sql.* , java.util.*" %>          <!--  java.util.* : arraylist 가 들어있음 -->
    
<%@ include file ="../db_conn/db_conn_oracle.jsp" %>   
    
    
<%

	// DB에서 가져온 레코드셋을 rs 에 담은 후 ArrayList 에 저장 후 출력
	
	
	// 선언만 되어있는 상태
	ArrayList <String> name = new ArrayList();       // DB에서 가져온 후 ArrayList에  name을 저장   // <String> 타입 생략가능 -> 넣어주면 오류메세지 사라짐
	ArrayList <String> email = new ArrayList();		// DB에서 가져온 후 ArrayList에  email을 저장
	ArrayList <String> subject = new ArrayList();	// DB에서 가져온 후 ArrayList에  subject을 저장
	ArrayList <String> content = new ArrayList();	// DB에서 가져온 후 ArrayList에  content을 저장

	// 객체 변수 선언
	
	String sql = null ;
	PreparedStatement pstmt = null ;
	ResultSet rs = null ;
	
	sql = "select * from guestboard order by name desc";
	
	// pstmt 활성화
	
	pstmt = conn.prepareStatement(sql);
	
	
	// 여기까지는 pstmt의 쿼리를 담아 놓은 상태
	
	// 이제 pstmt의 쿼리를 실행
	
	try { 
	
		// pstmt의 쿼리를 실행 , rs는 guestboard 테이블의 레코드셋을 담고 있다. 
		
		rs = pstmt.executeQuery();
		
	} catch (Exception e){
		out.println ("DB에 값을 읽어오는 동안 오류가 발생 되었습니다.");
		e.printStackTrace();
	}
	
	// rs에 저장된 값을 각 각의 ArrayList에 저장
	
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


	<h2> RS에 저장된 값을 ArrayList 에 저장 후 출력 </h2>
	
	<table width= "600px" border = "1px">
		<tr><th> 이름 </th> <th> 이메일 </th> <th> 제목 </th> <th> 내용 </th> </tr>
	
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