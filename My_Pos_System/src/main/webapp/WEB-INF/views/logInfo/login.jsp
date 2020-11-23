<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인</title>
</head>
<body>

	<div>
	<form action="${ loginProcessingUrl }" method="post">
    <div class="form-group form-group-lg">
        <div class="form-group">
            <label>사용자명</label>
            <input type="text" name="user_id" class="form-control" placeholder="아이디">
        </div>
        <div class="form-group">
            <label>비밀번호</label>
            <input type="password" name="user_pw" class="form-control" placeholder="비밀번호">
        </div>
        <div class="form-group">
            <input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }" >
        </div>
        <div class="form-action">
            <sec:csrfInput />
            <input type="submit" class="btn btn-primary btn-lg" value="로그인">
        </div>
    </div>
	</form>
		 
		 <a href="memberJoin">회원가입</a>
	</div>
</body>
</html>