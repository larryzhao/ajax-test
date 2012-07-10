# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


$ ->
  $('#button-get-json').on 'click', () ->
    $.get '/posts/badges.json', (data) ->
      $.each data, (index,badge) -> 
        ul = $(this).next();
        ul.append $("<li>#{badge.description}</li>")

  $('#button-get-js').on 'click', () ->
    $.get '/posts/badges.js'

  $('#link-get-json').on 'ajax:success', (xhr, data, status) ->
    $.each data, (index,badge) -> 
      ul = $(xhr.target).next();
      ul.append $("<li>#{badge.description}</li>")