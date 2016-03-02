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