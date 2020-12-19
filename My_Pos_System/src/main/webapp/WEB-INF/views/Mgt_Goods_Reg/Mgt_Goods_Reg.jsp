<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<body onload = "pginit()">
<script src="js/common/saleMap.js"></script>

<script language="javascript">

function pginit(){

	
}

//��ǰ�ڵ带 �����ϴ� �Լ�
function setGoodsCd(obj){
	var goods_cd = ""; //�ʱ�ȭ	
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
	//String ��ȯ
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
		 alert("���ڵ带 �Է��ϼ���.");
		 return false;
	 }else{
		if(ck_goods_cd=="����"){
			alert("��ǰ�ڵ带 �����ϼ���.");
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
					<form action='<c:url value="/Mgt_Goods_Reg/insert_data" />' method="post" id="insert_data" accept-charset="UTF-8">
					<div>
					    <!-- name�� VO���� ������ //id�� html���� ������  -->
					      ��ǰ ���ڵ� : <input name="goods_b_cd" type="text" size="10"id="goods_b_cd">
					      ��ǰ�ڵ� :
					    <select id ="select_cm_cd" onchange ="setGoodsCd(this)" >
					            <option value = "����" selected>����</option>
						    <c:forEach items="${ret_CmCd}" var="ret_CmCd">
								<option value = "${ret_CmCd}">
								   ${ret_CmCd.cm_nm}
								</option>
							</c:forEach>
					    </select>
						<input name="goods_cd"type="text" size="10" id="goods_cd" value = "">
						��ǰ�� : <input name="goods_nm"type="text" size="10" id="goods_nm">
						��ǰ���� : <input name="goods_pri"type="text" size="10" id="goods_pri">
						<input  name="cm_cd" type="hidden" id="cm_cd" value="" >
						<input  name="last_cm_cd" type="hidden" id="last_cm_cd" value="" >
						<button type="button" onclick="fnNullCk()">����</button>						
				   </div>
						
						
					</form>
				</div>
				<p>
			
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<thead>
						<tr>
							<th>��ǰ���ڵ�</th>
							<th>��ǰ�ڵ�</th>
							<th>��ǰ��</th>
							<th>����</th>
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
