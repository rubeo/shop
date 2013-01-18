class Shop.Views.UsersEdit extends Backbone.View
  
  template: JST['users/edit']
  
  el: '#app'

  events:
    'submit #edit_user': 'editUser'

  initialize: ->
    @render()

  render: ->
    $(@el).html(@template(user: @model))
    @

  editUser: (event) ->
    event.preventDefault()
    attributes = 
      first_name: $(@el).find('#new_first_name').val()
      lastName: $(@el).find('#new_lastName').val()
      email: $(@el).find('#new_email').val()
      region: $(@el).find('#region :selected').val()
      role: $(@el).find('input:radio:checked').val()
    @model.save attributes,
      wait: true
      success: -> 
        $('#edit_user')[0].reset() 
        Backbone.history.navigate("/index", true)
      error: @handleError

  handleError: (user, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages    