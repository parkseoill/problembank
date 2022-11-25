<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		Connection conn = null;
		PreparedStatement pstmt = null;
		Class.forName("com.mysql.cj.jdbc.Driver");
	
	
		String jdbcDriver = "jdbc:mysql://localhost:3306/springboot-project";
		String dbUser = "root";
		String dbPass = "1234";
		String count1 =  request.getParameter("count"); 
		
		int count = Integer.parseInt(count1);
		
		for(int i = 0; i < count; i ++){
			Random rand = new Random();
			int problem1 = rand.nextInt(100);
			int problem2 = rand.nextInt(100);
			int answer = problem1 + problem2;
			int shuffle = rand.nextInt(4);
			int no1=0;
			int no2=0;
			int no3=0;
			int no4=0;
		
			if (shuffle == 0) {
				 answer = problem1 + problem2;
				 no1 = problem1 + problem2 ;
				 no2 = rand.nextInt(200);
				 no3 = rand.nextInt(200);
				 no4 = rand.nextInt(200);
			}
			if (shuffle == 1) {
				 answer = problem1 + problem2;
				 no2 = problem1 + problem2 ;
				 no1 = rand.nextInt(200);
				 no3 = rand.nextInt(200);
				 no4 = rand.nextInt(200);
			}
			if (shuffle == 2) {
				 answer = problem1 + problem2;
				 no3 = problem1 + problem2 ;
				 no2 = rand.nextInt(200);
				 no1 = rand.nextInt(200);
				 no4 = rand.nextInt(200);
			}
			if (shuffle == 3) {
				 answer = problem1 + problem2;
				 no4 = problem1 + problem2 ;
				 no2 = rand.nextInt(200);
				 no3 = rand.nextInt(200);
				 no1 = rand.nextInt(200);
			}

			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			//id 값을 자동증가 하기위해서 정렬을 초기화 해줌
			pstmt = conn.prepareStatement("ALTER TABLE bank AUTO_INCREMENT=1");
			pstmt.executeUpdate();
			
			//문제 db에 값을 넣어줌
			pstmt = conn.prepareStatement("INSERT INTO bank VALUES (?,?,?,?,?,?,?,?)");
			pstmt.setString(1, null);
			pstmt.setInt(2, problem1);
			pstmt.setInt(3, problem2);
			pstmt.setInt(4, no1);	
			pstmt.setInt(5, no2);
			pstmt.setInt(6, no3);
			pstmt.setInt(7, no4);
			pstmt.setInt(8, answer);
			pstmt.executeUpdate();		
			}
		if (pstmt != null)			
		pstmt.close();		
		
		if (conn != null)
		conn.close();				
	%>

	<%response.sendRedirect("db.jsp"); %>
</body>
</html>