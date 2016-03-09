jQuery ->
  $('a.fancybox').fancybox({parent: "body"})

# jQuery ->
#   $('a.vn-tooltip-related').popover();

jQuery ->
  $('.vn-tooltip-related').tooltip();

# $ ->
#   $(".typeahead").bind "typeahead:select", ->
#     window.location = "http://localhost:3000/vns";


## OLD TYPEAHEAD CODE FOR REMOTE STUFF
# jQuery -> 
#   users = new Bloodhound({
#   datumTokenizer: Bloodhound.tokenizers.whitespace('team'),
#   queryTokenizer: Bloodhound.tokenizers.whitespace,
#   limit: 10,
#   #local http://localhost:3000/json/vns.json
#   # remote: {url:'/api/vns/search/%QUERY'
#   #  , wildcard: '%QUERY'
#   #  }
#   prefetch: {url: 'http://twitter.github.io/typeahead.js/data/nba.json'

#     }
#    })
#   users.initialize();
#   $('.typeahead').typeahead(null, {
#       name: "mysearch"
#       display: 'team'
#       source: users.ttAdapter()
      # templates: {
      #    suggestion: Handlebars.compile('<div class="tt-row"><a href="{{vn_url}}">
      #                                     <ul class="list-inline"><li><div class="col-md-4 removepadding">
      #                                     <img class="img-responsive" src="{{image_poster.image_poster.thumb.url}}"/>
      #                                     </div><div class="col-md-8"><strong>{{name}}</strong></div></li></ul></a></div>')
      # }     
 # })



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
