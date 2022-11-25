<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.io.File"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="jxl.Sheet"%>
<%@ page import="jxl.Workbook"%>  
<%@ page import="DB.excell" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	//자바 파일 실행
	String url =  request.getParameter("file"); 
	excell a = new excell();
	a.loadExcel(url);
%>  
<%response.sendRedirect("db.jsp"); %>
<h2>
</h2>
</body>
</html>