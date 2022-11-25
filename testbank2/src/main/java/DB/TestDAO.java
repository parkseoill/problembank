package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class TestDAO {
    private String url = "jdbc:mysql://localhost:3306/springboot-project";
    private String uid = "root";
    private String upw = "1234";
    
    public TestDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    	
    public ArrayList<TestDTO> memberSelect() {
        
        ArrayList<TestDTO> dtos = new ArrayList<TestDTO>();
        
        Connection con =null;
        Statement stmt = null;
        ResultSet rs = null;
        
        try {
            con = DriverManager.getConnection(url, uid, upw);
            stmt = con.createStatement();
            rs = stmt.executeQuery("select * from bank");
            
            while (rs.next()) {
                int id = rs.getInt("id");
                int problem1 = rs.getInt("problem1");
                int problem2 = rs.getInt("problem2");
                int no1 = rs.getInt("no1");
                int no2 = rs.getInt("no2");
                int no3 = rs.getInt("no3");
                int no4 = rs.getInt("no4");
                int answer = rs.getInt("answer");
                
                TestDTO dto = new TestDTO(id, problem1, problem2, no1, no2, no3, no4, answer);
                dtos.add(dto);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(rs != null) rs.close();
                if(stmt != null) stmt.close();
                if(con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }        
        return dtos;
    }
 
}
