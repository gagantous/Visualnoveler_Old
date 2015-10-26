jQuery ($) ->
  $(document).ready ->
    if $('.duplicatable_nested_form').length

      nestedForm = $('.duplicatable_nested_form').last().clone()