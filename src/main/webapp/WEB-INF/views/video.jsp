<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<title>UXP Project</title>

<link rel="stylesheet" type="text/css" href="./css/video.css">
<script type="text/javascript">
	var vidArr = new Array(8); 	//동영상 확인을 위한 배열
	for(var i=0;i<8;i++) 		//초기화
		vidArr[i] = false;
	
	//btn을 누르면 자동으로 id값을 가져온다.	
	$(document).ready(function() { //비디오 영상 삽입
		$('.btn').each(function(i) { //공동 클래스명으로 동작
			$(this).click(function(e) { //버튼 클릭 시
				e.preventDefault(); //다른 이벤트 발생을 막는다.
				var temp = 0; //buffer 역할
				var video = document.getElementsByTagName('video'); //video 태그를 다 가져온다.
				for(; vidArr[temp] != false && temp < 8; temp += 1);
				if(temp < 8) {
					video[temp].src = "./images/sample.mp4";
					vidArr[temp] = true;
				}
				else
					alert("더이상 추가할 수 없습니다!");
				//var guName = $(this).attr("value"); //클릭된 버튼의 id를 가져온다.
				//getAddr(guName);
			});
		});
	});
	
	$(document).ready(function() { //비디오 영상 삽입
		$('.btn_d').each(function(i) { //공동 클래스명으로 동작
			$(this).click(function(e) { //버튼 클릭 시
				e.preventDefault(); //다른 이벤트 발생을 막는다.
				var b_id = $(this).attr("value"); //클릭된 버튼의 id를 가져온다.
				v_num = b_id.substring(0,1);
				v_num = Number(v_num);
				v_num -= 1;
				if(vidArr[v_num] == true) {
					var video = document.getElementsByTagName('video'); //video 태그를 다 가져온다.
					video[v_num].src = "#";
					vidArr[v_num] = false;
				}
				else
					alert("출력되는 영상이 없습니다!");
			});
		});
	});
</script>
</head>
<body>
	<input type=button class="btn" id="btn" value="영상추가">
	<input type=button class="btn_d" id="btn1" value="1번영상">
	<input type=button class="btn_d" id="btn2" value="2번영상">
	<input type=button class="btn_d" id="btn3" value="3번영상">
	<input type=button class="btn_d" id="btn4" value="4번영상">
	<input type=button class="btn_d" id="btn5" value="5번영상">
	<input type=button class="btn_d" id="btn6" value="6번영상">
	<input type=button class="btn_d" id="btn7" value="7번영상">
	<input type=button class="btn_d" id="btn8" value="8번영상">
	<div id="widget1">
		<fieldset>
			<legend><strong>Video</strong></legend>
			<table border="0">
			   <tr>
			      <td>
			      	<video id="video0" controls>
						<source src="#" type ="video/mp4">
					  <p>지원하지않는 브라우저입니다.</P>
					</video> 
				  </td>
			      <td>
			      	<video id="video1" controls>
						<source src="#" type ="video/mp4">
					  <p>지원하지않는 브라우저입니다.</P>
					</video> 
				  </td>
			   </tr>
			   <tr>
			      <td>
			      	<video id="video2" controls>
						<source src="#" type ="video/mp4">
					  <p>지원하지않는 브라우저입니다.</P>
					</video> 
				  </td>
			      <td>
			      	<video id="video3" controls>
						<source src="#" type ="video/mp4">
					  <p>지원하지않는 브라우저입니다.</P>
					</video> 
				  </td>
			   </tr>
			   <tr>
			      <td>
			      	<video id="video4" controls>
						<source src="#" type ="video/mp4">
					  <p>지원하지않는 브라우저입니다.</P>
					</video> 
				  </td>
			      <td>
			      	<video id="video5" controls>
						<source src="#" type ="video/mp4">
					  <p>지원하지않는 브라우저입니다.</P>
					</video> 
				  </td>
			   </tr>
			   <tr>
			      <td>
			      	<video id="video6" controls>
						<source src= type ="video/mp4">
						<source src="img/webm" type ="video/webm">
						<source src="img/ogv" type ="video/ogg">
					    <source src="#">
					  <p>지원하지않는 브라우저입니다.</P>
					</video> 
				  </td>
			      <td>
			      	<video id="video7" controls>
						<source src="#" type ="video/mp4">
					  <p>지원하지않는 브라우저입니다.</P>
					</video>
				  </td>
			   </tr>
			</table>
		</fieldset>
	</div>
</body>
</html>