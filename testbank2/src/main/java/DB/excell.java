package DB;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jxl.Sheet;
import jxl.Workbook;

public class excell {
	
	private Connection conn; // DB 커넥션 연결 객체
	private static final String USERNAME = "root";// DBMS접속 시 아이디
	private static final String PASSWORD = "1234";// DBMS접속 시 비밀번호
	private static final String URL = "jdbc:mysql://localhost:3306/springboot-project";
	
	
	public void loadExcel(String url) {
		String fi = "D:\\Download\\"+ url;
		File f = new File(fi);
		Workbook wb = null;
		try {
			wb = Workbook.getWorkbook(f);
			Sheet s = wb.getSheet(0); // jxl.Sheet

			int i = 0; // 엑셀 시트내의 행번호 카운트 변수
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(URL, USERNAME, PASSWORD);

			while (true) {
				try {
					int a = Integer.parseInt(s.getCell(0, i).getContents());
					int b = Integer.parseInt(s.getCell(1, i).getContents());
					int n1 = Integer.parseInt(s.getCell(2, i).getContents());
					int n2 = Integer.parseInt(s.getCell(3, i).getContents());
					int n3 = Integer.parseInt(s.getCell(4, i).getContents());
					int n4 = Integer.parseInt(s.getCell(5, i).getContents());
					int result = Integer.parseInt(s.getCell(6, i).getContents());
					
					String sql = "insert into bank values(?,?,?,?,?,?,?,?)";
					PreparedStatement pstmt = null;
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, null);
					pstmt.setInt(2, a);
					pstmt.setInt(3, b);
					pstmt.setInt(4, n1);	
					pstmt.setInt(5, n2);
					pstmt.setInt(6, n3);
					pstmt.setInt(7, n4);
					pstmt.setInt(8, result);
				    pstmt.executeUpdate();			
					
				    i++;
					System.out.println();
				} catch (Exception e) {
					break; // 읽을 데이터가 더이상 없다면 while문 중지
				}
			}
		} catch (Exception e) {
			System.out.println("엑셀 파일 읽기 실패 ERR : " + e.getMessage());
		}		
	}
}
