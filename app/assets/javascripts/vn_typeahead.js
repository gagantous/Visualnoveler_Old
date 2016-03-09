

// function initializeTypeahead(typeaheadInputBox, dataSource)
// {
//   var vn = new Bloodhound({
//   datumTokenizer: function(datum) {
//       return Bloodhound.tokenizers.whitespace(datum.name);
//   },
//   queryTokenizer: Bloodhound.tokenizers.whitespace,
//   prefetch: {
//         url: dataSource 
//       },
//   remote: {url:'/api/vns/search/%QUERY'
//     , wildcard: '%QUERY'
//     }
// });

// $('.typeahead').typeahead({
//     minLength: 1,
//     highlight: true
//   }, {
//   name: 'vn',
//   source: vn,
//   display: 'name',
//   templates: {
//       suggestion: Handlebars.compile('<div class="tt-row"><a href="{{vn_url}}">\
//                                     <ul class="list-inline"><li><div class="col-md-4 removepadding">\
//                                     <img class="img-responsive" src="{{image_poster.image_poster.thumb.url}}"/>\
//                                     </div><div class="col-md-8"><strong>{{name}}</strong></div></li></ul></a></div>')
//   }   

// });
// }


// $(document).ready(function() { 
//   var source = '/api/vns/all/typeahead';
//   initializeTypeahead($('.typeahead'), source); 
//   $(".typeahead").bind('typeahead:select', function (obj, datum,name) {
//       window.location.href = datum["vn_url"];
//     });
// });
