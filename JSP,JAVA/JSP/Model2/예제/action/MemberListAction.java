package com.member.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.db.MemberDAO;
import com.member.db.MemberDTO;

public class MemberListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : MemberListAction_execute() 호출 ");
		
		// 세션 제어 ( 세션 + 관리자 ) 
		HttpSession session = request.getSession(); 
		ActionForward forward = new ActionForward(); 
		
		if(!("admin").equals(session.getAttribute("id"))){ 
			// 메인으로 사출. 
			forward.setPath("./Main.me");
			forward.setRedirect(false);
			return forward ; 
		}
		
		// DAO 객체 -> 회원정보 전부 가져오기 
		MemberDAO mdao = new MemberDAO(); 
		
		List<MemberDTO> mList = mdao.getMemberList(); 
		
		// list 정보를 저장 
		request.setAttribute("memberList", mList);
		
		// 페이지 이동 (forward -> ./member/list.jsp 
			
		forward.setPath("./member/list.jsp");
		forward.setRedirect(false);
		
		return forward; 
	}

}
