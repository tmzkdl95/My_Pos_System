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
            
            //sum ���
            
        }
        $listTbody.append("<tr><td colspan ='2'> �� �� </td> <td colspan ='3'> 1 </td></tr>");
    });
    
}

//üũ�ڽ� 1���� ��밡���ϵ��� �����ϴ� �Լ�
function doOpenCheck(chk){
    var obj = document.getElementsByName("child_check");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}

/******* üũ�ڽ� �� ��� **********/
function selectCkbox(){

    var checkbox = $("input[name=child_check]:checked");
    
    // üũ�� üũ�ڽ� ���� �����Ѵ�.
    checkbox.each(function() {
    	
        // checkbox.parent() : checkbox�� �θ�� <td>�̴�.
        // checkbox.parent().parent() : <td>�� �θ��̹Ƿ� <tr>�̴�.
        var tr = checkbox.parent().parent().eq();
        var td = tr.children();        
        var delNum = Number(td.eq(0).text());
                
        delNum = 2*delNum-1;
        
        saleInfo_all_arr.splice(delNum,1);        
        saleInfo_all_arr.splice(delNum-1,1);
        
        //���� �� ��ȸ
    	$(document).ready(function() {
        	
            var $listTbody = $(".saleTable tbody");        
            $listTbody.empty(); //�ʱ�ȭ
            
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
                
                //sum ���
                
            }
            $listTbody.append("<tr><td colspan ='2'> �� �� </td> <td colspan ='3'> 1 </td></tr>");
        });
     });
    
    
	
}
	
//��ȸ��ư
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
						<button type="button" onclick="selectCkbox()" class="btn btn-outline btn-primary" id="selectBtn">����</button>				
				      </div>
					</form>
				</div>
				<p>
				    
				<table border = "1" width="70%" cellspacing="0" style="text-align: center;" class="saleTable" id = "saleTable">
					<thead >
						<tr>
						    <th>����</th>  
							<th>��ǰ��</th>
							<th>����</th>							
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