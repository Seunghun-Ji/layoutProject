<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>UXP Project</title>
<link rel="stylesheet" type="text/css" href="./css/widget_css.css">
<script src="./js/widget_js.js" type="text/javascript"></script>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
</head>
<body>
	<div id="widget1">
		<table border="1">
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
			        <th scope="row" rowspan="6">
			        	<input type=button value="장안구">
			        	<input type=button value="팔달구">
			        	<input type=button value="권선구">
			        	<input type=button value="영통구">
			        </th>
			        <td id="allConst" name="allConst" rowspan="6">
			        	<ul>
			        		<li >경기도 수원시 권선구 호매실로 22-50 (탑동, 권선구 보건소)</li>
			        		<li>경기도 수원시 권선구 금호로 83-7 (금곡동)</li>
			        		<li>경기도 수원시 권선구 세화로 46 (평동)</li>
			        		<li>경기도 수원시 권선구 상탑로 111-40(서둔동)</li>
			        		<li>경기도 수원시 권선구 서부로 1382 (오목천동)</li>
			        		<li>경기도 수원시 권선구 권중로 7(권선동)</li>
			        	</ul>
			        </td>
			        <td rowspan="6" id="shel_frame" name="shel_frame" class="shel_frame " >
				        <ul name="shel">
				        	<li name="sname">청정공원</li>
				        	<li name="saddr">경기도 수원시 권선구 권선동 1198</li>
				   
				        </ul>
			        </td>
			    </tr>
		    </tbody>
		</table>
	</div>
	
	<div id="map"></div>

    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAIAm2VjqSmcRmHmmu4L3MdMd_iGl836h4&callback=initMap">
    </script>
</body>
</html>