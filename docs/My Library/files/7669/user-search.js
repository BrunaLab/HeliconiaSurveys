jQuery(function(jQuery){


    if(jQuery(document.forms["search-form"]).length > 0) {


        jQuery('.open-popup-search').click(function(e){
            e.preventDefault();
            jQuery('.popup-search').show();
            jQuery(document.forms["search-form"]["s"]).focus();
        });


        jQuery('body').delegate( ".popup-search .close-popup", "click", function(e) {
                e.preventDefault();
                jQuery('.popup-search').hide();
                jQuery('.popup-search #search-results').html('');
                document.forms["search-form"]["s"].value = "";
           });


        jQuery(document.forms["search-form"]["s"]).on('keyup touchend',function (e) {

            //post_id = jQuery(this).attr("data-post_id")
            var nonce = jQuery(this).attr("data-nonce");
            var targetpage = jQuery(document.forms["search-form"]).attr('data-search');
            var search_text = jQuery(this).val();
            if(search_text.length > 0) {
                jQuery('.popup-search #search-results').html('');
                jQuery.ajax({
                    type: "post",
                    dataType: "json",
                    url: myAjax.ajaxurl,
                    data: {action: "user_search", nonce: nonce, search_text: search_text},
                    success: function (response) {
                        if (response.type == "success") {
                            jQuery('.popup-search #search-results').html('<h4>Subjects</h4>');
                            for (var i = 0; i < response.data.length; i++) {
                               // console.log(response.data[i]);
                                jQuery('.popup-search #search-results').append('<a href="'+ targetpage + '/current/' + response.data[i].taxonomy + '/' + response.data[i].slug + '" class="tag-cloud-link tag-link-' + response.data[i].term_id + '" aria-label="' + response.data[i].name + '">' + response.data[i].name + '</a>');
                            }
                            if (response.data.length == 0) {
                                jQuery('.popup-search #search-results').html('');
                            }
                        }
                        else {
                            jQuery('.popup-search #search-results').html('');
                        }
                    }
                });
            }else{
                jQuery('.popup-search #search-results').html('');
            }

        });
    }


});
