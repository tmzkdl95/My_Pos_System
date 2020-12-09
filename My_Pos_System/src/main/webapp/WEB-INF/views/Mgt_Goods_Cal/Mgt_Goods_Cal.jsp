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
	
	//1.result의 "[]",공백 제거 및 "=" -> "," 치환 작업  
    var saleInfo = result.replace("[","").replace("]","").replace(/ /g,"").replace(/=/g,",");
    //2."," 기준으로 배열 생성
    var saleInfo_arr = saleInfo.split(",");   

    //3.saleInfo_all_arr에 조회해오는 값 계속 저장 : 홀수 = goods_nm / 짝수 = goods_pri
    cnt = cnt+2;
    saleInfo_all_arr.push(saleInfo_arr[1],saleInfo_arr[3]);   
    
    
    //4.Table 출력 jQuery 
    $(document).ready(function() {
    	
        var $listTbody = $(".saleTable tbody");        
        $listTbody.empty(); //초기화
        
        var len = saleInfo_all_arr.length;       
        var i = 0;     
        while(i<len){
        	console.log ("len : "+len+", i : "+i);
            $listTbody.append("<tr><td>" + saleInfo_all_arr[i] + "</td> <td> 0 </td> <td>" + saleInfo_all_arr[i+1] + "</td></tr>");
            i = i+2;
        }
        $listTbody.append("<tr><td> 총 합 </td> <td colspan ='2'> 1 </td></tr>");
    });
    
}

 function fnNullCk(){
	 var ck = retrieve_data.goods_b_cd.value;	
	 var result = "";
	 if(!ck){
		 alert("바코드를 등록하세요!!!");
		 return false;
	 }else{
		 //가격,이름 Ajax로 조회해오기
		    $.ajax({
		        url: "Mgt_Goods_Cal/retrieve",
		        type: "POST",		        
		        data: {
		        	goods_b_cd:ck
		        },
		        async: false,
		        success: function(data){
		        	//조회 성공시 exec_DataAdd 실행
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
		<li class="breadcrumb-item"><a href="#">계산 화면</a></li>
		
	</ol>

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
				    
				<table border = "1" width="50%" cellspacing="0" style="text-align: center;" class="saleTable">
					<thead >
						<tr>
							<th>상품명</th>
							<th>수량</th>							
							<th>가격</th>
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