package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.db.MemberDAO;

public class MemberDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession(); 
		
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id"); 
		String pass = request.getParameter("pass"); 
		
		MemberDAO mdao = new MemberDAO(); 
		
		int check = mdao.deleteMember(id, pass);
		
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
			
		}else{ 		// 컨트롤러 O  - 탈퇴 성공
			ActionForward forward = new ActionForward(); 
			
			session.invalidate();
			
			forward.setPath("./Main.me");
			forward.setRedirect(true);
			return forward; 
		}
		
		return null;
	}

}
