$(document).ready(function(){
  $(".tab-set").tabs(
    {
      ajaxOptions:{cache:false},
      cache:true,
      select: function(event, ui) {
        if ($(ui.panel).text() == '')
          $(ui.panel).html('Loading...');
        request_tab(ui.panel.id);
        return true;
      }
    }
  );
  if($(".tab-set") && document.location.hash){
    $.scrollTo(".tab-set");
  }
  $(".tab-set ul").localScroll({
    target:".tab-set",
    duration:0,
    hash:true
  });
});

function request_tab(tab) {
  if (tab == "ui-tabs-1") {
    tab = "first_page";
  }
  $.ajax({
    url: "/tab/" + tab + "/" + $("#handle").text()
  });
}

