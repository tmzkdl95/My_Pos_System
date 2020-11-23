<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
</head>
<body>
		<form action = "memberJoin" method = "post" id = "userInfo">
			 ID : <input name="id" type="text" size="10"id="userID">
		 	 Password : <input name="passwd" type="text"size="10" id="userPW">
		 	 Mail : <input name="mail" type="text"size="10" id="userPW">
		 
		 <input type = "submit">
		</form>
</body>
</html>