$(function(){
    
    // Sidebar Tabs
    $('.sidebar nav a').on('click', function(e){
        var $this = $(this);
        
        // Highlight tab
        $('.sidebar nav li').removeClass('active');
        $this.parent().addClass('active');
        
        $('.tab').hide();
        $('.' + $this.attr('href') + '-tab').show();;
        e.preventDefault();
    });
    
    // Equal Heights
    $(window).load(function(){
        var page_height = $('.page').height();
        
        if( page_height < parseInt($('.page').css('min-height'))){
            page_height = parseInt($('.page').css('min-height')) + 'px';
        }
        
        $('section.sidebar').css('min-height', page_height);
    });

});
