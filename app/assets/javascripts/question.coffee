# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  submitNewAnswer()
  return

submitNewAnswer = ->
  $('textarea#answer_text').keydown (event) ->
    if event.keyCode is 13
      $('[data-send="answer"]').click()
      $('[data-textarea="answer"]').val ' '
      return false
    return
  return
