jQuery ->
  $('a.fancybox').fancybox({padding: 0,helpers: {thumbs: {width: 100,height: 60}}})

jQuery ->
  $('a.fancybox-character').fancybox({padding: 0,helpers: {thumbs: {width: 62,height: 90}}})

jQuery ->
  $('a.fancybox-character-mobile').fancybox({padding: 0,prevEffect: 'none',nextEffect: 'none'
                                            ,helpers: {thumbs: {width: 62,height: 90}}})
jQuery ->
  $('a.fancybox-mobile').fancybox({padding: 0,prevEffect: 'none',nextEffect: 'none'
                                            ,helpers: {thumbs: {width: 100,height: 60}}})


jQuery ->
  $('.vn-tooltip-related').tooltip();

jQuery ->
 $(".fancyframe").fancybox
  type: "iframe"
  width: 1000 
  height: 700  
  parent: "body"

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
