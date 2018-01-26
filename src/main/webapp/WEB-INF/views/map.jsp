<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>UXP Project</title>
<link rel="stylesheet" type="text/css" href="./css/map_css.css">
<script src="./js/widget_js.js" type="text/javascript"></script>
<script src="./js/jquery-3.3.1.min.js" type="text/javascript"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAIAm2VjqSmcRmHmmu4L3MdMd_iGl836h4&callback=initMap">
</script>
</head>
<body>

	<div id="map"></div>

	<input type=button class="gu_btn" value="장안구">
	<input type=button class="gu_btn" value="팔달구">
	<input type=button class="gu_btn" value="권선구">
	<input type=button class="gu_btn" value="영통구">

	<script type="text/javascript">
		var map;
		var markers=[];
		
		//구글맵 초기화
		function initMap() { 
		    var suwon = {lat: 37.263, lng: 127.028};
		    map = new google.maps.Map(document.getElementById('map'), {zoom: 13, center: suwon} );
		}
		
		//구를 클릭했을때 해당 구의 이름을 찾고 getAddr 함수 호출	
		$(document).ready(function() {
			$('.gu_btn').each(function(i) {
 				$(this).click(function(e) {
 					setMapOnAll(null);
					e.preventDefault();
					var guName = $(this).attr("value");
					getAddr(guName);
				});				
			});
		});

		//컨트롤러로 구 이름 전송 후 해당 구의 대피소 주소를 가져옴
		function getAddr(guName) {
			var ob = new Object();
			ob.guName = guName;

			$.ajax({
				url : '/get/shelter/info',
				data : ob,
				dataType : 'json',
				success : function(msg) {
					parsingJsonArr(msg);
				}
			});
		}

		//주소들을 하나씩 나눔
		function parsingJsonArr(msg) {
			$("#shel_frame").empty();
			$.each(msg, function(index, item) {
				shelCreate(item);
			});
		}

		//대피소주소 하나씩 페이지에 보여줌
		function shelCreate(item) {
			var sname = item.sname; //건물이름
			var addr_gu = item.addr_gu; //수원시 00구
			var addr_detail = item.addr_detail; //00로 00길(상세주소)
			var addr = addr_gu + " " + addr_detail; //최종주소
			codeAddress(addr);
		} 
		
		//도로명 주소를 위도,경도의 형태로 변환해서 마커 추가
		function codeAddress(addr) { 
		    var address = addr;
		    var geocoder = new google.maps.Geocoder();
		    
		    geocoder.geocode( { 'address': address}, function(results, status) {
		      if (status == 'OK') {	
		        map.setCenter(results[0].geometry.location);
		        marker = new google.maps.Marker({
		            position: results[0].geometry.location, //필수항목
		            map: map //선택항목
		        });
		        
		        markers.push(marker);		   
		      }		      
	    	});	     
	  	}
		
		function setMapOnAll(map) {
	        for (var i = 0; i < markers.length; i++) {
	          markers[i].setMap(map);
	        }
	    }
	</script>
</body>
</html>