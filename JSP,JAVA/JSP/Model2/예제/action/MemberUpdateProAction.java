package com.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.member.db.MemberDAO;
import com.member.db.MemberDTO;

public class MemberUpdateProAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : MemberUpdateProAction_execute() 호출! ");
		
		// 세션 제어 
		HttpSession session = request.getSession(); 
		ActionForward forward = new ActionForward(); 
		
		String id = (String)session.getAttribute("id"); 
		
		if(id == null){
			forward.setPath("./Main.me");
			forward.setRedirect(true);
			return forward; 
		}
		// 한글처리 
		request.setCharacterEncoding("UTF-8");
		// 전달된 정보를 저장 
		MemberDTO mdto = new MemberDTO(); 
		mdto.setAge(Integer.parseInt(request.getParameter("age")));
		mdto.setEmail(request.getParameter("email"));
		mdto.setGender(request.getParameter("gender"));
		mdto.setId(request.getParameter("id"));
		mdto.setName(request.getParameter("name"));
		mdto.setPass(request.getParameter("pass"));
		
		MemberDAO mdao = new MemberDAO(); 
		int result = mdao.updateMemeber(mdto);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter(); 
		out.print("<script>");
		if(result == 0){ 
			out.print(" alert('비밀번호 오류입니다.');");
			out.print(" history.back();" ); 
		}else if(result == -1){
			out.print(" alert('아이디 오류입니다.');"); 
			out.print(" history.back();"); 
		}else{
			out.print(" alert('정보 업데이트 완료!');"); 
			out.print(" location.href= './Main.me';"); 
		}
		out.print("</script>");
		
		//DAO 생성 -> updateMember(DTO) 
		// 수정 결과에 따른 페이지 이동 
		// 0 : 비밀번호 오류, 1 : 수정완료, -1 : 아이디없음.
		// => 자바스크립트 사용 이동 
		
		
		return null;
	}
	
	

}
