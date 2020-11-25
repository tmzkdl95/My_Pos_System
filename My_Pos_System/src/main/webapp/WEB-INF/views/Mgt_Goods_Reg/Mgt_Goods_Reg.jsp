<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="container-fluid">

	<!-- Breadcrumbs-->
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">��ǰ��� ȭ��</a></li>
		
	</ol>

	<!-- DataTables Example -->
	<div class="card mb-3">
		<div class="card-header">
			<i class="fas fa-table"></i> ��ǰ���� ��� 
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<p>			
				<div class="insertData">					
					<form action='<c:url value="/Mgt_Goods_Reg/insert_data" />' method="post" id="insert_data">
						User_name : <input name="user_name" type="text" size="10"id="user_name">
						content : <input name="content"type="text" size="10" id="content">
						<!-- name�� VO���� ������ //id�� html���� ������ -->
						<button type="submit">����</button>
					</form>
				</div>
				<p>
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>id</th>
							<th>user_name</th>
							<th>content</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${testpage}" var="testpage">
							<tr>
								<td>${testpage.id}</td>
								<td>${testpage.user_name}</td>
								<td>${testpage.content}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!--table-responsive  -->
		</div>
		<!-- card-body -->
	</div><!-- card mb-3 -->
</div><!-- container-fluid -->
