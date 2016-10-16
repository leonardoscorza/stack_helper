App.answers = App.cable.subscriptions.create "AnswersChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $("#answers").removeClass('hidden')
    return $("#answers").append(this.renderAnswer(data))

  renderAnswer: (data) ->
    return "<div class='card card-block'><p>" + data.answer + " - " + data.user + "</p></div>"
