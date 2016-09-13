# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->

  $("#add_comment_link").click ->
    
    event.preventDefault()
    $("#show_comment").show();

    jQuery ->

  $("#hide_comment_link").click ->

    event.preventDefault()
    $("#show_comment").hide();

jQuery -> 
  users = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.whitespace,
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  limit: 10,
  #local http://localhost:3000/json/vns.json
  remote: {url:'users/typeahead/%QUERY'
   , wildcard: '%QUERY'
   }
  })

  users.initialize();
  $('.typeahead-users').typeahead(null, {
      name: "mysearch"
      display: "name"
      source: users.ttAdapter()
  })

jQuery ->
  new CarrierWaveCropper()

class CarrierWaveCropper
  constructor: ->
    $('#user_header_image_cropbox').Jcrop
      aspectRatio: 4.22
      boxWidth: 800
      boxHeight: 500
      setSelect: [0, 0, 1500, 900]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#user_header_image_crop_x').val(coords.x)
    $('#user_header_image_crop_y').val(coords.y)
    $('#user_header_image_crop_w').val(coords.w)
    $('#user_header_image_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    $('#user_header_image_previewbox').css
      width: Math.round(100/coords.w * $('#user_header_image_cropbox').width()) + 'px'
      height: Math.round(100/coords.h * $('#user_header_image_cropbox').height()) + 'px'
      marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'

