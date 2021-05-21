package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.db.MemberDAO;

public class MemberLoginAction implements Action {

	@Override
	public ActionFoward exectue(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : MemberLoginAction_execute() 실행");
		
		// 전달 정보 저장 (id, pass) 
		String id = request.getParameter("id"); 
		String pass = request.getParameter("pass"); 
		
		// DAO 객체 생성 -> idCheck(id, pass) ; 
		MemberDAO mdao = new MemberDAO(); 
		// DB에서 조회 후 처리
		int check = mdao.idCheck(id, pass) ;
		
		// 결과에 따른 페이지 이동 
		
		// 컨트롤러 X - 비밀번호/아이디 오류( javascript ) 
		// 페이지 이동 X !!  - forward == null 인 상황
		if( check == 0){ // 비밀번호 오류 - 뒤로 가기 
			response.setContentType("text/html;charset=utf-8"); 
			PrintWriter out = response.getWriter(); 
			out.print("<script>");
			out.print(" alert('비밀번호가 다릅니다.');  ");
			out.print(" history.back(); ");
			out.print("</script>");
			out.close();
		}else if(check == -1){ // 아이디 오류 - 뒤로 가기 
			response.setContentType("text/html;charset=utf-8"); 
			PrintWriter out = response.getWriter(); 
			out.print("<script>");
			out.print(" alert('가입된 회원정보가 없습니다.'); ");
			out.print(" history.back(); ");
			out.print("</script>");
			out.close();
			
		}else{ 		// 컨트롤러 O  - 로그인 성공
			HttpSession session = request.getSession();
			session.setAttribute("id", id);
			
			ActionFoward forward = new ActionFoward(); 
			
			forward.setPath("./Main.me");
			forward.setRedirect(true);
			return forward; 
		}
		return null ; 
	} // 로그인 처리 끝.
	
}
