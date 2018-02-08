<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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

	/**
 	 * [����] ������ ��ư�� Ŭ�� ������ ��ư �迭���� �ش� ���� ã�� getAddr �Լ����� �� �̸��� �Ķ���ͷ� ȣ��
	 * @author : YoonAh Park
	 * @@since : 2018-01-29
	 */
	$(document).ready(function() {

		
		//����ư Ŭ���� �߻� �̺�Ʈ
		
			$('.gu_btn').click(function(e) {
				
				e.preventDefault();
				var guName = $(this).attr("value");
				//���� �ش��ϴ� ���Ǽ� �ּҸ� ��Ʈ�ѷ����� ������
				getAddr(guName);
			});
		
	});
		
	/**
	 * [����] ��Ʈ�ѷ��� �� �̸� ���� �� �ش� ���� ���Ǽ� �ּҸ� ������
	 * @author : YoonAh Park
	 * @since : 2018-01-29
	 */
	function getAddr(guName) {

		var ob = {
				guName : guName	
		};

		$.ajax({
			url : '/get/shelter/info',
			data : {
				guName : guName	
			},
			dataType : 'json',
			success : function(msg) {
				parsingJsonArr(msg);
				//���� ��� �ּҸ� �ٸ� �������� ����
				guSend(msg);
			}
		});
	}
	
	/**
	 * [����] �ŰԺ����� ���� ������ �ּҵ��� �迭�� �ϳ��� ����
	 * @author : YoonAh Park
	 * @since : 2018-01-29
	 */
	function parsingJsonArr(msg) {
		$("#shel_addr_frame").empty();
		$.each(msg, function(index, item) {
			shelCreate(item);
		});
	}

	/**
	 * [����] ���Ǽ� �ּ� �ϳ��� �������� ������ 
	 * @author : YoonAh Park
	 * @@since : 2018-01-29
	 */
	function shelCreate(item) {
		var sname = item.sname;
		var addr_gu = item.addr_gu;
		var addr_detail = item.addr_detail;
		var addr = addr_gu + " " + addr_detail;
		var div = item.division;
		var size = item.size;
		var cap = item.capacity;
		
		var element = $("#shel_addr_frame");
		var prependStr ="";
		prependStr+= "<ul class='shel_addr_content' id ='shel_addr_content' data-div="+div+" data-size="+size+" data-cap="+cap+">"
		prependStr+= "	<li class='sName' id='sName'>" + sname + "</li>"
		prependStr+= "	<li class='sAddr' id='sAddr'>" + addr + "</li>" 
		prependStr+= "</ul>";

		element.append(prependStr);
	}
	
	/**
	 * [����] ���Ǽ� �ּҸ� Ŭ���� �ش� �ּ��� �������� �����ͼ� sehlSend�� ����
	 * @author : YoonAh Park
	 * @since : 2018-01-29
	 */
	$(document).on("click", ".shel_addr_content", function() {

		var sname = $(this).find(".sName").text();
		var addr = $(this).find(".sAddr").text();
		var div = $(this).data('div');
		var size = $(this).data('size');
		var cap = $(this).data('cap');

		var bgArray = [];
		var bgVideo = [];
		var bgNum;

		for( var i = 1 ; i <= 10 ; i++ ) {
			bgArray.push(i);
		}

		for( var i = 0 ; i < 4 ; i++ ) {
			bgNum = Math.floor(Math.random() * bgArray.length); //�迭�� ������ŭ�� �������� ���� ����
			var rdm = bgArray.splice(bgNum, 1); //�迭 ��Ҹ� ���� ���� ���� �����´�.
			rdm = rdm.toString(); //�ش� ���ڸ� ���ڷ� ����
			var str = "./video/sample" + rdm + ".mp4"; //sample ������ ����
			bgVideo.push(str); //���� ��ũ ����
		}
		
		var videosrc = bgVideo;
		
		var ob = {
				sname : sname,
				addr : addr,
				div : div,
				size: size,
				cap: cap,
				videosrc : videosrc
		};

		shelSend(ob);
	});


	/**
	 * [����] ���Ǽ� ���� �ּ� �ϳ��� ����(ob)�� �޾Ƽ� map���� Ȥ�� video ������ ���� 
	 * @author : YoonAh Park
	 * @@since : 2018-01-29
	 */
	function shelSend(ob){
		
		msgBroker_addr.sendMessage('From_addr_To_video_Content_address', ob,window.parent);
		msgBroker_addr.sendMessage('From_addr_To_map_Content_oneShelter', ob,window.parent);
	}
	
	
	/**
	 * [����] Ŭ���� �������� ��� ���Ǽ� ������ 
	 * @author : YoonAh Park
	 * @since : 2018-01-29
	 */
	function guSend(msg) {
		msgBroker_addr.sendMessage('From_addr_To_map_Content_guShelters', msg,window.parent);
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
				<td id="btn_frame" scope="row">
					<input type=button class="gu_btn" id ="gu_btn1" value="��ȱ�">
				    <input type=button class="gu_btn" id ="gu_btn2" value="�ȴޱ�">
				    <input type=button class="gu_btn" id ="gu_btn3" value="�Ǽ���">
				    <input type=button class="gu_btn" id ="gu_btn4" value="���뱸">
				</td>
				<td>
					<div id="shel_addr_frame">
					
					</div>
				</td>
			</tr>		
		</table>
	</div>
	
</body>
</html>