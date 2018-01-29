<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>UXP Project</title>
<link rel="stylesheet" type="text/css" href="./css/map_css.css">
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="./js/messageBroker.js" type="text/javascript"></script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAIAm2VjqSmcRmHmmu4L3MdMd_iGl836h4&callback=initMap">
	
</script>
</head>
<body>

	<div id="map_frame"></div>

	
	<script type="text/javascript">
		var map;
		var markers = [];
		var infoWindows = [];
		var sname;
		var msgBroker_map;
		msgBroker_map = new eseict.MessageBroker();
		//���۸� �ʱ�ȭ
		function initMap() {
			var suwon = {
				lat : 37.263,
				lng : 127.028
			};
			map = new google.maps.Map(document.getElementById('map_frame'), {
				zoom : 13,
				center : suwon
			});
		}

		//���� Ŭ�������� �ش� ���� �̸��� ã�� getAddr �Լ� ȣ��	
		$(document).ready(function() {
			
			msgBroker_map.addCommandHandler('From_addr_To_map_Content_guShelters', function(data){
	            showGuMarkers(data);
	         });
			
			msgBroker_map.addCommandHandler('From_addr_To_map_Content_oneShelter', function(data){
				showShelMarker(data);
	         });
	
		});



		//���θ� �ּҸ� ����,�浵�� ���·� ��ȯ�ؼ� ��Ŀ �߰�
		function codeAddress(address,sName, str) {
		var geocoder = new google.maps.Geocoder();

		geocoder.geocode(
		{
			'address' : address
		},
		function(results, status){
			if (status == 'OK'){
				map.setCenter(results[0].geometry.location);
				
				if(str == "one"){
					map.setZoom(18);
				}else{
					map.setZoom(13);
				}
				var marker = new google.maps.Marker({
					position : results[0].geometry.location, //�ʼ��׸�
					map : map,
					title : sName//�����׸�
				});
				
				
				markers.push(marker);
				
				var infowindow = new google.maps.InfoWindow({
					content: sName
				});
				google.maps.event.addListener(marker, 'click', function() {
					console.log(marker);
				    infowindow.open(map, marker);
				});
				
			}
		});
	}
	

		function setMapOnAll(map) {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(map);
			}
		}
		
		function showGuMarkers(data){
			setMapOnAll(null);
			$.each(data,function(index,item){
				var sname = item.sname;
				var addr = item.addr_gu + item.addr_detail;
				console.log(addr);
				codeAddress(addr,sname, "gu");
			});
	      }
		
		function showShelMarker(data){
			console.log(data);
			var sName = data.sName;
			var addr = data.sAddr;
			codeAddress(addr,sName, "one");
			
		}
		
		
		
		
	</script>
</body>
</html>