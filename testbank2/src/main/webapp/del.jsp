<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<title>���� ������</title>
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
		
		//DB���� ���� �� �� ID ���� ���� �ϱ�
		pstmt = conn.prepareStatement("UPDATE bank SET id = id-1 WHERE id > ? ");	
		pstmt.setInt(1, del);
		pstmt.executeUpdate();	

	%>
	�Է��Ͻ� ID, Password ������ �����Ǿ����ϴ�.
	<%response.sendRedirect("db.jsp"); %>

</body>
</html>