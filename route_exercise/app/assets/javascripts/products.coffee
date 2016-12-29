# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $("#product-submit")
    .on "click", (e, data, status, xhr) ->
      console.log("ajax sucess")
    .on "ajax:error", (e, xhr, status, error) ->
        console.log("ajax error")
