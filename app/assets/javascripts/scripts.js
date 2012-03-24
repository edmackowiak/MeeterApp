$(function(){
    
    // Equal Heights
    $(window).load(function(){
        var page_height = $('.page').height();
        
        if( page_height < parseInt($('.page').css('min-height'))){
            page_height = parseInt($('.page').css('min-height')) + 'px';
        }
        
        $('section.sidebar').css('min-height', page_height);
    });

});
