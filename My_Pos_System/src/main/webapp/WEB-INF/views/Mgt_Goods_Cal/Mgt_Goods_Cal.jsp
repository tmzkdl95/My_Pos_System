<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script language="javascript">
 function fnNullCk(){
	var ck = retrieve_data.goods_b_cd.value;
	 if(!ck){
		 alert("바코드를 등록하세요!!!");
		 return false;
	 }else{
		 document.getElementById('retrieve_data').submit();
	 }
 }
</script>
<div class="container-fluid">

	<!-- Breadcrumbs-->
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">계산 화면</a></li>
		
	</ol>

	<!-- DataTables Example -->
	<div class="card mb-3">
		<div class="card-header">
			<i class="fas fa-table"></i> 계산 
		</div>
		<div class="card-body">
			<div class="table-responsive">
			 
				<p>			
				<div class="insertData">					
					<form action='<c:url value="/Mgt_Goods_Cal_retrieve" />' method="post" id="retrieve_data" accept-charset="UTF-8">
					  <div>
					    <!-- name은 VO에서 구분자 //id는 html내의 구분자  -->
					      상품 바코드 : <input name="goods_b_cd" type="text" size="10"id="goods_b_cd">					
						<button type="button" onclick="fnNullCk()">조회</button>						
				      </div>
					</form>
				</div>
				<p>
			
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>상품명</th>
							<th>수량</th>							
							<th>가격</th>
						</tr>
					</thead>

					<tbody>
					
						<c:forEach items="${Mgt_Goods_Cal}" var="Mgt_Goods_Cal">
							<tr>
								<td>${Mgt_Goods_Cal.goods_nm}</td>
								<td></td>
								<td>${Mgt_Goods_Cal.goods_pri}</td>
						
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
