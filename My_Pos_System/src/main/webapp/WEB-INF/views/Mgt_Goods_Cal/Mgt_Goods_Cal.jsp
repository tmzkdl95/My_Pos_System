<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<META HTTP-EQUIV="Cache-Control" CONTENT="no-cache">
<META HTTP-EQUIV="Pragma" CONTENT="no-cache">

<body onload = "pginit()">
<script src="js/common/saleMap.js"></script>
<script language="javascript">

var saleInfo_all_arr = Array(); //상품명-상품가격-수량-상품x수량
var arrLen = 4;
var allSum = 0;

function pginit(){
	
	bCdFocus();
	
}
//페이지 로드시 바코드 조회로 포커스 맞추기
function bCdFocus(){
	document.getElementById("goods_b_cd").focus();
}

function exec_DataAdd(result){
	
	//result가 null 아닐때만 실행
	if(result){
		
		var sum = 0;
		//1.result의 "[]",공백 제거 및 "=" -> "," 치환 작업  
	    var saleInfo = result.replace("[","").replace("]","").replace("goods_nm=","").replace("goods_pri=","").replace(/ /g,"").replace(/=/g,",");
	    //2."," 기준으로 배열 생성
	    var saleInfo_arr = saleInfo.split(",");   
	    //3.saleInfo_all_arr에 조회해오는 값 계속 저장 : 홀수 = goods_nm / 짝수 = goods_pri
	    
		//[nm,value,goods_pri,value] => 1,3만 push
	    saleInfo_all_arr.push(saleInfo_arr[0],saleInfo_arr[1],1,saleInfo_arr[1]);   
	}
    
    //4.Table 출력 jQuery 
    $(document).ready(function() {
    	
        var $listTbody = $(".saleTable tbody");        
        $listTbody.empty(); //초기화
        
        var len = saleInfo_all_arr.length;       
        var i = 0;
        var qty = Number(saleInfo_all_arr[i+2]);
        var tbNum = 1;
        while(i<len){
        	//console.log ("len : "+len+", i : "+i);
            $listTbody.append("<tr> <td width='5%'>"+tbNum+"</td>"+
                              "<td width='25%'>" + saleInfo_all_arr[i]   +"</td>"+
                              "<td width='15%'>" + saleInfo_all_arr[i+1] +"</td>"+
            		          "<td width='10%'>" + saleInfo_all_arr[i+2] +"</td>"+
            		          "<td width='15%'> <input type='number' align='right' name='"+tbNum+"' onblur='goodsQtyChange_event(this.name,this.value)' style='width:50px; text-align:center; value=1'></td>"+
            		          "<td width='15%'>" + saleInfo_all_arr[i+3] +"</td>"+
            	              "<td width='15%'><input type = 'checkbox' name ='child_check' onclick='doOpenCheck(this);' style='width:20px; height:20px'></td></tr>");            		         
           
            i = i+4;
            tbNum++;   
            
        }
        $listTbody.append("<tr><td colspan ='5'> 총 합 </td> <td colspan ='2'> "+allSum+" </td></tr>");
    });
    
}


//수량 변경 및 sum 계산
function goodsQtyChange_event(idx,val){
	
	if(!val){		
		alert("수량을 입력하세요");
		return false;
	}
	//값 변경시 sum 계산 로직 추가		
	var tbTbody = document.getElementById("saleTableTbody");
	var sum = 0;
	var idxQty = arrLen*idx-2; //수량 변수
	var len = saleInfo_all_arr.length/arrLen;
	var pri = 0;
	var qty = 0;
	var pXq = 0;
	//2. saleInfo_all_arr 변경
	saleInfo_all_arr[idxQty] = val;
	
	//3. 값 계산
	for(var i=1; i<=len; i++){
		pri = Number(saleInfo_all_arr[(arrLen*i)-3]); //가격
		qty = saleInfo_all_arr[(arrLen*i)-2]; //수량
		pXq = pri * qty //행 계산
		
		saleInfo_all_arr[(arrLen*i)-1] = pXq; //행 계산
		sum += pXq; //총합 
	}
	allSum = sum; //전역변수에 삽입
	alert(sum);
	console.log(saleInfo_all_arr.length);
	
	//3. td 재출력
	exec_DataAdd();
	
	
	console.log("saleInfo_all_arr = "+saleInfo_all_arr);

	
	
}
//체크박스 1개만 사용가능하도록 설정하는 함수
function doOpenCheck(chk){
	
    var obj = document.getElementsByName("child_check");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }else{
        	obj[i].checked = true;
        }
    }
    
}

/******* 체크박스 값 출력 **********/
function selectCkbox(){

    var checkbox = $("input[name=child_check]:checked");
    var sum = 0;
    // 체크된 체크박스 값을 삭제한다.
    checkbox.each(function(i) {
   
        // checkbox.parent() : checkbox의 부모는 <td>이다.
        // checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
        var tr = checkbox.parent().parent().eq(i);
        var td = tr.children();        
        var delNum = Number(td.eq(0).text()); // 순번
        
  
        delNum = arrLen*delNum-3;  //1,4,7...
        
        saleInfo_all_arr.splice(delNum,1);        
        saleInfo_all_arr.splice(delNum-1,1);
        saleInfo_all_arr.splice(delNum-2,1);
        saleInfo_all_arr.splice(delNum-3,1);
        
        //삭제 후 조회
        exec_DataAdd();
       
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
		        	bCdFocus();
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
					      상품 바코드 : <input name="goods_b_cd" onchange ="fnNullCk()" type="text" size="10"id="goods_b_cd">					
						<!-- <button type="button" onclick="fnNullCk()">조회</button>  -->
				      </div>
				      <div class="delBtn" align="left">
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
							<th>가격</th>							
							<th>수량</th>
							<th>수량입력</th>
							<th>계산</th>
							<th>선택</th>
						</tr>
					</thead>

					<tbody id = "saleTableTbody">
							
					</tbody>
				</table>
		
				
			</div>
			<!--table-responsive  -->
		</div>
		<!-- card-body -->
	</div><!-- card mb-3 -->
</div><!-- container-fluid -->
</body>