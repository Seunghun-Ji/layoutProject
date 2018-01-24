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
 	
	

	//구를 클릭했을때 해당 구의 정보를 가져움
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
			        <th scope="cols">구분</th>
			        <th scope="cols">건물 주소</th>
			        <th scope="cols">대피소 주소</th>
			    </tr>
		    </thead>
		    <tbody>
			    <tr>
					<type="hidden" id="name" value={mo.name}>
			        <th class ="gu_btn_frame" scope="row" rowspan="6">
			        	<input type=button  name ="btn1" id ="btn1" value="장안구">
			        	<input type=button class="gu_btn2" name ="gu_btn" id ="btn2" value="팔달구">
			        	<input type=button class="gu_btn3" name ="gu_btn" id ="btn3" value="권선구">
			        	<input type=button class="gu_btn4" name ="gu_btn" id ="btn4" value="영통구">

			        </th>
			        <td id="allConst" name="allConst" rowspan="6">
			        	<div style="overflow-y:scroll;">
				        	<ul>
				        		<li>경기도 수원시 권선구 호매실로 22-50 (탑동, 권선구 보건소)</li>
				        		<li>경기도 수원시 권선구 금호로 83-7 (금곡동)</li>
				        		<li>경기도 수원시 권선구 세화로 46 (평동)</li>
				        		<li>경기도 수원시 권선구 상탑로 111-40(서둔동)</li>
				        		<li>경기도 수원시 권선구 서부로 1382 (오목천동)</li>
				        		<li>경기도 수원시 권선구 권중로 7(권선동)</li>
				        	</ul>
			        	</div>
			        </td>
			        <td rowspan="6" id="shel_frame" name="shel_frame" class="shel_frame" >
			        	<div id="divContents" style="overflow-y:scroll; height: 200px;">
					        <ul name="shel_content">
					        	<name="sname">청정공원
					        	<name="saddr">경기도 수원시 권선구 권선동 1198				   
					        </ul>
				        </div>
			        </td>
			    </tr>
		    </tbody>
		</table>
	</div>
	
</body>
</html>