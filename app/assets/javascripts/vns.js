
$(document).on('ajax:beforeSend', '.status-item', function(e) {
    $(this).append("<i class='fa fa-spinner fa-spin' style='margin-left:15px;'></i>");
});
