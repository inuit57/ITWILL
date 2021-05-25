package com.member.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.db.MemberDAO;
import com.member.db.MemberDTO;

public class MemberJoinAction implements Action {

	// 회원 가입에 대한 처리 
	
	// 1) 전달된 정보 저장
	
	// 2) DB에 저장
	
	// 3) 페이지 이동(컨트롤러가 이동할 준비 ) 
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : MemberJoinAction_execute() 호출!!");
		
		//전달된 정보 (파라미터 저장) 
		MemberDTO mdto = new MemberDTO(); 
		
		request.setCharacterEncoding("UTF-8");
		
		mdto.setId(request.getParameter("id"));
		mdto.setAge(Integer.parseInt(request.getParameter("age")));
		mdto.setPass(request.getParameter("pass"));
		mdto.setEmail(request.getParameter("email"));
		mdto.setGender(request.getParameter("gender")); 
		mdto.setName(request.getParameter("name"));
		mdto.setReg_date( new Timestamp(System.currentTimeMillis()) );
		
		// DB 에 저장 
		MemberDAO mdao = new MemberDAO(); 
		// 회원가입 메서드 - insertMember(mdto) ; 
		mdao.insertMember(mdto);
		
		// 페이지 이동 (ActionForward 객체) 
		
		ActionForward af = new ActionForward(); 
		af.setPath("./MemberLogin.me");
		af.setRedirect(true);
		
		
		return af; 
	}

	

}
