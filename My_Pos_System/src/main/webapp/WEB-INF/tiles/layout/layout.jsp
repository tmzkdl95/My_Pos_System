<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix = "tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    
    <!-- Bootstrap core CSS-->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

    <!-- Page level plugin CSS-->
    <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

	<!-- Custom styles for this template -->
	<link href="vendor/bootstrap/css/sb-admin.css" rel="stylesheet">
    <!-- Custom styles for this template 
    <link href="css/sb-admin.css" rel="stylesheet"> -->
</head>
<body>

	<div id="header">
			<tiles:insertAttribute name="header" />
	</div>
	<div id ="wrapper">	
			<tiles:insertAttribute name="sidebar" />
			<!-- <div class="content-wrapper"> -->			
				<tiles:insertAttribute name="content" />
				<tiles:insertAttribute name="footer" />			
			<!-- </div><!-- content-wrapper -->				
	</div><!-- wrapper -->
			<tiles:insertAttribute name="footer-menu" />

</body>
</html>