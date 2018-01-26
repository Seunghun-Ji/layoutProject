<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>UXP Project</title>
<link rel="stylesheet" type="text/css" href="./css/address.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="./js/widget_js.js" type="text/javascript"></script> 
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
</head>
<script type="text/javascript">
 	
	

	//구를 클릭했을때 해당 구의 이름을 찾고 getAddr 함수 호출	
	$(document).ready(function() {

		$('.gu_btn').each(function(i) {
			$(this).click(function(e) {
				e.preventDefault();
				var guName = $(this).attr("value");
				getAddr(guName);
			});
		});
	});

	//컨트롤러로 구 이름 전송 후 해당 구의 대피소 주소를 가져옴
	function getAddr(guName) {

		var ob = new Object();
		ob.guName = guName;

		$.ajax({
			url : '/get/shelter/info',
			data : ob,
			dataType : 'json',
			success : function(msg) {
				parsingJsonArr(msg);
			}
		});
	}
	
	//주소들을 하나씩 나눔
	function parsingJsonArr(msg) {
		$("#shel_addr_frame").empty();
		$.each(msg, function(index, item) {
			shelCreate(item);
		});
	}

	//대피소주소 하나씩 페이지에 보여줌
	function shelCreate(item) {
		var sname = item.sname;
		var addr_gu = item.addr_gu;
		var addr_detail = item.addr_detail;
		var addr = addr_gu + " " + addr_detail;

		var element = $("#shel_addr_frame");
		var prependStr = "<ul id ='shel_addr_content'>"
				+ "<li id='sName'>" + sname + "</li>"
				+ "<li id='aAddr'>" + addr + "</li>" + "</ul>";
		element.append(prependStr);
	}
</script>
<body>
	<div id ="frame">
		<table id="table">
			<tr id = "tr_head">
				<th scope="cols">구분</th>
				<th scope="cols">대피소 주소</th>
			</tr>
			<tr>
				<td id="btn_frame" scope="row" rowspan="6">
					<input type=button class="gu_btn" id ="gu_btn1" value="장안구">
				    <input type=button class="gu_btn" id ="gu_btn2" value="팔달구">
				    <input type=button class="gu_btn" id ="gu_btn3" value="권선구">
				    <input type=button class="gu_btn" id ="gu_btn4" value="영통구">
				</td>
				<td rowspan="6">
					<div id="shel_addr_frame">
					
					</div>
				</td>
			</tr>		
		</table>
	</div>
	
</body>
</html>