<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>UXP Project</title>
<link rel="stylesheet" type="text/css" href="./css/map_css.css">
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script src="./js/messageBroker.js" type="text/javascript"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAIAm2VjqSmcRmHmmu4L3MdMd_iGl836h4&callback=initMap"></script>
</head>
<script type="text/javascript">
	
	var map;
	var markers = [];
	var infoWindows = [];
	var sname;
	var msgBroker_map;
	msgBroker_map = new eseict.MessageBroker();
	
	/**
	 * [����] ���۸� �ʱ�ȭ
	 * @author : ByungWun Kang
	 * @since : 2018-01-29
	 */
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

	/**
	 * [����] ���� Ŭ�������� �ش� ���� �̸��� ã�� getAddr �Լ� ȣ��	
	 * @author : YoonAh Park
	 * @since : 2018-01-29
	 */
	$(document).ready(function() {
		//���� �� ��ư�� Ŭ�� ���� ��û�� ����ؼ� ���
		msgBroker_map.addCommandHandler('From_addr_To_map_Content_guShelters', function(data){
            showGuMarkers(data);
         });
		//���Ǽ� ��ġ Ŭ�� ���� ��û�� ����ؼ� ���
		msgBroker_map.addCommandHandler('From_addr_To_map_Content_oneShelter', function(data){
			showShelMarker(data);
         });
	});
	
	/**
	 * [����] ���۸� marker�� ��ǳ�� ǥ��
	 * @author : ByungWun Kang, YoonAh Park, SeungHun Ji
	 * @since : 2018-01-29
	 */
	function codeAddress(data, str) {
		//���Ǽ� �ּ� �ϳ��� Ŭ��������
		if(str == "one"){
			var sname = data.sname;
			var address = data.addr;
			var div = data.div;
			var size = data.size;
			var cap = data.cap;
			map.setZoom(16); //���� ���� Ȯ��/��� ����
		}else{
		//�������� Ŭ��������
		 	var sname = data.sname;
			var address = data.addr_gu +" "+ data.addr_detail;
			var div = data.division;
			var size = data.size;
			var cap = data.capacity;
			map.setZoom(13);
		}
		
		//��Ŀ Ŭ�� �� ���� ���� html�� �ۼ�
		var contentString = "<h2>"+sname+"</h2>";
			contentString+=	"<hr>";
			contentString+= "<strong> �ּ� : </strong>"+address;
			contentString+=	"<br>";
			contentString+= "<strong> ���� : </strong>"+div;
			contentString+=	"<br>";
			contentString+= "<strong> ũ�� : </strong>"+size;
			contentString+=	"<br>";
			contentString+= "<strong>���� �ο� : </strong>"+cap;
		
		
		var geocoder = new google.maps.Geocoder();

		geocoder.geocode({
			'address' : address
		},
		function(results, status){
			if (status == 'OK'){
				
				map.setCenter(results[0].geometry.location);
				
				//��ü�� ���������� �����ϱ� ���� var marker�� �ؾ��Ѵ�.
				var marker = new google.maps.Marker({
					position : results[0].geometry.location, //�ʼ��׸�
					map : map, 
				});
				
				
				markers.push(marker);
				//��Ŀ�� Ŭ������ �� ����â ���� �Է�
				var infowindow = new google.maps.InfoWindow({
					content: contentString
				});
				//��Ŀ�� Ŭ������ �� ����â ���� ��µǵ��� ����
				google.maps.event.addListener(marker, 'click', function() {
				    infowindow.open(map, marker);
				});
				
			}
		});
	}

	/**
	 * [����] marker �ʱ�ȭ
	 * @author : ByungWun Kang
	 * @since : 2018-01-29
	 */
	function setMapOnAll(map) {
		for (var i=0; i<markers.length; i++) {
			markers[i].setMap(map);
		}
	}
	
	/**
	 * [����] �������� ���Ǽ� �ּҵ��� ������ �޾Ƽ� codeAddress�Լ��� ����
	 * @author : YoonAh Park
	 * @since : 2018-01-29
	 */
	function showGuMarkers(data){
		setMapOnAll(null);
		$.each(data,function(index,item){
			codeAddress(item, "gu");
		});
      }
	
	/**
	 * [����] ���Ǽ� �ּ� �ϳ��� ������ �޾Ƽ� codeAddress�Լ��� ����
	 * @author : YoonAh Park
	 * @since : 2018-01-29
	 */
	function showShelMarker(data){
		codeAddress(data, "one");
	}
	
</script>
<body>
	<div id="map_frame"></div>
</body>
</html>