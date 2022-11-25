<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
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
<% 
 	request.setCharacterEncoding("euc-kr");
%> 
<html>
<head>
<meta ttp-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문제 은행 입니다.</title>
</head>
<body>
	<%
        TestDAO memberDAO = new TestDAO();
        ArrayList<TestDTO> dtos = memberDAO.memberSelect();
        
     	Random rand = new Random();
        int arr [] = new int [10];
        int problem1 [] = new int [10];
        int problem2 [] = new int [10];
        int no1 [] = new int [10];
        int no2 [] = new int [10];
        int no3 [] = new int [10];
        int no4 [] = new int [10];
        int answer [] = new int [10];
        int id [] = new int [10];
        
        Connection con =null;
        Statement stmt = null;
        ResultSet rs = null;
        
        String url = "jdbc:mysql://localhost:3306/springboot-project";
        String uid = "root";
        String upw = "1234";
        
        con = DriverManager.getConnection(url, uid, upw);
        stmt = con.createStatement();
        rs = stmt.executeQuery("select * from bank");
        
        int idcount= 0;
        //id 갯수 구하기
        while (rs.next()) {
        	idcount ++;
        }
        for (int i = 0; i<10; i++){
        	//id 값중에 10개만 뽑아오기
        	arr[i] = rand.nextInt(idcount);
        }
        
        for(int i=0; i<10; i++) {
            TestDTO dto = dtos.get(arr[i]);
            id[i] = dto.getId();
            problem1[i] = dto.getProblem1();
            problem2[i] = dto.getProblem2();
            no1[i] = dto.getNo1();
            no2[i] = dto.getNo2();
            no3[i] = dto.getNo3();
            no4[i] = dto.getNo4();
            answer[i] = dto.getAnswer();                   
        }
        request.setCharacterEncoding("utf-8");
        String name =  request.getParameter("name"); 
        String pwd =  request.getParameter("pwd"); 
       
      %> 
    <form action="totalscore.jsp" method = "POST">
    	<p>이름 : <%=name%>
		<p>번호 : <%=pwd%>
    	<br>
    	<h2><CENTER> 1번 문제 입니다.</h2> <p><CENTER>(A)<%= problem1[0]%> (B)<%= problem2[0]%> <p>A + B = ? <p> 1.<input type = "radio" name ="a0" value =<%= no1[0]%> required> <%= no1[0]%>  &nbsp;&nbsp;2.<input type = "radio" name ="a0" value =<%= no2[0]%>> <%= no2[0]%> &nbsp;&nbsp; 3. <input type = "radio" name ="a0" value =<%= no3[0]%>><%= no3[0]%> &nbsp;&nbsp; 4.  <input type = "radio" name ="a0" value =<%= no4[0]%>><%= no4[0]%><br><br>
    	<h2><CENTER> 2번 문제 입니다.</h2> <p><CENTER>(A)<%= problem1[1]%> (B)<%= problem2[1]%> <p>A + B = ? <p> 1.<input type = "radio" name ="a1" value =<%= no1[1]%> required> <%= no1[1]%>  &nbsp;&nbsp;2.<input type = "radio" name ="a1" value =<%= no2[1]%>> <%= no2[1]%> &nbsp;&nbsp; 3. <input type = "radio" name ="a1" value =<%= no3[1]%>><%= no3[1]%> &nbsp;&nbsp; 4.  <input type = "radio" name ="a1" value =<%= no4[1]%>><%= no4[1]%><br><br>
	    <h2><CENTER> 3번 문제 입니다.</h2> <p><CENTER>(A)<%= problem1[2]%> (B)<%= problem2[2]%> <p>A + B = ? <p> 1.<input type = "radio" name ="a2" value =<%= no1[2]%> required> <%= no1[2]%>  &nbsp;&nbsp;2.<input type = "radio" name ="a2" value =<%= no2[2]%>> <%= no2[2]%> &nbsp;&nbsp; 3. <input type = "radio" name ="a2" value =<%= no3[2]%>><%= no3[2]%> &nbsp;&nbsp; 4.  <input type = "radio" name ="a2" value =<%= no4[2]%>><%= no4[2]%><br><br>
		<h2><CENTER> 4번 문제 입니다.</h2> <p><CENTER>(A)<%= problem1[3]%> (B)<%= problem2[3]%> <p>A + B = ? <p> 1.<input type = "radio" name ="a3" value =<%= no1[3]%> required> <%= no1[3]%>  &nbsp;&nbsp;2.<input type = "radio" name ="a3" value =<%= no2[3]%>> <%= no2[3]%> &nbsp;&nbsp; 3. <input type = "radio" name ="a3" value =<%= no3[3]%>><%= no3[3]%> &nbsp;&nbsp; 4.  <input type = "radio" name ="a3" value =<%= no4[3]%>><%= no4[3]%><br><br>
		<h2><CENTER> 5번 문제 입니다.</h2> <p><CENTER>(A)<%= problem1[4]%> (B)<%= problem2[4]%> <p>A + B = ? <p> 1.<input type = "radio" name ="a4" value =<%= no1[4]%> required> <%= no1[4]%>  &nbsp;&nbsp;2.<input type = "radio" name ="a4" value =<%= no2[4]%>> <%= no2[4]%> &nbsp;&nbsp; 3. <input type = "radio" name ="a4" value =<%= no3[4]%>><%= no3[4]%> &nbsp;&nbsp; 4.  <input type = "radio" name ="a4" value =<%= no4[4]%>><%= no4[4]%><br><br>
		<h2><CENTER> 6번 문제 입니다.</h2> <p><CENTER>(A)<%= problem1[5]%> (B)<%= problem2[5]%> <p>A + B = ? <p> 1.<input type = "radio" name ="a5" value =<%= no1[5]%> required> <%= no1[5]%>  &nbsp;&nbsp;2.<input type = "radio" name ="a5" value =<%= no2[5]%>> <%= no2[5]%> &nbsp;&nbsp; 3. <input type = "radio" name ="a5" value =<%= no3[5]%>><%= no3[5]%> &nbsp;&nbsp; 4.  <input type = "radio" name ="a5" value =<%= no4[5]%>><%= no4[5]%><br><br>
		<h2><CENTER> 7번 문제 입니다.</h2> <p><CENTER>(A)<%= problem1[6]%> (B)<%= problem2[6]%> <p>A + B = ? <p> 1.<input type = "radio" name ="a6" value =<%= no1[6]%> required> <%= no1[6]%>  &nbsp;&nbsp;2.<input type = "radio" name ="a6" value =<%= no2[6]%>> <%= no2[6]%> &nbsp;&nbsp; 3. <input type = "radio" name ="a6" value =<%= no3[6]%>><%= no3[6]%> &nbsp;&nbsp; 4.  <input type = "radio" name ="a6" value =<%= no4[6]%>><%= no4[6]%><br><br>
		<h2><CENTER> 8번 문제 입니다.</h2> <p><CENTER>(A)<%= problem1[7]%> (B)<%= problem2[7]%> <p>A + B = ? <p> 1.<input type = "radio" name ="a7" value =<%= no1[7]%> required> <%= no1[7]%>  &nbsp;&nbsp;2.<input type = "radio" name ="a7" value =<%= no2[7]%>> <%= no2[7]%> &nbsp;&nbsp; 3. <input type = "radio" name ="a7" value =<%= no3[7]%>><%= no3[7]%> &nbsp;&nbsp; 4.  <input type = "radio" name ="a7" value =<%= no4[7]%>><%= no4[7]%><br><br>
		<h2><CENTER> 9번 문제 입니다.</h2> <p><CENTER>(A)<%= problem1[8]%> (B)<%= problem2[8]%> <p>A + B = ? <p> 1.<input type = "radio" name ="a8" value =<%= no1[8]%> required> <%= no1[8]%>  &nbsp;&nbsp;2.<input type = "radio" name ="a8" value =<%= no2[8]%>> <%= no2[8]%> &nbsp;&nbsp; 3. <input type = "radio" name ="a8" value =<%= no3[8]%>><%= no3[8]%> &nbsp;&nbsp; 4.  <input type = "radio" name ="a8" value =<%= no4[8]%>><%= no4[8]%><br><br>
		<h2><CENTER>10번 문제 입니다.</h2> <p><CENTER>(A)<%= problem1[9]%> (B)<%= problem2[9]%> <p>A + B = ? <p> 1.<input type = "radio" name ="a9" value =<%= no1[9]%> required> <%= no1[9]%>  &nbsp;&nbsp;2.<input type = "radio" name ="a9" value =<%= no2[9]%>> <%= no2[9]%> &nbsp;&nbsp; 3. <input type = "radio" name ="a9" value =<%= no3[9]%>><%= no3[9]%> &nbsp;&nbsp; 4.  <input type = "radio" name ="a9" value =<%= no4[9]%>><%= no4[9]%><br><br>
	
		<input type = "hidden" name ="ans0" value =<%= answer[0]%>>
		<input type = "hidden" name ="ans1" value =<%= answer[1]%>>
		<input type = "hidden" name ="ans2" value =<%= answer[2]%>>
		<input type = "hidden" name ="ans3" value =<%= answer[3]%>>
		<input type = "hidden" name ="ans4" value =<%= answer[4]%>>
		<input type = "hidden" name ="ans5" value =<%= answer[5]%>>
 		<input type = "hidden" name ="ans6" value =<%= answer[6]%>>
		<input type = "hidden" name ="ans7" value =<%= answer[7]%>>
		<input type = "hidden" name ="ans8" value =<%= answer[8]%>>	
		<input type = "hidden" name ="ans9" value =<%= answer[9]%>>	
		<input type = "hidden" name ="name" value =<%=name%>>
		<input type = "hidden" name ="pwd" value =<%=pwd%>>
		
		<input type="submit" value="제출" >
	</form>
	
</body>
</html>