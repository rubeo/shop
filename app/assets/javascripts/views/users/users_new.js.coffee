class Shop.Views.UsersNew extends Backbone.View

  el: '#app'

  template: JST['users/new']

  events:
    "submit #new_user": "createUser"
    'click #cancel'   : 'returnOnMain'  
    'click #refresh'  : 'refreshFields'  

  initialize: ->
    @collection.on('add', @render, @)
    @render()

  render: ->
   @$el.html(@template())
   @

  createUser: (event) ->
    event.preventDefault()
    attributes = 
      login_name: $(@el).find('#new_login_name').val()
      first_name: $(@el).find('#new_first_name').val()
      lastName: $(@el).find('#new_lastName').val()
      password: $(@el).find('#new_password').val()
      confirmPassword: $(@el).find('#new_confirmPassword').val()
      email: $(@el).find('#new_email').val()
      region: $(@el).find('#region :selected').val()
      role: $(@el).find('input:radio:checked').val()
    @collection.create attributes,
      wait: true
      success: -> 
        $('#new_user')[0].reset()
      error: @handleError

  handleError: (user, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages

  returnOnMain: ->
    if confirm 'Do you really want to cancel this action and return on main page?'
      Backbone.history.navigate("/index", true)

  refreshFields: ->
    $(@el).find('#new_login_name').val('')
    $(@el).find('#new_first_name').val('')
    $(@el).find('#new_lastName').val('')
    $(@el).find('#new_password').val('')
    $(@el).find('#new_confirmPassword').val('')
    $(@el).find('#new_email').val('')
    $(@el).find('#region :selected').empty()
    $(@el).find('input:radio:checked').empty()