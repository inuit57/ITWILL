# Session 활용한 로그인/로그아웃 처리 


#sessionLoginForm.jsp
- 아이디 / 비밀번호 입력받기
- sessionLoginPro.jsp 로 해당 정보를 전송


#sessionLoginPro.jsp 
- 들어온 아이디/비밀번호 정보 확인
- session에 id 정보를 저장
- sessionMain.jsp 로 이동 (로그인 성공시)
- sessionLoginForm.jsp로 이동 (로그인 실패시) , 적절한 경고 메시지도 출력


#sessionMain.jsp 
- 로그아웃 버튼 존재 
- sessionLogout.jsp 로 이동(버튼 누를 경우)

#sessionLogout.jsp 
- session에 저장된 id 정보를 삭제
- 이후 sessionLoginForm.jsp로 이동. 
