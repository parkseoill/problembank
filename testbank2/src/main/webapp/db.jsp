<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import = "java.sql.*, java.util.*" %>
<%!
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String uid = "root";
	String pwd = "1234";
	String url = "jdbc:mysql://localhost:3306/springboot-project";
	String sql = "select * from bank";%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DB TABLE</title>
</head>
<style>
th, td {
	padding: 0px 30px;
}
</style>
<body>

	<%
		Class.forName("com.mysql.cj.jdbc.Driver");
		conn = DriverManager.getConnection(url, uid, pwd);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
	%>
	<table border="1">
		<tr>
			<td>id</td>
			<td>A</td>
			<td>B</td>
			<td>no1</td>
			<td>no2</td>
			<td>no3</td>
			<td>no4</td>
			<td>정답</td>
		</tr>
		
		<form action="del.jsp" method = "post">	
			<p>ID &nbsp;&nbsp; &nbsp;
			<input type="text" name ="id">
			<input type="submit" value="삭제" >			
		</form>
		<form action="insert.jsp" method = "post">		
			<p>데이터    
			<input type="text" name ="count">
			<input type="submit" value="추가" >			
		</form>
			<p>
		<form action="file.jsp" method = "post">
		  	<input id="my-input" type="file" name ="file"/>
        	<input type="submit" value="파일 선택 완료" >
        </form>
		<p>
		<input type="button" value="로그인 페이지"  onclick="doAction()">	
	</p>	
		<% while (rs.next()) {%>	

		<tr>
			<td><%=rs.getString("id")%></td>
			<td><%=rs.getString("problem1")%></td>
			<td><%=rs.getString("problem2")%></td>
			<td><%=rs.getString("no1")%></td>
			<td><%=rs.getString("no2")%></td>
			<td><%=rs.getInt("no3")%></td>
			<td><%=rs.getInt("no4")%></td>
			<td><%=rs.getInt("answer")%></td>
		</tr>
		
		<%
		}
		if (rs != null) {
			rs.close();
		}
		if (stmt != null) {
			stmt.close();
		}
		if (conn != null) {
			conn.close();
		}		
		%>		
		
	<script>
	 function doAction() {
    	  location.href="login.jsp"; 
    }  
	</script>
	</table>
</body>
</html>