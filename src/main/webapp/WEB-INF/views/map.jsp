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

	//구를 클릭시 해당 대피소가 보여져야함
	//구를 클릭했을때 해당 
	$(document).ready(function(){
		alert("whdddddddhh6333111111dfdfdfdfdfdfd11333ㅎㅎㅎㅎ33ddd3666666ddd");
	});
	
	$(".gu_btn").click(function(){
		var gu_name = $("#gu_btn1").attr('value');
		alert(gu_name);
	});
	




</script>
<body>
	<div id="widget1">
		<fieldset>
			<legend><strong>Video</strong></legend>
			<table border="0">
			   <tr>
			      <td>
			      	<video controls>
						<source src="./images/sample.mp4" type ="video/mp4">
					  <p>지원하지않는 브라우저입니다.</P>
					</video> 
				  </td>
			      <td>
			      	<video controls>
						<source src="./images/sample.mp4" type ="video/mp4">
					  <p>지원하지않는 브라우저입니다.</P>
					</video> 
				  </td>
			   </tr>
			   <tr>
			      <td>
			      	<video controls>
						<source src="./images/sample.mp4" type ="video/mp4">
					  <p>지원하지않는 브라우저입니다.</P>
					</video> 
				  </td>
			      <td>
			      	<video controls>
						<source src="./images/sample.mp4" type ="video/mp4">
					  <p>지원하지않는 브라우저입니다.</P>
					</video> 
				  </td>
			   </tr>
			   <tr>
			      <td>
			      	<video controls>
						<source src="./images/sample.mp4" type ="video/mp4">
					  <p>지원하지않는 브라우저입니다.</P>
					</video> 
				  </td>
			      <td>
			      	<video controls>
						<source src="./images/sample.mp4" type ="video/mp4">
					  <p>지원하지않는 브라우저입니다.</P>
					</video> 
				  </td>
			   </tr>
			   <tr>
			      <td>
			      	<video controls>
						<source src="./images/sample.mp4" type ="video/mp4">
						<source src="img/webm" type ="video/webm">
						<source src="img/ogv" type ="video/ogg">
					    <source src="">
					  <p>지원하지않는 브라우저입니다.</P>
					</video> 
				  </td>
			      <td>
			      	<video controls>
						<source src="./images/sample.mp4" type ="video/mp4">
					  <p>지원하지않는 브라우저입니다.</P>
					</video> 
				  </td>
			   </tr>
			</table>
		</fieldset>
	</div>
	
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

			        <th class ="gu_btn_frame" scope="row" rowspan="6">
			        	<input type=button class="gu_btn1" name ="gu_btn" id ="btn1" value="장안구">
			        	<input type=button class="gu_btn2" name ="gu_btn" id ="btn2" value="팔달구">
			        	<input type=button class="gu_btn3" name ="gu_btn" id ="btn3" value="권선구">
			        	<input type=button class="gu_btn4" name ="gu_btn" id ="btn4" value="영통구">

			        </th>
			        <td id="allConst" name="allConst" rowspan="6">
			        	<ul>
			        		<li>경기도 수원시 권선구 호매실로 22-50 (탑동, 권선구 보건소)</li>
			        		<li>경기도 수원시 권선구 금호로 83-7 (금곡동)</li>
			        		<li>경기도 수원시 권선구 세화로 46 (평동)</li>
			        		<li>경기도 수원시 권선구 상탑로 111-40(서둔동)</li>
			        		<li>경기도 수원시 권선구 서부로 1382 (오목천동)</li>
			        		<li>경기도 수원시 권선구 권중로 7(권선동)</li>
			        	</ul>
			        </td>
			        <td rowspan="6" id="shel_frame" name="shel_frame" class="shel_frame" >
				        <ul name="shel_content">
				        	<name="sname">청정공원
				        	<name="saddr">경기도 수원시 권선구 권선동 1198				   
				        </ul>
			        </td>
			    </tr>
		    </tbody>
		</table>
	</div>
	
	<div id="widget3">
		<fieldset>
			<legend><strong>Map</strong></legend>
			<div id="map"></div>
		</fieldset>
	</div>

    <script async defer
    	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAIAm2VjqSmcRmHmmu4L3MdMd_iGl836h4&callback=initMap">
    </script>
</body>
</html>