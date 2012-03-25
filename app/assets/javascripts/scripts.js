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
    
    if( $('body').hasClass('meeting') && ( $('body').hasClass('new') || $('body').hasClass('edit') )){
        var $this = $('.sidebar nav li:last-child a');
        
        // Highlight tab
        $('.sidebar nav li').removeClass('active');
        $this.parent().addClass('active');
        
        $('.tab').hide();
        $('.' + $this.attr('href') + '-tab').show();;
    }
    
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
    $('.sidebar .new-person').on('click', function(e){
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
    
    // Add attendees
    $('.sidebar .people li').on('click', function(){
        var $this = $(this);
        var $checkbox = $('input[type="checkbox"]', $this);
        
        if( $checkbox.attr('checked') == 'checked'){
            $this.removeClass('selected');
            $checkbox.removeAttr('checked');
        } else {
            $this.addClass('selected');
            $checkbox.attr('checked', 'checked');
        }
    });
});
