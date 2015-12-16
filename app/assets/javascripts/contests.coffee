# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
jQuery ->

  $realInputField = $('.file-upload-real')
  # trigger the real input field click to bring up the file selection dialog
  $('.file-upload-clicker').click ->
    $realInputField.click() 
  $('.file-upload-real').change ->
    string = $(this).val()
    filename = string.replace(/^.*\\/, "")
    console.log(string)
    $('#file-upload-text').fadeIn("fast")
    $('#file-upload-text').val(filename)

jQuery ->
  new CarrierWaveCropper()

class CarrierWaveCropper
  constructor: ->
    $('#contestcharacter_image_cropbox').Jcrop
      aspectRatio: 1
      boxWidth: 950
      boxHeight: 650
      setSelect: [0, 0, 600, 600]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#contestcharacter_image_crop_x').val(coords.x)
    $('#contestcharacter_image_crop_y').val(coords.y)
    $('#contestcharacter_image_crop_w').val(coords.w)
    $('#contestcharacter_image_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    $('#contestcharacter_image_previewbox').css
      width: Math.round(100/coords.w * $('#contestcharacter_image_cropbox').width()) + 'px'
      height: Math.round(100/coords.h * $('#contestcharacter_image_cropbox').height()) + 'px'
      marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'
