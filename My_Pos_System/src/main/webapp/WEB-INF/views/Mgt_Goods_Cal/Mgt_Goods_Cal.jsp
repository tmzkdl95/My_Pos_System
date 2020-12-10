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
	var sum = 0;
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
        var tbNum = 1;
        while(i<len){
        	//console.log ("len : "+len+", i : "+i);
            $listTbody.append("<tr> <td width='5%'>"+tbNum+"</td>"+
                              "<td width='40%'>" + saleInfo_all_arr[i] + "</td>"+
            		          "<td width='10%'> <input type='text' style ='width:30px; text-align:center;' numberonly = 'true' value = 1> </td>"+
            		          "<td width='30%'>" + saleInfo_all_arr[i+1] + "</td>"+
            	              "<td width='20%'><input type = 'checkbox' name ='child_check' onclick='doOpenCheck(this);' style='width:20px; height:20px'></td></tr>");            		         
           
            i = i+2;
            tbNum++;
            
            //sum 계산
            
        }
        $listTbody.append("<tr><td colspan ='2'> 총 합 </td> <td colspan ='3'> 1 </td></tr>");
    });
    
}

//체크박스 1개만 사용가능하도록 설정하는 함수
function doOpenCheck(chk){
    var obj = document.getElementsByName("child_check");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}

/******* 체크박스 값 출력 **********/
function selectCkbox(){

    var checkbox = $("input[name=child_check]:checked");
    
    // 체크된 체크박스 값을 삭제한다.
    checkbox.each(function() {
    	
        // checkbox.parent() : checkbox의 부모는 <td>이다.
        // checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
        var tr = checkbox.parent().parent().eq();
        var td = tr.children();        
        var delNum = Number(td.eq(0).text());
                
        delNum = 2*delNum-1;
        
        saleInfo_all_arr.splice(delNum,1);        
        saleInfo_all_arr.splice(delNum-1,1);
        
        //삭제 후 조회
    	$(document).ready(function() {
        	
            var $listTbody = $(".saleTable tbody");        
            $listTbody.empty(); //초기화
            
            var len = saleInfo_all_arr.length;       
            var i = 0;
            var tbNum = 1;
            while(i<len){
            	console.log ("len : "+len+", i : "+i);
                $listTbody.append("<tr> <td width='5%'>"+tbNum+"</td>"+
                                  "<td width='40%'>" + saleInfo_all_arr[i] + "</td>"+
                		          "<td width='10%'> <input type='text' style ='width:30px; text-align:center;' numberonly = 'true' value = 1> </td>"+
                		          "<td width='30%'>" + saleInfo_all_arr[i+1] + "</td>"+
                		          "<td width='20%'><input type = 'checkbox' name ='child_check' style='width:20px; height:20px'></td></tr>");
                i = i+2;
                tbNum++;
                
                //sum 계산
                
            }
            $listTbody.append("<tr><td colspan ='2'> 총 합 </td> <td colspan ='3'> 1 </td></tr>");
        });
     });
    
    
	
}
	
//조회버튼
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
		        	retrieve_data.goods_b_cd.value = "";
		            //console.log($.trim(data));		           
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
						<button type="button" onclick="selectCkbox()" class="btn btn-outline btn-primary" id="selectBtn">삭제</button>				
				      </div>
					</form>
				</div>
				<p>
				    
				<table border = "1" width="70%" cellspacing="0" style="text-align: center;" class="saleTable" id = "saleTable">
					<thead >
						<tr>
						    <th>순번</th>  
							<th>상품명</th>
							<th>수량</th>							
							<th>가격</th>
							<th>선택</th>
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