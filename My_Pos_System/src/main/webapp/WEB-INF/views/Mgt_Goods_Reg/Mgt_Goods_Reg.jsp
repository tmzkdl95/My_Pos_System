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
					<div>
					    <!-- name�� VO���� ������ //id�� html���� ������  -->
					      ��ǰ ���ڵ� : <input name="goods_b_cd" type="text" size="10"id="user_name">
						��ǰ�ڵ� : <input name="goods_cd"type="text" size="10" id="content">
						��ǰ�� : <input name="goods_nm"type="text" size="10" id="content">
						��ǰ���� : <input name="goods_pri"type="text" size="10" id="content">
						<button type="submit">����</button>						
				   </div>
						
						
					</form>
				</div>
				<p>
			
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<thead>
						<tr>
						
							<th>��ǰ�ڵ�</th>
							<th>��ǰ��</th>
							<th>����</th>
						</tr>
					</thead>

					<tbody>
					
						<c:forEach items="${Mgt_Goods_Reg}" var="Mgt_Goods_Reg">
							<tr>
							
								<td>${Mgt_Goods_Reg.goods_cd}</td>
								<td>${Mgt_Goods_Reg.goods_nm}</td>
								<td>${Mgt_Goods_Reg.goods_pri}</td>
						
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
