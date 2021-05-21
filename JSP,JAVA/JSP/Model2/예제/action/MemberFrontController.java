package com.member.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


// 개발에서 사용되는 중요 개념 => 도메인 

// 컨트롤러 -> 서블릿 


public class MemberFrontController extends HttpServlet{


	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("C : MemberFrontController_doProcess() 호출");
	
		// get 방식이든 post 방식이든 상관없이 동일하게 같이 동작하도록 
		
		/******************************1. 페이지 주소 파싱 ********************************/
		
		// 가상 주소를 가져오기 (페이지에 표시되는 주소) : .html , .jsp 가 아닌 주소는 모두 가상 주소.
		
		String requestURI = request.getRequestURI() ;  
//		String requestURL = request.getRequestURL()+"";
		
		System.out.println("C - URI : " + requestURI); // -> http://localhost:8088 정보가 빠진 것
//		System.out.println("URL : " + requestURL); // -> 주소창에 있는 정보 전체
		
		// 프로젝트명(context 명)
		String contextPath = request.getContextPath(); 
		System.out.println("C : " + contextPath);
		
		// 프로젝트 명을 제외한 가상 주소 
		String command = requestURI.substring(contextPath.length()); // 길이만큼 이동하고 잘라내기 
		System.out.println("command :"+ command);
		
		/******************************1. 페이지 주소 파싱 ********************************/
		
		/******************************2. 페이지 주소 매핑(연결) ********************************/
		
		// DB 사용 여부에 따라서 페이지 구성 
		ActionFoward forward = null ; 
		Action action = null ; 
		
		if(command.equals("/MemberJoin.me")){
			// 회원가입 페이지 -> View 페이지 
			
			// 1. response 이동 (주소 , 페이지 모두 변경)
			//    response.sendRedirect("주소");

			
			// 2. forward 이동 ( 페이지만 변경, 주소는 그대로)
//			RequestDispatcher dis = request.getRequestDispatcher("주소");
//			dis.forward(request,response); 
			
			System.out.println("2 : memberjoin 페이지 호출 되었습니다. \n\n");
			forward = new ActionFoward();
			forward.setPath("./member/insertForm.jsp");
			forward.setRedirect(false);
		}else if ( command.equals("/MemberJoinAction.me")){
			System.out.println("2 : MemberJoinAction.me 호출");
			
			// 회원가입 처리 -> 별도의 객체를 생성 -> 동작 실행 
			try{
				
				action = new MemberJoinAction(); 
				
				action.exectue(request, response); 
				forward = action.exectue(request, response); 
			}catch (Exception e) {
				e.printStackTrace(); 
			}
			
		}else if(command.equals("/MemberLogin.me")){
			System.out.println("C: /MemberLogin.me 호출");
			// 화면을 보여주기 => view 페이지로 이동 
			
			 
			forward = new ActionFoward(); 
			forward.setPath("./member/loginForm.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/MemberLoginAction.me")){
			System.out.println("c: /MemberLoginAction.me 호출");
			
			// DB 사용 
			action = new MemberLoginAction(); 

			try {
				forward = action.exectue(request, response);
				
				
			} catch (Exception e) {
				e.printStackTrace();
			} 
			
		}else if(command.equals("/Main.me")){
			System.out.println("C : /Main.me 호출");
			
			forward = new ActionFoward(); 
			forward.setPath("./main/main.jsp");
			forward.setRedirect(false);
		}
		
		
		/******************************2. 페이지 주소 매핑(연결) ********************************/
		
		/******************************3. 페이지 주소 이동 ********************************/
		if( forward != null){
			if(forward.isRedirect()){
				// sendRedirect
				System.out.println("@@@@@@@@@@ sendRedirect() 이동\n\n\n");
				response.sendRedirect(forward.getPath());
			}else{
				// forward
				System.out.println("@@@@@@@@@@ forward() 이동\n\n\n");
				RequestDispatcher dis = request.getRequestDispatcher(forward.getPath()); 
				dis.forward(request, response);
			}
		}
		
		/******************************3. 페이지 주소 이동 ********************************/
	}
	
	@Override
	protected void doGet(HttpServletRequest request , HttpServletResponse response) throws ServletException, IOException {
		System.out.println("C : MemberFrontController_doGet() 호출\n\n\n");
		doProcess(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("C : MemberFrontController_doPost() 호출\n\n\n");
		doProcess(request, response);
	}
	
	

}
