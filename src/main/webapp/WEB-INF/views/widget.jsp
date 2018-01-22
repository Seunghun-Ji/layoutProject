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
				  <p>���������ʴ� �������Դϴ�.</P>
				</video> 
			  </td>
		      <td>
		      	<video controls>
					<source src="./images/sample.mp4" type ="video/mp4">
					<source src="img/webm" type ="video/webm">
					<source src="img/ogv" type ="video/ogg">
				    <source src="">
				  <p>���������ʴ� �������Դϴ�.</P>
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
				  <p>���������ʴ� �������Դϴ�.</P>
				</video> 
			  </td>
		      <td>
		      	<video controls>
					<source src="./images/sample.mp4" type ="video/mp4">
					<source src="img/webm" type ="video/webm">
					<source src="img/ogv" type ="video/ogg">
				    <source src="">
				  <p>���������ʴ� �������Դϴ�.</P>
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
				  <p>���������ʴ� �������Դϴ�.</P>
				</video> 
			  </td>
		      <td>
		      	<video controls>
					<source src="./images/sample.mp4" type ="video/mp4">
					<source src="img/webm" type ="video/webm">
					<source src="img/ogv" type ="video/ogg">
				    <source src="">
				  <p>���������ʴ� �������Դϴ�.</P>
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
				  <p>���������ʴ� �������Դϴ�.</P>
				</video> 
			  </td>
		      <td>
		      	<video controls>
					<source src="./images/sample.mp4" type ="video/mp4">
					<source src="img/webm" type ="video/webm">
					<source src="img/ogv" type ="video/ogg">
				    <source src="">
				  <p>���������ʴ� �������Դϴ�.</P>
				</video> 
			  </td>
		   </tr>
		</table>
	</div>
	
	<div id="widget2">
		<table class="type08">
		    <thead>
			    <tr>
			        <th scope="cols">����</th>
			        <th scope="cols">�ǹ� �ּ�</th>
			        <th scope="cols">���Ǽ� �ּ�</th>
			    </tr>
		    </thead>
		    <tbody>
			    <tr>
			        <th scope="row" rowspan="6">
			        	<button>��ȱ�</button>
			        	<button>�ȴޱ�</button>
			        	<button>�Ǽ���</button>
			        	<button>���뱸</button>
			        </th>
			        <td rowspan="6">
			        	<ul>
			        		<li>��⵵ ������ �Ǽ��� ȣ�ŽǷ� 22-50 (ž��, �Ǽ��� ���Ǽ�)</li>
			        		<li>��⵵ ������ �Ǽ��� ��ȣ�� 83-7 (�ݰ)</li>
			        		<li>��⵵ ������ �Ǽ��� ��ȭ�� 46 (��)</li>
			        		<li>��⵵ ������ �Ǽ��� ��ž�� 111-40(���е�)</li>
			        		<li>��⵵ ������ �Ǽ��� ���η� 1382 (����õ��)</li>
			        		<li>��⵵ ������ �Ǽ��� ���߷� 7(�Ǽ���)</li>
			        	</ul>
			        </td>
			        <td rowspan="6">
				        <ul>
				        	<li>û������(��⵵ ������ �Ǽ��� �Ǽ��� 1198)</li>
				        	<li>�Ǽ��߾Ӱ���(��⵵ ������ �Ǽ��� �Ǽ��� 1269)</li>
				        	<li>ž������(��⵵ ������ �Ǽ��� ž���� 57���� 35)</li>
				        	<li>�������(��⵵ ������ �Ǽ��� ����� 14���� 42)</li>
				        	<li>��������(��⵵ ������ �Ǽ��� ������� 26���� 30)</li>
				        	<li>�������(��⵵ ������ �Ǽ��� ����� 14���� 42)</li>
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