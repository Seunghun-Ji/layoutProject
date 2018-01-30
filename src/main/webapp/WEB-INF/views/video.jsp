<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- rino UXP 라이브러리 -->
<script src="./js/messageBroker.js" type="text/javascript"></script> 

<title>UXP Project</title>

<link rel="stylesheet" type="text/css" href="./css/video.css">

<script type="text/javascript">
	//rino UXP 메시지를 받기 위한 객체 생성
	var msgBroker_Video; 
	msgBroker_Video = new eseict.MessageBroker();
	
	/**
	 * [설명] ese사의 rino UXP library를 활용하여 widget간의 통신을 주고받는 기능을 활용,
	 *		addCommandHandler로 지정된 명령이 요청되면 10개의 영상 중 무작위로 4개의 영상을 출력하도록 구현 
	 * @author : SeungHun Ji
	 * @since : 2018-01-30
	 */
	$(document).ready(function() {
		//메세지 받는 함수 : addCommandHandler(command, function()); command 명령 요청이 있으면 function 수행
		msgBroker_Video.addCommandHandler('From_addr_To_video_Content_address', function(data){
			var video = document.getElementsByTagName('video'); //video 태그를 다 가져온다.
			var max = 10; //sample 최대 개수
			
			//중복없는 난수 생성을 위한 변수
			var bgArray = [];
			var bgNum;
			
			//배열에 1~max까지 집어넣는다.
			for( var i = 1 ; i <= max ; i++)
				bgArray.push(i);
			
			for( var i = 0 ; i < 4 ; i++ ) {
				bgNum = Math.floor(Math.random() * bgArray.length); //배열의 개수만큼의 범위에서 난수 생성
				var rdm = bgArray.splice(bgNum, 1); //배열 요소를 빼고 빠진 값을 가져온다.
				rdm = rdm.toString(); //해당 숫자를 문자로 변경
				var str = "./images/video/sample" + rdm + ".mp4"; //sample 동영상 결정
				video[i].src = str; //i번째 영상에 링크 변경
			}
		});
	});
	
	/* 
	//동영상 확인을 위한 배열
	var vidArr = new Array(8); 
	for (var i = 0; i < 8; i++)//초기화
		vidArr[i] = false;
	
	//btn을 누르면 자동으로 id값을 가져온다.	
	$(document).ready(function() { //비디오 영상 삽입
			$('.btn').each(function(i) { //공동 클래스명으로 동작
				$(this).click(function(e) { //버튼 클릭 시
					e.preventDefault(); //다른 이벤트 발생을 막는다.
					var temp = 0; //buffer 역할
					var video = document.getElementsByTagName('video'); //video 태그를 다 가져온다.
					for (; vidArr[temp] != false && temp < 8; temp += 1);
						if (temp < 4) {
							video[temp].src = "https://cctvsec.ktict.co.kr/5173/tYUYvB544d85EMOppaVEumooq3RdAMViQSTHc8kTwLZaaAaPhb6rPd3uH3duaqjv";
							vidArr[temp] = true;
						} else
							alert("더이상 추가할 수 없습니다!");
						//var guName = $(this).attr("value"); //클릭된 버튼의 id를 가져온다.
						//getAddr(guName);
					});
				});
			});

	$(document).ready(function() { //비디오 영상 삭제
		$('.btn_d').each(function(i) { //공동 클래스명으로 동작
			$(this).click(function(e) { //버튼 클릭 시
				e.preventDefault(); //다른 이벤트 발생을 막는다.
				var b_id = $(this).attr("value"); //클릭된 버튼의 id를 가져온다.
				v_num = b_id.substring(0, 1);
				if (isNaN(v_num))
					for (var i = 0; i < 4; i++) {
						var video = document.getElementsByTagName('video'); //video 태그를 다 가져온다.
						video[i].src = "#";
						vidArr[i] = false;
					}
				else {
					v_num = Number(v_num);
					v_num -= 1;
					if (vidArr[v_num] == true) {
						var video = document.getElementsByTagName('video'); //video 태그를 다 가져온다.
						video[v_num].src = "#";
						vidArr[v_num] = false;
					} else
						alert("출력되는 영상이 없습니다!");
				}
			});
		});
	}); 
	*/
</script>
</head>
<body>
	<div id="widget1">
	<!-- 아래 주석은 자체적으로 영상 테스트를 하기 위한 버튼, 위의 주석처리된 코드와 합쳐 동작한다. -->
	<!-- <input type=button class="btn" value="영상추가">
	<input type=button class="btn_d" value="1번영상">
	<input type=button class="btn_d" value="2번영상">
	<input type=button class="btn_d" value="3번영상">
	<input type=button class="btn_d" value="4번영상">
	<input type=button class="btn_d" value="전체삭제"> -->
		<div id="box">
			<div class="tablebox">
			     <video controls autoplay loop>
					<source style="height:100%" src="#" type ="video/mp4">
				  <p>지원하지않는 브라우저입니다.</P>
				</video> 
			</div>
			<div class="tablebox">
			     <video controls autoplay loop>
					<source style="height:100%" src="#" type ="video/mp4">
				  <p>지원하지않는 브라우저입니다.</P>
				</video> 
			</div>
			<div class="tablebox">
			     <video controls autoplay loop>
					<source style="height:100%" src="#" type ="video/mp4">
				  <p>지원하지않는 브라우저입니다.</P>
				</video> 
			</div>
			<div class="tablebox">
			     <video controls autoplay loop>
					<source style="height:100%" src="#" type ="video/mp4">
				  <p>지원하지않는 브라우저입니다.</P>
				</video> 
			</div>
		</div>
	</div>
</body>
</html>
