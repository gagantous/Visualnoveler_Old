$(document).on('ajax:beforeSend', '.status-item', function(e) {
    $(this).append("<i class='fa fa-spinner fa-spin' style='margin-left:15px;'></i>");
});
$(document).on('ajax:error', '.status-item', function(e) {
    // if There's an error, we remove the spinning indicator
    $("i",this).remove();
});

$(document).on('ajax:beforeSend', '.status-fav', function(e) {
    $(".ajax-fav").replaceWith("<i class='fa fa-spinner fa-spin'></i>");
});

$(document).ready(function(){
    $(".vn-column").children(".vn-column-data").hide();
    $(".vn-index-poster").one("load",function() {
      $(this).closest(".vn-column").children(".vn-column-data").show();
    }).each(function() {
      if (this.complete) $(this).load(); 
    });

    // show more characters functionality
    $("#more-characters").click(function(e) {
      e.preventDefault();
      $(".hidden-character").each(function() {
        $(this).removeClass("hidden-character");
      });
      $(".lazy-char-img").each(function() {
        $(this).attr("src",$(this).attr("data-src"));
        $(this).removeAttr("data-src");
      });
      $(this).hide();
      $('.equal-height-panels').matchHeight();
    });
});


// Input text at mouse cursor position at textarea
jQuery.fn.extend({
insertAtCaret: function(myValue){
  return this.each(function(i) {
    if (document.selection) {
      //For browsers like Internet Explorer
      this.focus();
      var sel = document.selection.createRange();
      sel.text = myValue;
      this.focus();
    }
    else if (this.selectionStart || this.selectionStart == '0') {
      //For browsers like Firefox and Webkit based
      var startPos = this.selectionStart;
      var endPos = this.selectionEnd;
      var scrollTop = this.scrollTop;
      this.value = this.value.substring(0, startPos)+myValue+this.value.substring(endPos,this.value.length);
      this.focus();
      this.selectionStart = startPos + myValue.length;
      this.selectionEnd = startPos + myValue.length;
      this.scrollTop = scrollTop;
    } else {
      this.value += myValue;
      this.focus();
    }
  });
}
});