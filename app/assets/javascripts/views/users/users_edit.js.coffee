class Shop.Views.UsersEdit extends Backbone.View
  
  template: JST['users/edit']
  
  el: '#app'

  events:
    'click #back': 'returnOnMain'
    'submit #edit_user': 'editUser'

  initialize: ->
    @render()

  render: ->
    $(@el).html(@template(user: @model))
    @

  editUser: (event) ->
    event.preventDefault()
    attributes = 
      name: $('#edit_user_name').val()
      role: $('#edit_user_role').val()
    @model.save attributes,
      wait: true
      success: -> $('#edit_user')[0].reset() 
      error: @handleError

  handleError: (user, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages

  returnOnMain: ->
    Backbone.history.navigate("/index", true)      