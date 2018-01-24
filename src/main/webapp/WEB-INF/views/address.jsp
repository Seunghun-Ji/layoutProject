<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>UXP Project</title>
<link rel="stylesheet" type="text/css" href="./css/widget_css.css">
<script src="./js/widget_js.js" type="text/javascript"></script> 
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
</head>
<script type="text/javascript">
 	
	

	//���� Ŭ�������� �ش� ���� ������ ������
	$(document).on("click", "#btn1", function() {
		var guName = $("#btn1").val();
		var gu = new Object();
		gu.Name=guName;
	
		
		$.ajax({
			url : '/get/shelter/info',
			data : gu,
			dataType : 'json',
			success : function(msg) {
				console.log("!!",msg);
				parsingJsonArr(msg);
			}
		});
	});

	function parsingJsonArr(msg) {
		
		
		//var shelArr = new Array();
		//shelArr = JSON.parse(msg.body);
		//console.log(shelArr); 
		$.each(msg,function(index, item){
			shelCreate(item);
		});
	}
	
	function shelCreate(item){
		console.log(item);
		var sname = item.sname;
		var addr_gu = item.addr_gu;
		var addr_detail = item.addr_detail;
		var addr = addr_gu +" "+ addr_detail;
		
		var element = $("#divContents");
		var prependStr  = 
			"<ul class='shel_content' style='height:10px;'>"
			+"<li style='height:10px;'>"+sname+"</li>"
    		+"<li style='height:10px;'>"+addr+"</li>"
    		+"</ul>";
 
		//element.prepend(prependStr);
		element.append(prependStr);
	}
</script>
<body>
	
	
	<div id="widget2">
		<table class="type08">
		    <thead>
			    <tr>
			        <th scope="cols">����</th>
			        <th scope="cols">�ǹ� �ּ�</th>
			        <th scope="cols">���Ǽ� �ּ�</th>
			    </tr>
		    </thead>
		    <tbody>
			    <tr>
					<type="hidden" id="name" value={mo.name}>
			        <th class ="gu_btn_frame" scope="row" rowspan="6">
			        	<input type=button  name ="btn1" id ="btn1" value="��ȱ�">
			        	<input type=button class="gu_btn2" name ="gu_btn" id ="btn2" value="�ȴޱ�">
			        	<input type=button class="gu_btn3" name ="gu_btn" id ="btn3" value="�Ǽ���">
			        	<input type=button class="gu_btn4" name ="gu_btn" id ="btn4" value="���뱸">

			        </th>
			        <td id="allConst" name="allConst" rowspan="6">
			        	<div style="overflow-y:scroll;">
				        	<ul>
				        		<li>��⵵ ������ �Ǽ��� ȣ�ŽǷ� 22-50 (ž��, �Ǽ��� ���Ǽ�)</li>
				        		<li>��⵵ ������ �Ǽ��� ��ȣ�� 83-7 (�ݰ)</li>
				        		<li>��⵵ ������ �Ǽ��� ��ȭ�� 46 (��)</li>
				        		<li>��⵵ ������ �Ǽ��� ��ž�� 111-40(���е�)</li>
				        		<li>��⵵ ������ �Ǽ��� ���η� 1382 (����õ��)</li>
				        		<li>��⵵ ������ �Ǽ��� ���߷� 7(�Ǽ���)</li>
				        	</ul>
			        	</div>
			        </td>
			        <td rowspan="6" id="shel_frame" name="shel_frame" class="shel_frame" >
			        	<div id="divContents" style="overflow-y:scroll; height: 200px;">
					        <ul name="shel_content">
					        	<name="sname">û������
					        	<name="saddr">��⵵ ������ �Ǽ��� �Ǽ��� 1198				   
					        </ul>
				        </div>
			        </td>
			    </tr>
		    </tbody>
		</table>
	</div>
	
</body>
</html>