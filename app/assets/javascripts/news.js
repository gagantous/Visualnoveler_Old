$(document).ready(function() {
  $('iframe').each(function() {
 	if ((this.src.toLowerCase().indexOf("youtube") >= 0)) {

    	$(this).wrap('<div class="responsive-video"></div>');
 	} else {
    	$(this).wrap('<div class="responsive-default"></div>');
 	}
  });
}); 