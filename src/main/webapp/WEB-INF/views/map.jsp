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

	<input type=button class="gu_btn" value="��ȱ�">
	<input type=button class="gu_btn" value="�ȴޱ�">
	<input type=button class="gu_btn" value="�Ǽ���">
	<input type=button class="gu_btn" value="���뱸">

	<script type="text/javascript">
		var map;
		var markers=[];
		
		//���۸� �ʱ�ȭ
		function initMap() { 
		    var suwon = {lat: 37.263, lng: 127.028};
		    map = new google.maps.Map(document.getElementById('map'), {zoom: 13, center: suwon} );
		}
		
		//���� Ŭ�������� �ش� ���� �̸��� ã�� getAddr �Լ� ȣ��	
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

		//��Ʈ�ѷ��� �� �̸� ���� �� �ش� ���� ���Ǽ� �ּҸ� ������
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

		//�ּҵ��� �ϳ��� ����
		function parsingJsonArr(msg) {
			$("#shel_frame").empty();
			$.each(msg, function(index, item) {
				shelCreate(item);
			});
		}

		//���Ǽ��ּ� �ϳ��� �������� ������
		function shelCreate(item) {
			var sname = item.sname; //�ǹ��̸�
			var addr_gu = item.addr_gu; //������ 00��
			var addr_detail = item.addr_detail; //00�� 00��(���ּ�)
			var addr = addr_gu + " " + addr_detail; //�����ּ�
			codeAddress(addr);
		} 
		
		//���θ� �ּҸ� ����,�浵�� ���·� ��ȯ�ؼ� ��Ŀ �߰�
		function codeAddress(addr) { 
		    var address = addr;
		    var geocoder = new google.maps.Geocoder();
		    
		    geocoder.geocode( { 'address': address}, function(results, status) {
		      if (status == 'OK') {	
		        map.setCenter(results[0].geometry.location);
		        marker = new google.maps.Marker({
		            position: results[0].geometry.location, //�ʼ��׸�
		            map: map //�����׸�
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