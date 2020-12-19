<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<body onload = "pginit()">
<script src="js/common/saleMap.js"></script>

<script language="javascript">

function pginit(){

	
}

//상품코드를 셋팅하는 함수
function setGoodsCd(obj){
	var goods_cd = ""; //초기화	
	var goodsInf = obj.value;
	goodsInf = goodsInf.replace("[","").replace("CmCd_VO","").replace("]","").replace("cm_cd=","").replace("cm_nm=","").replace("cm_full_cd=","").replace("cm_typ=","").replace("last_cm_cd=","").replace(/ /g,"").replace(/=/g,",");
	var goodsInf_arr = goodsInf.split(",");
	//[0] = cm_cd 
	//[1] = cm_nm 
	//[2] = cm_full_cd
	//[3] = cm_typ
	//[4] = last_cm_cd
	var num = goodsInf_arr[4];
	if(num == "null"){		
		num = 0;
		console.log("null! "+num);
	}else{
		console.log("num:");
		num = Number(goodsInf_arr[4]);
	}
	num++;
	//String 변환
	if(num < 10){
		num = "00"+num;
	}else if(num <100){
		num = "0"+num;
	}else{
		num = ""+num;
	}
	
	goods_cd = goodsInf_arr[0]+num;   
	insert_data.goods_cd.value = goods_cd ;     //goods_cd
	insert_data.cm_cd.value = goodsInf_arr[0] ; //cm_cd
	insert_data.last_cm_cd.value = num; //cm_last_cd

}

function fnNullCk(){
	var ck = insert_data.goods_b_cd.value;	
	var selectBox = document.getElementById('select_cm_cd');
	var ck_goods_cd = selectBox.options[selectBox.selectedIndex].value;
		
	 if(!ck){
		 alert("바코드를 입력하세요.");
		 return false;
	 }else{
		if(ck_goods_cd=="선택"){
			alert("상품코드를 선택하세요.");
			return false;
		}else{		 
		  document.getElementById('insert_data').submit();
		}
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
					      상품코드 :
					    <select id ="select_cm_cd" onchange ="setGoodsCd(this)" >
					            <option value = "선택" selected>선택</option>
						    <c:forEach items="${ret_CmCd}" var="ret_CmCd">
								<option value = "${ret_CmCd}">
								   ${ret_CmCd.cm_nm}
								</option>
							</c:forEach>
					    </select>
						<input name="goods_cd"type="text" size="10" id="goods_cd" value = "">
						상품명 : <input name="goods_nm"type="text" size="10" id="goods_nm">
						상품가격 : <input name="goods_pri"type="text" size="10" id="goods_pri">
						<input  name="cm_cd" type="hidden" id="cm_cd" value="" >
						<input  name="last_cm_cd" type="hidden" id="last_cm_cd" value="" >
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
							    <td>${Mgt_Goods_Reg.goods_b_cd}</td>
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
