<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1> member/insertForm.jsp </h1>
<h2> 회원 가입 페이지 </h2>
<!--  아이디, 비밀번호, 이름, 나이, 성별(라디오 버튼) , 이메일  -->

<fieldset>
<legend>회원 가입</legend>
	<form action="insertPro.jsp" method="post">
		아이디 : <input type="text" name="id"> <br>
		비밀번호 : <input type="text" name="pw"> <br>
		이름 : <input type="text" name="name"> <br>
		나이 : <input type="number" name="age"><br>
		성별 : 남<input type="radio" name="gender" value="남"> 여<input type="radio" name="gender" value="여"> <br> 
		이메일 : <input type="email" name="email"> <br>
		<input type="submit" value="전송">
	</form>
</fieldset>
</body>
</html>