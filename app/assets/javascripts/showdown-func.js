$(document).ready(function() {
  $('#markdown').keyup(function() { 
    $text = document.getElementById('markdown').value;
    $target = document.getElementById('preview');
    $converter = new showdown.Converter({simplifiedAutoLink: true});
    $html = $converter.makeHtml($text);
    $target.innerHTML = $html;
  });


});

$(function() {

    $markdowntext = $('#markdown').val();
    if ($markdowntext) {
      $targetDiv = $('#preview')[0];
      $converter = new showdown.Converter({simplifiedAutoLink: true});
      var html = $converter.makeHtml($markdowntext);
      $targetDiv.innerHTML = html;
    };
    

});

// The function to replace using redcarpet serverside 
// $(function() {
//     $markdowntext = '<%= @review.details.gsub! "\r\n","" %>';
//     $markdownDiv = $('#markdowntest')[0];
//     $converter = new showdown.Converter();
//     var html = $converter.makeHtml($markdowntext);
//     $markdownDiv.innerHTML = html;

// });