package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Random;

public class inputDB {

	public static void main(String[] args) {

		inputDB db = new inputDB();
		db.insertBoard();
	}
	
	private Connection conn; // DB 커넥션 연결 객체
	private static final String USERNAME = "root";// DBMS접속 시 아이디
	private static final String PASSWORD = "1234";// DBMS접속 시 비밀번호
	private static final String URL = "jdbc:mysql://localhost:3306/springboot-project";// DBMS접속할 db명

	public inputDB() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);
		} catch (Exception e) {
			System.out.println("드라이버 로딩 실패 ");
			try {
				conn.close();
			} catch (SQLException e1) {
			  }
		}

	}

	int idcount = 1;

	public void insertBoard() {
		while (idcount < 101) {

			String sql = "insert into bank values(?,?,?,?,?,?,?,?)";

			Random rand = new Random();
			int problem1 = rand.nextInt(100);
			int problem2 = rand.nextInt(100);
			int shuffle = rand.nextInt(4);
			int answer=0;
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

			PreparedStatement pstmt = null;
			try {

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idcount);
				pstmt.setInt(2, problem1);
				pstmt.setInt(3, problem2);
				pstmt.setInt(4, no1);	
				pstmt.setInt(5, no2);
				pstmt.setInt(6, no3);
				pstmt.setInt(7, no4);
				pstmt.setInt(8, answer);
				int result = pstmt.executeUpdate();
				idcount++;
				if (result == 1) {
					System.out.println("Board데이터 삽입 성공!");				
				}

			} catch (Exception e) {
				System.out.println(e);
			} finally {
				try {
					if (pstmt != null && !pstmt.isClosed()) {
						pstmt.close();
					}
				} catch (Exception e2) {
				}
			}
		}
	}
}
