$(document).on('ajax:beforeSend', '.status-item', function(e) {
    $(this).append("<i class='fa fa-spinner fa-spin' style='margin-left:15px;'></i>");
});


$(document).on('ajax:beforeSend', '.status-fav', function(e) {
    $(".ajax-fav").replaceWith("<i class='fa fa-spinner fa-spin'></i>");
});

// $(document).on('ajax:beforeSend', '.status-fav', function(e) {
//     $().html("<i class='fa fa-spinner fa-spin'></i>");
// });