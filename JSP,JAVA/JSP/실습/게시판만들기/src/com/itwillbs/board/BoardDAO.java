package com.itwillbs.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

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
			// mysqlDB : 여기 부분이 사용할 테이블명. 
			
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
			pstmt.setInt(7, num) ; // bb.getRe_ref()); //답글 작성용? num와 동일하게 
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
	// getBoardCnt() 
	
	//getBoardList()
	public ArrayList getBoardList(){
		ArrayList boardList = new ArrayList<>();
		conn = getConnection(); 
		System.out.println("드라이버 로드! DB 연결 성공!");
		System.out.println(conn);
		
		sql = "select * from itwill_board"; 
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			BoardBean bb = null ; 
			while(rs.next()){
				bb = new BoardBean(); 
				
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setDate(rs.getDate("date"));
				bb.setIp(rs.getString("ip"));
				bb.setFile(rs.getString("file"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				
			
				boardList.add(bb); 
			}// while 끝. 
			System.out.println("게시판 모든 정보 저장 완료");
			System.out.println("총 "+ boardList.size() + "개" );
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally{
			dbClose(); 
		}
		 
		return boardList ; 
	}
	
	public ArrayList getBoardList(int startRow, int pageSize){
		conn = getConnection(); 
		System.out.println("연결 성공!");
		
		ArrayList boardList = new ArrayList() ; 
		// 글 정보를 정렬 - re_ref 값을 최신글 위쪽으로 정렬. (내림차순) 
		// 				  - re_seq 값을 사용 (오름차순) 
		
		sql = "select * from itwill_board "
				+"order by re_ref desc , re_seq asc "
				+"limit ? , ? ";
		// limit a, b 
		// a : 시작 지점 , b : 개수 
		// a부터 b 개수만큼 잘라서 가져온다. 
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow-1);
			pstmt.setInt(2, pageSize);
			
//			sql = "select * from itwill_board order by re_ref desc , re_seq asc limit ? offset ? ";
			//offset을 쓰게 될 경우 순서를 바꿔준다.
//			pstmt.setInt(1, pageSize);
//			pstmt.setInt(2, startRow-1);
			
			ResultSet rs = pstmt.executeQuery();
			BoardBean bb = null ; 
			while(rs.next()){
				bb = new BoardBean(); 
				
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setDate(rs.getDate("date"));
				bb.setIp(rs.getString("ip"));
				bb.setFile(rs.getString("file"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				
			
				boardList.add(bb); 
			}// while 끝. 
			System.out.println("게시판 모든 정보 저장 완료");
			System.out.println("총 "+ boardList.size() + "개" );
		} catch (SQLException e) {			
			e.printStackTrace();
		} finally{
			dbClose(); 
		}
		 
		return boardList ; 
	 
	}//getBoardList
	
	//getBoard()
	public BoardBean getBoard(int num){
		BoardBean bb = null ;
		
		try {
			conn = getConnection(); 
			System.out.println("DB 연결 성공!");
			
			String sql = "select * from itwill_board where num = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			ResultSet rs = pstmt.executeQuery() ;
			
			if (rs.next()){
				bb = new BoardBean(); 
				bb.setNum(rs.getInt("num"));
				bb.setName(rs.getString("name"));
				bb.setPass(rs.getString("pass"));
				bb.setSubject(rs.getString("subject"));
				bb.setContent(rs.getString("content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setDate(rs.getDate("date"));
				bb.setIp(rs.getString("ip"));
				bb.setFile(rs.getString("file"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  finally{
			dbClose();
		}
		 
		return bb; 
	}
	//getBoard()
	
	//updateReadCount(int num); 
	public void updateReadCount(int num){
		
		try {
			conn = getConnection(); 
			System.out.println("DB 연결 완료! 업데이트 준비중");
			String sql = "update itwill_board "+
						 "set readcount= readcount+1 " + 
						 "where num = ?" ;
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.executeUpdate(); 
			
			System.out.println("업데이트 완료!");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			dbClose();
		}
	}//updateReadCount(int num);
	
	
	//updateBoard() 
	public void updateBoard(BoardBean bb){
		try {
			conn = getConnection(); 
			
			String sql = "update itwill_board " +
						 "set subject=? , content=? " + 
						 "where num=?"; 
			
		
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bb.getSubject());
			pstmt.setString(2, bb.getContent());
			pstmt.setInt(3, bb.getNum());
			
			pstmt.executeUpdate(); 
			System.out.println("업데이트 완료!!");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbClose();
		}
		
	} //updateBoard() 
	
}
