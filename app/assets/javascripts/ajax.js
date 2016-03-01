$(document).on('ajax:beforeSend', '.status-item', function(e) {
    $(this).append("<i class='fa fa-spinner fa-spin' style='margin-left:15px;'></i>");
});


$(document).on('ajax:beforeSend', '.status-fav', function(e) {
    $(".ajax-fav").replaceWith("<i class='fa fa-spinner fa-spin'></i>");
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