<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<%
request.setCharacterEncoding("euc-kr");
%>
<head>
 <meta charset="UTF-8">

<title>문제 은행</title>
</head>
<body>
	<br>
	<%
	String arr[] = new String[10];
	for (int i = 0; i< 10; i++){
		arr[i] = request.getParameter("a"+i);
	}
	String ans[] = new String[10];
	for (int i = 0; i< 10; i++){
		ans[i] = request.getParameter("ans"+i);
	}
	int count = 0;
	int j = 0;
	for (int i = 0; i < 10; i++) {
		j++;
		if (arr[i].equals(ans[i])) {
			out.println("<CENTER>" + j + "번 문제 O <br>");
			count = count + 10;
		} else {
			out.println("<CENTER>" + j + "번 문제 X <br>");
		}
	}

	String name = request.getParameter("name");
	out.println("<br>" + name);
	
	String pwd = request.getParameter("pwd");
	out.println(pwd);
	%>

	<h2><CENTER> 100 / <%=count%>점 입니다.
	</h2>
	<form action="login.jsp" method="POST">
		<input type="submit" value="처음 페이지로 돌아기기">
	</form>

	<%
	request.setCharacterEncoding("utf-8");
	Connection conn = null;
	PreparedStatement pstmt = null;
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	try {
		String jdbcDriver = "jdbc:mysql://localhost:3306/springboot-project";
		String dbUser = "root";
		String dbPass = "1234";

		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(conn + "<-- conn");
		System.out.println(conn.getClass() + "<-- conn.getClass()");

		pstmt = conn.prepareStatement("INSERT INTO result VALUES (?, ?, ?)");
		System.out.println(pstmt + "<-- pstmt 1");
		System.out.println(pstmt.getClass() + "<-- pstmt.getClass() 1");
		pstmt.setString(1, name);
		pstmt.setString(2, pwd);
		pstmt.setInt(3, count);
		pstmt.executeUpdate();

	} finally {
		if (pstmt != null)
			try {
		pstmt.close();
			} catch (SQLException ex) {
			}
		if (conn != null)
			try {
		conn.close();
			} catch (SQLException ex) {
		}
	}
	%>
</body>
</html>