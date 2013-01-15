class Shop.Views.UsersNew extends Backbone.View

  el: '#app'

  template: JST['users/new']

  events:
    "submit #new_user": "createUser"
    'click #back': 'returnOnMain'

  initialize: ->
    @collection.on('add', @render, @)
    @render()

  render: ->
   @$el.html(@template())
   #@collection.each(@appendEntry) if need history back calls ajax adding
   @

  createUser: (event) ->
    event.preventDefault()
    attributes = 
      name: $('#new_user_name').val()
      role: $('#new_user_role').val()
    @collection.create attributes,
      wait: true
      success: -> 
        $('#new_user')[0].reset()
        Backbone.history.navigate("/index", true)
      error: @handleError

  handleError: (user, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages

  returnOnMain: ->
    Backbone.history.navigate("/index", true)