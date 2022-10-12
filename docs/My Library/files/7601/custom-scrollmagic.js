(function ($, Drupal) {

  // ScrollMagic configuration.
  Drupal.behaviors.ScrollMagic = {
    attach: function() {
      // init controller
      var controller = new ScrollMagic.Controller();

      if (window.matchMedia('(min-height: 901px)').matches) {
        // build scene 1
        var scene = new ScrollMagic.Scene({triggerElement: "#trigger1", duration: 300, offset: 400})
          .setPin("#pin1")
          .addTo(controller);

        // build scene 2
        var scene2 = new ScrollMagic.Scene({triggerElement: "#trigger2", duration: 200, offset: 400})
          .setPin("#pin2")
          .addTo(controller);
      }
      else {
        // build scene 1
        var scenem = new ScrollMagic.Scene({triggerElement: "#trigger1", duration: 300, offset: 240})
          .setPin("#pin1")
          .addTo(controller);

        // build scene 2
        var scenem2 = new ScrollMagic.Scene({triggerElement: "#trigger2", duration: 200, offset: 240})
          .setPin("#pin2")
          .addTo(controller);
      }

      // build scene 3
      var duration1 = $("#back-animation").height();
      var scene3 = new ScrollMagic.Scene({triggerElement: "#trigger4", duration: duration1, offset: 0})
        .setPin("#pin4")
        .addTo(controller);

      var slidesAnimation = $("#slides-animation");
      slidesAnimation.addClass("slide-image1");
      $("#p1").waypoint(function () {
        slidesAnimation.addClass("slide-image1");
        slidesAnimation.removeClass("slide-image2");
        slidesAnimation.removeClass("slide-image3");
        slidesAnimation.removeClass("slide-image4");
      });
      $("#p2").waypoint(function () {
        slidesAnimation.addClass("slide-image2");
        slidesAnimation.removeClass("slide-image1");
        slidesAnimation.removeClass("slide-image3");
        slidesAnimation.removeClass("slide-image4");
      }, { offset: '50%' });
      $("#p3").waypoint(function () {
        slidesAnimation.addClass("slide-image3");
        slidesAnimation.removeClass("slide-image1");
        slidesAnimation.removeClass("slide-image2");
        slidesAnimation.removeClass("slide-image4");
      }, { offset: '50%' });
      $("#p4").waypoint(function () {
        slidesAnimation.addClass("slide-image4");
        slidesAnimation.removeClass("slide-image1");
        slidesAnimation.removeClass("slide-image3");
        slidesAnimation.removeClass("slide-image2");
      }, { offset: '50%' });

      // build scene 4
      var offset2 = $("#dfs").height();
      var smoffset = 400;
      var dfimage = $('.dig-feature__image').height();
      var duration = offset2 - smoffset - (dfimage/2);
      var scene4 = new ScrollMagic.Scene({triggerElement: "#trigger3", duration: duration, offset: smoffset})
        .setPin("#pin3")
        .addTo(controller);

      // build scene 5.
      var digAnimation = $("#sb-dig-animation");
      var digAnimationCounter = 0;

      if (typeof scene5 !== "undefined") {
        if (scene5.length > 0) {
          digAnimation.css("background-image", "url(" + scene5[0].image + ")");
          $.each(scene5, function (index, info) {
            if (info.target_id.length > 0 && info.image.length > 0) {
              var partId = '#' + info.target_id;
              if (digAnimationCounter > 0) {
                $(partId).waypoint(function (direction) {
                  if (direction === 'down') {
                    digAnimation.css("background-image", "url(" + info.image + ")");
                  }
                }, {
                  offset: '50%'
                });
              }
              else {
                $(partId).waypoint(function (direction) {
                  if (direction === 'down') {
                    digAnimation.css("background-image", "url(" + info.image + ")");
                  }
                });
              }
              $(partId).waypoint(function (direction) {
                if (direction === 'up') {
                  digAnimation.css("background-image", "url(" + info.image + ")");
                }
              }, {
                offset: '-50%'
              });
              digAnimationCounter++;
            }
          });
        }
      }
    }
  };

})(jQuery, Drupal);
