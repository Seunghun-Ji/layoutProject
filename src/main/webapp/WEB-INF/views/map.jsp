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
	 * [설명] 구글맵 초기화
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
	 * [설명] 구를 클릭했을때 해당 구의 이름을 찾고 getAddr 함수 호출	
	 * @author : YoonAh Park
	 * @since : 2018-01-29
	 */
	$(document).ready(function() {
		//지역 구 버튼을 클릭 관련 요청을 계속해서 대기
		msgBroker_map.addCommandHandler('From_addr_To_map_Content_guShelters', function(data){
            showGuMarkers(data);
         });
		//대피소 위치 클릭 관련 요청을 계속해서 대기
		msgBroker_map.addCommandHandler('From_addr_To_map_Content_oneShelter', function(data){
			showShelMarker(data);
         });
	});
	
	/**
	 * [설명] 구글맵 marker와 말풍선 표시
	 * @author : ByungWun Kang, YoonAh Park, SeungHun Ji
	 * @since : 2018-01-29
	 */
	function codeAddress(data, str) {
		//대피소 주소 하나만 클릭했을때
		if(str == "one"){
			var sname = data.sname;
			var address = data.addr;
			var div = data.div;
			var size = data.size;
			var cap = data.cap;
			map.setZoom(16); //구글 맵의 확대/축소 설정
		}else{
		//지역구를 클릭했을때
		 	var sname = data.sname;
			var address = data.addr_gu +" "+ data.addr_detail;
			var div = data.division;
			var size = data.size;
			var cap = data.capacity;
			map.setZoom(13);
		}
		
		//마커 클릭 시 나올 내용 html로 작성
		var contentString = "<h2>"+sname+"</h2>";
			contentString+=	"<hr>";
			contentString+= "<strong> 주소 : </strong>"+address;
			contentString+=	"<br>";
			contentString+= "<strong> 구분 : </strong>"+div;
			contentString+=	"<br>";
			contentString+= "<strong> 크기 : </strong>"+size;
			contentString+=	"<br>";
			contentString+= "<strong>수용 인원 : </strong>"+cap;
		
		
		var geocoder = new google.maps.Geocoder();

		geocoder.geocode({
			'address' : address
		},
		function(results, status){
			if (status == 'OK'){
				
				map.setCenter(results[0].geometry.location);
				
				//객체를 지속적으로 생성하기 위해 var marker로 해야한다.
				var marker = new google.maps.Marker({
					position : results[0].geometry.location, //필수항목
					map : map, 
				});
				
				
				markers.push(marker);
				//마커를 클릭했을 때 정보창 내용 입력
				var infowindow = new google.maps.InfoWindow({
					content: contentString
				});
				//마커를 클릭했을 때 정보창 내용 출력되도록 설정
				google.maps.event.addListener(marker, 'click', function() {
				    infowindow.open(map, marker);
				});
				
			}
		});
	}

	/**
	 * [설명] marker 초기화
	 * @author : ByungWun Kang
	 * @since : 2018-01-29
	 */
	function setMapOnAll(map) {
		for (var i=0; i<markers.length; i++) {
			markers[i].setMap(map);
		}
	}
	
	/**
	 * [설명] 지역구의 대피소 주소들의 정보를 받아서 codeAddress함수로 전달
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
	 * [설명] 대피소 주소 하나의 정보를 받아서 codeAddress함수로 전달
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