class Shop.Views.UsersEdit extends Backbone.View
  
  template: JST['users/edit']
  
  el: '#app'

  events:
    'submit #edit_user' : 'editUser'
    'click #cancel'     : 'returnOnMain' 
    'click #refresh'    : 'refreshFields'

  initialize: ->
    @model.on('change', @render, @)
    @render()

  render: ->
    $(@el).html(@template(user: @model))
    @

  editUser: (event) ->
    event.preventDefault()
    attributes = 
      first_name: @$el.find('#new_first_name').val()
      lastName: @$el.find('#new_lastName').val()
      email: @$el.find('#new_email').val()
      region: @$el.find('#region :selected').val()
      role: @$el.find('input:radio:checked').val()
    @model.save attributes,
      wait: true
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
    $(@el).find('#new_first_name').val(@model.attributes.first_name)
    $(@el).find('#new_lastName').val(@model.attributes.lastName)
    $(@el).find('#new_email').val(@model.attributes.email)
    $(@el).find('#region :selected').val(@model.attributes.region)
    $(@el).find('input:radio:checked').val(@model.attributes.role)