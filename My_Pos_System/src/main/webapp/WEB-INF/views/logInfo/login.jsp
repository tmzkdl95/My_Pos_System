<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α���</title>
</head>
<body>

	<div>
	<form action="${ loginProcessingUrl }" method="post">
    <div class="form-group form-group-lg">
        <div class="form-group">
            <label>����ڸ�</label>
            <input type="text" name="user_id" class="form-control" placeholder="���̵�">
        </div>
        <div class="form-group">
            <label>��й�ȣ</label>
            <input type="password" name="user_pw" class="form-control" placeholder="��й�ȣ">
        </div>
        <div class="form-group">
            <input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }" >
        </div>
        <div class="form-action">
            <sec:csrfInput />
            <input type="submit" class="btn btn-primary btn-lg" value="�α���">
        </div>
    </div>
	</form>
		 
		 <a href="memberJoin">ȸ������</a>
	</div>
</body>
</html>