<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>  
<%@page import="DB.TestDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DB.TestDTO"%>
<%@ page import="java.util.*" %> 
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<!DOCTYPE htmlPUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>정보 입력 페이지</title>
</head>
<body>

	<form action="tentest.jsp" method = "post">	
		<br>
		<h2><center>문제 은행 입니다</h2>
		<center><p>이름
		<input type="text" name ="name">
		<br>
		<center><p>번호
		<input name ="pwd">
		<br>
		<center><input type="submit" value="시작" >			
	</form>
	<p>
	
	<br><br>
	<p>내 점수 조회 하기 / 관리자 모드 (admin)
	<p>이름
	<input id ="name">
	<input type="button" value="조회/접속"  onclick="doAction()">	
	</p>	
		
	<script>
	 function doAction() {
      var id = document.getElementById('name').value;
      if(id=="admin"){
    	  location.href="db.jsp";
      }
      else{  
    	  location.href ="score.jsp?id="+ id;
      } 
    }  
    
    </script> 
</body>
</html>