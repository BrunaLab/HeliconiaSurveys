jQuery(function(jQuery){

    function calculateMenuPosition(){
        var scroll = jQuery(window).scrollTop();

        //>=, not <=
        // Changed from 500 to 40
        if (scroll >= 40) {
            //clearHeader, not clearheader - caps H
            jQuery(".header-holder").addClass("fixed-top");
            jQuery(".header-holder").addClass("fixed-top");
        }else{
            jQuery(".header-holder").removeClass("fixed-top");

        }
    }

    jQuery(window).scroll(function() {
        calculateMenuPosition();
    });
    calculateMenuPosition();


    //var prevScrollTop = 0;
    //jQuery(window).scroll(function(event){
    //
    //    var scrollTop = jQuery(this).scrollTop();
    //
    //
    //    if ( scrollTop < 0 ) {
    //        scrollTop = 0;
    //    }
    //
    //    if (scrollTop >= prevScrollTop && scrollTop) {
    //        // scrolling down
    //            jQuery(".header-holder").removeClass("fixed-top")
    //    } else {
    //        // scrolling up
    //       // jQuery(".header-holder").addClass("fixed-top");
    //    }
    //    if(scrollTop == 0){
    //        jQuery(".header-holder").removeClass("fixed-top");
    //    }
    //    prevScrollTop = scrollTop;
    //});

    //Select wrappers
    jQuery('select.form-control').wrap('<span class="styled-select">');


    var w = jQuery(window).innerWidth();
    if(w <= 1023){
        //jQuery('.header-holder header#header .navbar-collapse > ul > li.menu-item-has-children').click(function(e){
        //    e.preventDefault();
        //    jQuery(this).toggleClass('opened');
        //});
        //jQuery('.header-holder header#header .navbar-collapse > ul > li.menu-item-has-children > ul > li.menu-item-has-children').click(function(e){
        //    e.preventDefault();
        //    jQuery(this).toggleClass('opened');
        //});

        jQuery('.header-holder header#header .navbar-collapse li.menu-item-has-children').on('click',function(e){
            e.stopPropagation();
        });
        jQuery('.header-holder header#header .navbar-collapse li.menu-item-has-children a').on('click',function(e){
            e.stopPropagation();
        });

        jQuery('.header-holder header#header .navbar-collapse > ul > li.menu-item-has-children > ul').on('click',function(e){
            e.stopPropagation();
        });


        jQuery('.header-holder header#header .navbar-collapse ul li.menu-item-has-children a').on('click',function(e){
            e.stopPropagation();
        });


        jQuery('.header-holder header#header .navbar-collapse > ul > li.menu-item-has-children > ul > li.menu-item-has-children > ul').on('click',function(e){
            e.stopPropagation();
        });
        jQuery('.header-holder header#header .navbar-collapse > ul > li.menu-item-has-children > ul > li.menu-item-has-children a').on('click',function(e){
            e.stopPropagation();
        });

        jQuery('#menu-primary_navigation > li > ul > li > ul > li > ul > li > ul > li').on('click',function(e){
            e.stopPropagation();
        });
        jQuery('#menu-primary_navigation > li > ul > li > ul > li > ul > li').on('click',function(e){
            e.stopPropagation();
        });
        jQuery('#menu-primary_navigation > li > ul > li > ul > li').on('click',function(e){
            e.stopPropagation();
        });
        jQuery('#menu-primary_navigation > li > ul > li ').on('click',function(e){
            e.stopPropagation();
        });
        jQuery('#menu-primary_navigation li.menu-item-has-children').click(function(e){
            e.preventDefault();
            jQuery(this).toggleClass('opened');
        });

        if(jQuery('.entry-sidebar').length > 0) {
            if (!jQuery.trim( jQuery('.entry-sidebar').html() ).length) {
                jQuery('.entry-sidebar').parent().addClass('mobile-hide-sidebar');
            }
        }

    }else{
        jQuery('.header-holder header#header .navbar-collapse li').removeClass('dropdown');
        jQuery('.header-holder header#header .navbar-collapse li a').removeClass('dropdown-toggle-link');
        jQuery('.header-holder header#header .navbar-collapse li a').removeAttr('data-toggle');
    }


    function sidebarDropDown(){
        var w = jQuery(window).innerWidth();
        var test = jQuery('.sidebar-before').length;
        if(test == 0){
            jQuery('.sidebar').parent().prepend('<div class="sidebar-before opened"><div class="toggle-sidebar"></div></div>');
            jQuery('.sidebar-before ').removeClass('opened');
        }
    }
    jQuery(window).resize(function(){
        sidebarDropDown();
    });
    sidebarDropDown();





    jQuery('.toggle-sidebar').click(function(e){
        e.preventDefault();
        jQuery(this).parent().toggleClass('opened');
    });


    jQuery('.tag-cloud-holder .showTagsOnClick').click(function(e){
        e.preventDefault();
        jQuery(this).hide();
        jQuery('.tag-cloud-holder .visibleOnClick').addClass('opened');
        jQuery('.gox-block-tags .row.view-all a').addClass('alt-arrow');
    })

    jQuery('.gox-block-tags .row.view-all a').click(function(e){
        e.preventDefault();
        jQuery(this).toggleClass('alt-arrow');
        jQuery('.tag-cloud-holder .showTagsOnClick').toggle();
        jQuery('.tag-cloud-holder .visibleOnClick').toggleClass('opened');
    })


    //jQuery For Menu dropdowns on pages
    jQuery('#main li.menu-item-has-children').on('click',function(e){
        e.preventDefault();
        e.stopPropagation();
        jQuery(this).toggleClass('opened');
    });
    jQuery('#main li.menu-item-has-children .sub-menu').on('click',function(e){
        e.stopPropagation();
    });

    jQuery('.navbar-toggler').click(function(){
       jQuery("html, body").animate({ scrollTop: 0 }, 0);
        jQuery('.header-holder').removeClass('fixed-top');
       jQuery('.header-holder').toggleClass('opened-submenu');
       jQuery('body').toggleClass('stop-scrolling');
    });
    jQuery('#main li.menu-item-has-children a').on('click',function(e){
        e.stopPropagation();
    });


    //Making Links of the buttons with is-style-with-right-text-button class
    jQuery('.is-style-with-right-text-button').each(function(){
        jQuery('a',this).attr('target',"_blank");
        var x = jQuery('.is-style-with-right-text-button').wrap('<div class="wp-block-column">');
        var Text = jQuery('a',this).html();
        var Link = jQuery('a',this).attr('href');
        jQuery('a',this).html(Link);
        jQuery(jQuery(this).parent('.wp-block-column')).wrap('<div class="wp-block-columns has-2-columns">');
        jQuery(this).parents('.wp-block-columns').prepend('<div class="wp-block-column"><p>'+Text+'</p></div>');
    });



 });