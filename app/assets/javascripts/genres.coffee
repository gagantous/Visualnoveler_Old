# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery -> 
  users = new Bloodhound({
  datumTokenizer: Bloodhound.tokenizers.whitespace,
  queryTokenizer: Bloodhound.tokenizers.whitespace,
  limit: 10,
  #local http://localhost:3000/json/vns.json
  remote: {url:'genres/typeahead/%QUERY'
   , wildcard: '%QUERY'
   }
  })

  users.initialize();
  $('.typeahead-genres').typeahead(null, {
      name: "mysearch"
      display: "name"
      source: users.ttAdapter()
  })