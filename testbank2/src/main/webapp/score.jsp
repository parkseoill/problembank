<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<% 
 	request.setCharacterEncoding("euc-kr");
%> 
<head>
 <meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% 	
	String id =  request.getParameter("id"); 
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/springboot-project", "root", "1234");

	Class.forName("com.mysql.jdbc.Driver");

	pstmt = conn.prepareStatement("SELECT * FROM result WHERE name = ?");
	pstmt.setString(1, id);
	
	rs = pstmt.executeQuery();
	
	//id 값의 점수만 가져옴
	if(rs.next()){  
		id = rs.getString("score"); 	
		%>
		<% 
	}
		
	rs.close();
	pstmt.close();
	conn.close();
%>
<h2>
	점수는 : <%=id%>점 입니다.
</h2>
</body>
</html>