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




