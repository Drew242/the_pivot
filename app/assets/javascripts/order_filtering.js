$(document).ready(function() {
  function make_filter(name) {
    $("#" + name + "-filter").click(function(){
      $("#admin_orders tbody tr").each(function(index, element) {
        var $element = $(element);
        if($element.hasClass(name)) {
          $element.show();
        } else {
          $element.hide();
        }
      })
    });

  }

  make_filter("ordered")
  make_filter("paid")
  make_filter("completed")
  make_filter("cancelled")
});
