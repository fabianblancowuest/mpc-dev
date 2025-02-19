$(document).ready(function() {
    $('.tooltip[id^="tooltip_"]').each
        
        (function(){
        $(this).qtip({
            content: $('#data_' + $(this).attr('id')),
                show: {
            },
            hide: {
                fixed: true,
                delay: 180
            }
        });
    });
});