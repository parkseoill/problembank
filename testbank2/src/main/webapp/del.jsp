<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<title>삭제 페이지</title>
</head>
<body>
	<%
		Statement stmt = null;
		String id =  request.getParameter("id"); 
		int del = Integer.parseInt(id);
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = null;
		PreparedStatement pstmt = null;

		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/springboot-project", "root", "1234");
		
		pstmt = conn.prepareStatement("delete from bank where id = ? ");	
		pstmt.setInt(1, del);	
		pstmt.executeUpdate();	
		
		//DB값을 삭제 후 빈 ID 값을 정렬 하기
		pstmt = conn.prepareStatement("UPDATE bank SET id = id-1 WHERE id > ? ");	
		pstmt.setInt(1, del);
		pstmt.executeUpdate();	

	%>
	입력하신 ID, Password 정보가 삭제되었습니다.
	<%response.sendRedirect("db.jsp"); %>

</body>
</html>