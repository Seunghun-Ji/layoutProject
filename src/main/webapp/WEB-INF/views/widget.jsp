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
					<source src="img/webm" type ="video/webm">
					<source src="img/ogv" type ="video/ogg">
				    <source src="">
				  <p>지원하지않는 브라우저입니다.</P>
				</video> 
			  </td>
		      <td>
		      	<video controls>
					<source src="./images/sample.mp4" type ="video/mp4">
					<source src="img/webm" type ="video/webm">
					<source src="img/ogv" type ="video/ogg">
				    <source src="">
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
					<source src="img/webm" type ="video/webm">
					<source src="img/ogv" type ="video/ogg">
				    <source src="">
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
					<source src="img/webm" type ="video/webm">
					<source src="img/ogv" type ="video/ogg">
				    <source src="">
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
					<source src="img/webm" type ="video/webm">
					<source src="img/ogv" type ="video/ogg">
				    <source src="">
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
			        	<button>장안구</button>
			        	<button>팔달구</button>
			        	<button>권선구</button>
			        	<button>영통구</button>
			        </th>
			        <td rowspan="6">
			        	<ul>
			        		<li>경기도 수원시 권선구 호매실로 22-50 (탑동, 권선구 보건소)</li>
			        		<li>경기도 수원시 권선구 금호로 83-7 (금곡동)</li>
			        		<li>경기도 수원시 권선구 세화로 46 (평동)</li>
			        		<li>경기도 수원시 권선구 상탑로 111-40(서둔동)</li>
			        		<li>경기도 수원시 권선구 서부로 1382 (오목천동)</li>
			        		<li>경기도 수원시 권선구 권중로 7(권선동)</li>
			        	</ul>
			        </td>
			        <td rowspan="6">
				        <ul>
				        	<li>청정공원(경기도 수원시 권선구 권선동 1198)</li>
				        	<li>권선중앙공원(경기도 수원시 권선구 권선동 1269)</li>
				        	<li>탑동공원(경기도 수원시 권선구 탑동로 57번길 35)</li>
				        	<li>구운공원(경기도 수원시 권선구 구운로 14번길 42)</li>
				        	<li>여기산공원(경기도 수원시 권선구 여가산로 26번길 30)</li>
				        	<li>구운공원(경기도 수원시 권선구 구운로 14번길 42)</li>
				        </ul>
			        </td>
			    </tr>
		    </tbody>
		</table>
	</div>
	
	<div id="map"></div>
	
	<script>
      function initMap() {
        var uluru = {lat: 37.263, lng: 127.028};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 12,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAIAm2VjqSmcRmHmmu4L3MdMd_iGl836h4&callback=initMap">
    </script>
</body>
</html>