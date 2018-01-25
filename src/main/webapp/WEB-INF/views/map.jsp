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
</head>
<body>

	<fieldset id="widget3">
		<legend>
			<strong>Map</strong>
		</legend>
		<div id="map"></div>
	</fieldset>

	<input type=button class="gu_btn" name="btn1" id="btn1" value="��ȱ�">
	<input type=button class="gu_btn" name="gu_btn" id="btn2" value="�ȴޱ�">
	<input type=button class="gu_btn" name="gu_btn" id="btn3" value="�Ǽ���">
	<input type=button class="gu_btn" name="gu_btn" id="btn4" value="���뱸">

	<script type="text/javascript">
<<<<<<< HEAD

		function initMap() { //���۸� �ʱ�ȭ
		    var uluru = {lat: 37.263, lng: 127.028};
		    var map = new google.maps.Map(document.getElementById('map'), {
		      zoom: 13,
		      center: uluru
		    });
		    var marker = new google.maps.Marker({
		      position: uluru,
		      map: map
		    });
		    var geocoder = new google.maps.Geocoder();
		    codeAddress(geocoder, map);
		  }
		
		function codeAddress(geocoder, resultMap) { //���θ� �ּҸ� ����,�浵�� ���·� ��ȯ�ؼ� ��Ŀ �߰�
		    var address = item.addr_gu + " " addr_detail;
		    geocoder.geocode( { 'address': address}, function(results, status) {
		      if (status == 'OK') {
		        map.setCenter(results[0].geometry.location);
		        var marker = new google.maps.Marker({
		            map: map,
		            position: results[0].geometry.location
		        });
		        
		      } else {
		        alert('Geocode was not successful for the following reason: ' + status);
		      }
		    });
		  }

=======
	
	
>>>>>>> 8e399acded0755f71f87f05cc9114dfe261b2ea2
		//���� Ŭ�������� �ش� ���� �̸��� ã�� getAddr �Լ� ȣ��	
		$(document).ready(function() {

			$('.gu_btn').each(function(i) {
				$(this).click(function(e) {
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
<<<<<<< HEAD
		} 
=======
			/*
			var element = $("#shel_frame");
			var prependStr = "<ul class='shel_content' style='height:30px;'>"
					+ "<li style='height:15px;'>" + addr + "</li>" + "</ul>";
			element.append(prependStr);*/
			 
			codeAddress(addr);
		   


		}
		

		
		function codeAddress(address) { //���θ� �ּҸ� ����,�浵�� ���·� ��ȯ�ؼ� ��Ŀ �߰�
		

		     //var address = document.getElementById('address').value;
		    var address = addr;
		    var geocoder = new google.maps.Geocoder();
		    geocoder.geocode( { 'address': address}, function(results, status) {
		      if (status == 'OK') {
		        map.setCenter(results[0].geometry.location);
		        var marker = new google.maps.Marker({
		            map: map,
		            position: results[0].geometry.location
		        });
		        
		      } else {
		        alert('Geocode was not successful for the following reason: ' + status);
		      }
		    }); 
		    
	
		    }
		    
		    
		    
		    
		  
>>>>>>> 8e399acded0755f71f87f05cc9114dfe261b2ea2
	</script>

	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAIAm2VjqSmcRmHmmu4L3MdMd_iGl836h4&callback=initMap">
		
	</script>

	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC6pz5syNETKgNa1827k75Zwl8c2vnvqik&callback=initMap"
		type="text/javascript">
		
	</script>

</body>
</html>