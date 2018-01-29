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

<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="./js/messageBroker.js" type="text/javascript"></script>
</head>
<script type="text/javascript">
 	
var msgBroker_addr;
msgBroker_addr = new eseict.MessageBroker();

	//���� Ŭ�������� �ش� ���� �̸��� ã�� getAddr �Լ� ȣ��	
	$(document).ready(function() {

		
		//����ư Ŭ���� �߻� �̺�Ʈ
		$('.gu_btn').each(function(i) {
			$(this).click(function(e) {
				
				e.preventDefault();
				var guName = $(this).attr("value");
				//���� �ش��ϴ� ���Ǽ� �ּҸ� ��Ʈ�ѷ����� ������
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
				
				//���� ��� �ּҸ� �ٸ� �������� ����
				guSend(msg);
			}
		});
	}
	
	//�ּҵ��� �ϳ��� ����
	function parsingJsonArr(msg) {
		$("#shel_addr_frame").empty();
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

		var element = $("#shel_addr_frame");
		var prependStr = "<ul class='shel_addr_content' id ='shel_addr_content'>"
				+ "<li class='sName' id='sName'>" + sname + "</li>"
				+ "<li class='sAddr' id='sAddr'>" + addr + "</li>" + "</ul>";
		element.append(prependStr);
	}
	
	//���Ǽ� �ּ� Ŭ����
	$(document).on("click", ".shel_addr_content", function() {

		var sName = $(this).find(".sName").text();
		var addr = $(this).find(".sAddr").text();
		var ob = new Object();
		
		ob.sName=sName;
		ob.sAddr=addr;
		shelSend(ob);
	});

	//���Ǽ� �ּ� �ϳ��� ����
	function shelSend(ob){
		
		msgBroker_addr.sendMessage('From_addr_To_video_Content_address', ob,
				window.parent);
		msgBroker_addr.sendMessage('From_addr_To_map_Content_oneShelter', ob,
				window.parent);
	}
	
	//�ش� ���� ��� �ּҵ��� ���� 
	function guSend(msg) {
		msgBroker_addr.sendMessage('From_addr_To_map_Content_guShelters', msg,
				window.parent);
	}
	
</script>
<body>
	<div id ="addr_frame">
		<table id="table">
			<tr id = "tr_head">
				<th scope="cols">����</th>
				<th scope="cols">���Ǽ� �ּ�</th>
			</tr>
			<tr>
				<td id="btn_frame" scope="row" rowspan="6">
					<input type=button class="gu_btn" id ="gu_btn1" value="��ȱ�">
				    <input type=button class="gu_btn" id ="gu_btn2" value="�ȴޱ�">
				    <input type=button class="gu_btn" id ="gu_btn3" value="�Ǽ���">
				    <input type=button class="gu_btn" id ="gu_btn4" value="���뱸">
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