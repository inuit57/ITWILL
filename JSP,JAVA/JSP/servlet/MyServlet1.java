package com.itwillbs.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyServlet1 extends HttpServlet {

	private int cnt =0 ; 
	// 페이지에 방문한 방문자 수 카운트 - 서블릿 페이지
	
	@Override
	public void init() throws ServletException {
		System.out.println("서블릿 초기화(1회 실행)");
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("get방식 호출");
		
		cnt ++ ;
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter(); 
		out.print("<html>");
		out.print("<head><title>테스트</title></head>");
		out.print("<body>");
		out.print("<h1>Hello 방문자수 : "+ cnt +" 명</h1>");
		out.print("</body>");
		out.print("</html>"); 
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("post방식 호출");
	}

	@Override
	public void destroy() {

	}
	
	
}
