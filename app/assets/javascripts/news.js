$(document).ready(function() {
  $('iframe').each(function() {
    $(this).wrap('<div class="responsive-video"></div>');
  });
}); 