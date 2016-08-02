$(function() {
  users = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.whitespace,
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  limit: 6,
  remote: {url:'/api/vns/search/%QUERY'
   , wildcard: '%QUERY'
   }
   });
  users.initialize();
  $('.typeahead').typeahead(null, {
      name: "mysearch",
      display: 'name',
      limit: 6,
      source: users.ttAdapter(),
      templates: {
         suggestion: Handlebars.compile('<div class="tt-row"><a href="{{vn_url}}"> \
                                          <ul class="list-inline"><li><div class="col-md-4 removepadding"> \
                                          <img class="img-responsive" src="{{image_poster.image_poster.thumb.url}}"/> \
                                          </div><div class="col-md-8"><span class="tt-title">{{trimString name}}</span></div></li></ul></a></div>')
   		}
   	});
});

// use pg_search remote data
// function(query, syncResults, asyncResults) {
// 			    $.get('/api/vns/search/' + query, function(data) {
// 			      asyncResults(data);
// 			    });
// 			},

$(function() {
  $(".typeahead").bind('typeahead:select',function(obj,datum,name) {
      window.location.href = datum["vn_url"];
    });
});
