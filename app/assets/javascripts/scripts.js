$(function(){
    
    var modal = null;
    
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
        
        $('section.sidebar').css({
            'min-height': page_height,
            'max-height': page_height
        });
    });
    
    // Modals
    $('.sidebar .new').on('click', function(e){
        e.preventDefault();
        
        $('.modal-bg').fadeIn();
        $('.modal').addClass('loading').show();
        
        $('.modal-body').load($(this).attr('href') + ' .page', function(){
            $('.modal').removeClass('loading');
        });
        
    });
    
    $('.submit-form').on('click', function(){
        $('#modal form').submit();
    });
    
    $('.modal-bg, .modal .close').on('click', function(){
        $('#modal').hide();
        $('.modal-bg').fadeOut();
    });
});
