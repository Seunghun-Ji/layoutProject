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
 	 * [설명] 지역구 버튼을 클릭 했을때 버튼 배열에서 해당 구를 찾고 getAddr 함수에게 구 이름을 파라미터로 호출
	 * @author : YoonAh Park
	 * @@since : 2018-01-29
	 */
	$(document).ready(function() {

		
		//구버튼 클릭시 발생 이벤트
		
			$('.gu_btn').click(function(e) {
				
				e.preventDefault();
				var guName = $(this).attr("value");
				//구에 해당하는 대피소 주소를 컨트롤러에서 가져옴
				getAddr(guName);
			});
		
	});
		
	/**
	 * [설명] 컨트롤러로 구 이름 전송 후 해당 구의 대피소 주소를 가져옴
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
				//구의 모든 주소를 다른 위젯에게 전달
				guSend(msg);
			}
		});
	}
	
	/**
	 * [설명] 매게변수로 받은 지역구 주소들의 배열을 하나씩 나눔
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
	 * [설명] 대피소 주소 하나씩 페이지에 보여줌 
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
	 * [설명] 대피소 주소를 클릭시 해당 주소의 정보들을 가져와서 sehlSend로 보냄
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
			bgNum = Math.floor(Math.random() * bgArray.length); //배열의 개수만큼의 범위에서 난수 생성
			var rdm = bgArray.splice(bgNum, 1); //배열 요소를 빼고 빠진 값을 가져온다.
			rdm = rdm.toString(); //해당 숫자를 문자로 변경
			var str = "./video/sample" + rdm + ".mp4"; //sample 동영상 결정
			bgVideo.push(str); //영상 링크 삽입
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
	 * [설명] 대피소 정보 주소 하나의 정보(ob)를 받아서 map위젯 혹은 video 위젯에 전송 
	 * @author : YoonAh Park
	 * @@since : 2018-01-29
	 */
	function shelSend(ob){
		
		msgBroker_addr.sendMessage('From_addr_To_video_Content_address', ob,window.parent);
		msgBroker_addr.sendMessage('From_addr_To_map_Content_oneShelter', ob,window.parent);
	}
	
	
	/**
	 * [설명] 클릭한 지역구의 모든 대피소 정보를 
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
				<th scope="cols">구분</th>
				<th scope="cols">대피소 주소</th>
			</tr>
			<tr>
				<td id="btn_frame" scope="row">
					<input type=button class="gu_btn" id ="gu_btn1" value="장안구">
				    <input type=button class="gu_btn" id ="gu_btn2" value="팔달구">
				    <input type=button class="gu_btn" id ="gu_btn3" value="권선구">
				    <input type=button class="gu_btn" id ="gu_btn4" value="영통구">
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