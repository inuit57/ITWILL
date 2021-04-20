package com.itwillbs.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDAO {
	// Data Access Object : DB 데이터 처리 객체
	// => DB에 관련된 모든 동작을 수행하는 객체
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	// 디비연결 필요정보 
	public Connection getConnection(){
		//디비연결 필요정보(지역변수) 
//		String DRIVER = "com.mysql.jdbc.Driver";
//		String DBURL = "jdbc:mysql://localhost:3306/jspdb";
//		String DBID = "root";
//		String DBPW = "1234";
//		
//		try{
//			Class.forName(DRIVER); 
//			conn = DriverManager.getConnection(DBURL,DBID,DBPW) ; 
//			// try-catch 자동완성 F2 누르기. 
//		}catch (ClassNotFoundException e) {			
//			System.out.println("드라이버 로드 실패!");
//			e.printStackTrace();
//		}catch ( SQLException e){
//			System.out.println("디비 연결 실패!");
//			e.printStackTrace(); 
//		}
		
		try {
			//Context 객체를 생성 
			Context initCTX  = new InitialContext();
			
			// DB 연동 정보를 불러오기 (context.xml) 
			//initCTX.lookup("java:comp/env/" + context.xml에 적었던 name ); 
			DataSource ds =
			(DataSource)initCTX.lookup("java:comp/env/jdbc/mysqlDB");
			
			try {
				conn = ds.getConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		} catch (NamingException e) {
			e.printStackTrace();
		} 
		return conn ; 
	} //getConnection() end
	
	//DB close() 시작
	public void dbClose(){
		try {
			if(rs!=null) rs.close(); 
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close(); 
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	
	// 글쓰기 동작 => 메서드 insertBoard(BoardBean bb)
	/*
	public void insertBoard(BoardBean bb){
		try {
			// 1 드라이버 로드
			Class.forName(DRIVER);
			// 2 디비 연결
			conn = DriverManager.getConnection(DBURL, DBID, DBPW);
			// 3 sql 작성 (insert) & pstmt 객체 생성
			sql = "insert into itwill_board "
					+ "values(?,?,?,?,?,?,?,?,?,now(),?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			// ?
			pstmt.setInt(1, 1); // 여기에서 1을 강제로 넣고 있어서 다시 적는 거에서 문제가 된다. (PK 오류) 
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, bb.getReadcount());
			pstmt.setInt(7, bb.getRe_ref());
			pstmt.setInt(8, bb.getRe_lev());
			pstmt.setInt(9, bb.getRe_seq());
			pstmt.setString(10, bb.getIp());
			pstmt.setString(11, bb.getFile());
			
			// 4 sql 실행	
			
			pstmt.executeUpdate();
			
			System.out.println(" sql 구문 실행완료  : 글쓰기 완료! ");
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로드 실패!!");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("디비 연결 실패!!");
			e.printStackTrace();
		}
		
	}*/
	// 글쓰기 동작 => 메서드 insertBoard(BoardBean bb)
	

	
	public void insertBoard(BoardBean bb){
		int num = 0 ; 
		try {
			// 1. 드라이버 로드 & 2. 디비 연결
			conn = getConnection();
			
			sql = "select max(num) from itwill_board" ; 
			pstmt = conn.prepareStatement(sql); 
			
			ResultSet rs = pstmt.executeQuery() ; 
			if(rs.next()){
				num = rs.getInt(1) + 1; 
				System.out.println(num);
			}
			pstmt.close();
					
			// 3 sql 작성 (insert) & pstmt 객체 생성
			sql = "insert into itwill_board "
					+ "values(?,?,?,?,?,?,?,?,?,now(),?,?)";
			
			pstmt = conn.prepareStatement(sql);
			
			// ?
			pstmt.setInt(1, num);  
			// 문제점 PK값이라서 고정된 숫자를 넣으면 다음 글을 못 적는다.
			// 예상 해결 방안 
			// 1) DB를 수정 : Auto Increase로 만든다.
			// 2) Select Max(num) from itwill_board ; 구문으로 숫자를 뽑아오기 
			
			pstmt.setString(2, bb.getName());
			pstmt.setString(3, bb.getPass());
			pstmt.setString(4, bb.getSubject());
			pstmt.setString(5, bb.getContent());
			pstmt.setInt(6, bb.getReadcount());
			pstmt.setInt(7, bb.getRe_ref());
			pstmt.setInt(8, bb.getRe_lev());
			pstmt.setInt(9, bb.getRe_seq());
			pstmt.setString(10, bb.getIp());
			pstmt.setString(11, bb.getFile());
			
			// 4 sql 실행	
			
			pstmt.executeUpdate();
			
			System.out.println(" sql 구문 실행완료  : 글쓰기 완료! ");
			
		} catch (SQLException e) {
			System.out.println("디비 연결 실패!!");
			e.printStackTrace();
		}finally {
			//자원해제 
			try {
				pstmt.close();
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} 
			
		}
		
		// 커넥션풀 (Connection Pool) 
		// : 미리 연결정보(Connection)를 생성해서 저장 후 사용 (저장하는 곳 : pool)  
		// -> 사용 후 반납 
		
		// 먼저 온 놈부터 준다.
		// 다음에 온 사람은 반납될 때까지 대기
		// 만약 반납이 너무 안된다면 새로 만들어서 준다. 
		// 
		
	}
	
	public int getBoardCnt(){
		int cnt = 0 ;
		
		conn = getConnection();
		
		System.out.println("드라이버 로드, 디비 연결 성공!");
		System.out.println(conn);
		
		sql = "select count(*) from itwill_board"; 
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				cnt = rs.getInt(1) ;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			dbClose();
		}
		return cnt ; 
	}

}
