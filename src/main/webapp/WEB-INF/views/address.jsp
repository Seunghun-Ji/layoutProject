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
 	
	

	//���� Ŭ�������� �ش� ���� �̸��� ã�� getAddr �Լ� ȣ��	
	$(document).ready(function() {

		$('.gu_btn').each(function(i) {
			$(this).click(function(e) {
				e.preventDefault();
				var guName = $(this).attr("value");
				getAddr(guName);
			});
		});
	});

	//��Ʈ�ѷ��� �� �̸� ���� �� �ش� ���� ���Ǽ� �ּҸ� ������
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
	
	//�ּҵ��� �ϳ��� ����
	function parsingJsonArr(msg) {
		$("#shel_frame").empty();
		$.each(msg, function(index, item) {
			shelCreate(item);
		});
	}

	//���Ǽ��ּ� �ϳ��� �������� ������
	function shelCreate(item) {
		var sname = item.sname;
		var addr_gu = item.addr_gu;
		var addr_detail = item.addr_detail;
		var addr = addr_gu + " " + addr_detail;

		var element = $("#shel_frame");
		var prependStr = "<ul class='shel_content'>"
				+ "<li id='sName'>" + sname + "</li>"
				+ "<li id='aAddr'>" + addr + "</li>" + "</ul>";
		element.append(prependStr);
	}
</script>
<body>
	
		
	<div id="addr_frame">
		<table class="addr_table">
		    <thead>
			    <tr>
			        <th scope="cols">����</th>
			        <th scope="cols">���Ǽ� �ּ�</th>
			    </tr>
		    </thead>
		    
		    <tbody>
			    <tr>
			        <th class ="gu_btn_frame" scope="row" rowspan="6">
			        	<input type=button class="gu_btn" id ="gu_btn1" value="��ȱ�">
			        	<input type=button class="gu_btn" id ="gu_btn2" value="�ȴޱ�">
			        	<input type=button class="gu_btn" id ="gu_btn3" value="�Ǽ���">
			        	<input type=button class="gu_btn" id ="gu_btn4" value="���뱸">
			        </th>
			        <td>
			      		<div rowspan="6"  class="shel_frame" id="shel_frame">
						</div>
					</td>
			    </tr>
		    </tbody>
		</table>
	</div>
	
</body>
</html>