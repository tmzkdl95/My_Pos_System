<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">

<body onload = "pginit()">
<script src="js/common/saleMap.js"></script>
<script language="javascript">
var cnt = 0;
var saleInfo_all_arr = Array();
function pginit(){

}


function exec_DataAdd(result){
	
	//1.result�� "[]",���� ���� �� "=" -> "," ġȯ �۾�  
    var saleInfo = result.replace("[","").replace("]","").replace(/ /g,"").replace(/=/g,",");
    //2."," �������� �迭 ����
    var saleInfo_arr = saleInfo.split(",");   

    //3.saleInfo_all_arr�� ��ȸ�ؿ��� �� ��� ���� : Ȧ�� = goods_nm / ¦�� = goods_pri
    cnt = cnt+2;
    saleInfo_all_arr.push(saleInfo_arr[1],saleInfo_arr[3]);   
    
    
    //4.Table ��� jQuery 
    $(document).ready(function() {
    	
        var $listTbody = $(".saleTable tbody");        
        $listTbody.empty(); //�ʱ�ȭ
        
        var len = saleInfo_all_arr.length;       
        var i = 0;     
        while(i<len){
        	console.log ("len : "+len+", i : "+i);
            $listTbody.append("<tr><td>" + saleInfo_all_arr[i] + "</td> <td> 0 </td> <td>" + saleInfo_all_arr[i+1] + "</td></tr>");
            i = i+2;
        }
        $listTbody.append("<tr><td> �� �� </td> <td colspan ='2'> 1 </td></tr>");
    });
    
}

 function fnNullCk(){
	 var ck = retrieve_data.goods_b_cd.value;	
	 var result = "";
	 if(!ck){
		 alert("���ڵ带 ����ϼ���!!!");
		 return false;
	 }else{
		 //����,�̸� Ajax�� ��ȸ�ؿ���
		    $.ajax({
		        url: "Mgt_Goods_Cal/retrieve",
		        type: "POST",		        
		        data: {
		        	goods_b_cd:ck
		        },
		        async: false,
		        success: function(data){
		        	//��ȸ ������ exec_DataAdd ����
		        	exec_DataAdd(data);
		            console.log($.trim(data));		           
		        },
		        error: function(){
		            alert("err"); 
		        }
		  	});

	 }
 }

 
 
</script>
<div class="container-fluid">

	<!-- Breadcrumbs-->
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">��� ȭ��</a></li>
		
	</ol>

	<div class="card mb-3">
		<div class="card-header">
			<i class="fas fa-table"></i> ��� 
		</div>
		<div class="card-body">
			<div class="table-responsive">
			 
				<p>			
				<div class="insertData">					
					<form action='<c:url value="/Mgt_Goods_Cal_retrieve" />' method="post" id="retrieve_data" accept-charset="UTF-8">
					  <div>
					    <!-- name�� VO���� ������ //id�� html���� ������  -->
					      ��ǰ ���ڵ� : <input name="goods_b_cd" type="text" size="10"id="goods_b_cd">					
						<button type="button" onclick="fnNullCk()">��ȸ</button>						
				      </div>
					</form>
				</div>
				<p>
				    
				<table border = "1" width="50%" cellspacing="0" style="text-align: center;" class="saleTable">
					<thead >
						<tr>
							<th>��ǰ��</th>
							<th>����</th>							
							<th>����</th>
						</tr>
					</thead>

					<tbody>
							
					</tbody>
				</table>
		
				
			</div>
			<!--table-responsive  -->
		</div>
		<!-- card-body -->
	</div><!-- card mb-3 -->
</div><!-- container-fluid -->
</body>