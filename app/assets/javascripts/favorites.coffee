# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


favorites = ->
  $('.form-ajax').on 'ajax:error', (e, xhr, status, error) ->
    alert xhr.responseText

$(document).ready(favorites)
$(document).on('page:load', favorites)
