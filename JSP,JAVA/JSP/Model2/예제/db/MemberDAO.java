package com.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	// 디비연결 필요정보 
	public Connection getConnection(){
		try {
			//Context 객체를 생성 
			Context initCTX  = new InitialContext();
			 
			DataSource ds =
			(DataSource)initCTX.lookup("java:comp/env/jdbc/model2DB");
			
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
	
	// 회원 가입
	public void insertMember(MemberDTO mdto){
		try {
			conn = getConnection(); 
			String sql = "insert into itwill_member(id,pass,name,age,gender,email,reg_date) values(?,?,?,?,?,?,?) ";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mdto.getId());
			pstmt.setString(2, mdto.getPass());
			pstmt.setString(3, mdto.getName());
			pstmt.setInt(4, mdto.getAge());
			pstmt.setString(5, mdto.getGender());
			pstmt.setString(6, mdto.getEmail());
			pstmt.setTimestamp(7, mdto.getReg_date());
			
			pstmt.executeUpdate(); 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			dbClose();
		}
		
	}
	// 회원 가입	

	public int idCheck(String id, String pass) {
		int check = -1; 
		
		try {
			conn = getConnection(); 
			String sql = "select pass from itwill_member where id =? ";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
						
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()){
				if( rs.getString("pass").equals(pass)){
					check = 1; 
				}else{
					check = 0; 
				}
			}
			
			System.out.println(" DAO : 로그인 처리 결과 :: " + check);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			dbClose(); 
		}
		
		// -1 : 아이디 없음 
		// 1 : 비밀번호 일치
		// 0 : 비밀번호 오류 
		return check ; 
	}
	
}
