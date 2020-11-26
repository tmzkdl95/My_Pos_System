<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script language="javascript">
 function fnNullCk(){
	var ck = insert_data.goods_b_cd.value;
	 if(!ck){
		 alert("바코드를 등록하세요!!!");
		 return false;
	 }else{
		 document.getElementById('insert_data').submit();
	 }
 }
</script>
<div class="container-fluid">

	<!-- Breadcrumbs-->
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">상품등록 화면</a></li>
		
	</ol>

	<!-- DataTables Example -->
	<div class="card mb-3">
		<div class="card-header">
			<i class="fas fa-table"></i> 상품정보 등록 
		</div>
		<div class="card-body">
			<div class="table-responsive">
			 
				<p>			
				<div class="insertData">					
					<form action='<c:url value="/Mgt_Goods_Reg/insert_data" />' method="post" id="insert_data" accept-charset="UTF-8">
					<div>
					    <!-- name은 VO에서 구분자 //id는 html내의 구분자  -->
					      상품 바코드 : <input name="goods_b_cd" type="text" size="10"id="goods_b_cd">
						상품코드 : <input name="goods_cd"type="text" size="10" id="goods_cd">
						상품명 : <input name="goods_nm"type="text" size="10" id="goods_nm">
						상품가격 : <input name="goods_pri"type="text" size="10" id="goods_pri">
						<button type="button" onclick="fnNullCk()">저장</button>						
				   </div>
						
						
					</form>
				</div>
				<p>
			
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>상품바코드</th>
							<th>상품코드</th>
							<th>상품명</th>
							<th>가격</th>
						</tr>
					</thead>

					<tbody>
					
						<c:forEach items="${Mgt_Goods_Reg}" var="Mgt_Goods_Reg">
							<tr>
							    <td>${Mgt_Goods_Reg.goods_cd}</td>
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
