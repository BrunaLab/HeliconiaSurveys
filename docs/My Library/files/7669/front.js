jQuery(document).ready(function($){
    $(".wp-block-gox-block-dropdown .gox-block-dropdown-header").click(function() {
        $(this).parent().toggleClass('opened');
    });
});