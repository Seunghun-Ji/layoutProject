/**
 * 
 */

$(function() {
    
    $('img').dblclick(function(event){
//    $('img').bind('dblclick', function(event){  
        var $target = $(this); // $(event.target);
        $target.width($target.width()+20);  // 나누기는 축소
        $target.height($target.height()+20);
    });
});

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


