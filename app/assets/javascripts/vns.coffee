jQuery ->
  $('a.fancybox').fancybox()

jQuery ->
 $(".fancyframe").fancybox
  type: "iframe"
  width: 1000 
  height: 700  


  jQuery ->
  new CarrierWaveCropper()

class CarrierWaveCropper
  constructor: ->
    $('#vn_image_coverpage_cropbox').Jcrop
      aspectRatio: 3.942
      boxWidth: 1150
      boxHeight: 850
      setSelect: [0, 0, 1500, 900]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#vn_image_coverpage_crop_x').val(coords.x)
    $('#vn_image_coverpage_crop_y').val(coords.y)
    $('#vn_image_coverpage_crop_w').val(coords.w)
    $('#vn_image_coverpage_crop_h').val(coords.h)
    @updatePreview(coords)

  updatePreview: (coords) =>
    $('#vn_image_coverpage_previewbox').css
      width: Math.round(100/coords.w * $('#vn_image_coverpage_cropbox').width()) + 'px'
      height: Math.round(100/coords.h * $('#vn_image_coverpage_cropbox').height()) + 'px'
      marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
      marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'
