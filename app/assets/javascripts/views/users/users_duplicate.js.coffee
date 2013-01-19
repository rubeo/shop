class Shop.Views.UsersDuplicate extends Backbone.View

  el: '#app'

  template: JST['users/duplicate']

  events:
    'submit #duplicate_user': 'duplicateUser'  
    'click #cancel': 'returnOnMain'   
    'click #refresh': 'refreshFields'

  initialize: ->
    @collection.on('add', @render, @)
    @render()

  render: ->
    $(@el).html(@template())
    @

  duplicateUser: (event) ->
    event.preventDefault()
    attr = @attributes.attributes
    attr.login_name = $(@el).find('#new_login_name').val()
    attr.password = $(@el).find('#new_password').val()
    attr.confirmPassword = $(@el).find('#new_confirmPassword').val()
    @collection.create attr,
      wait: true
      success: -> 
        $('#duplicate_user')[0].reset()
      error: @handleError

  handleError: (user, response) ->
    if response.status == 422
      errors = $.parseJSON(response.responseText).errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages

  returnOnMain: ->
    Backbone.history.navigate("/index", true) if confirm 'Are you sure you want to cancel operation. All data will be lost?'
      

  refreshFields: (e) ->
    e.preventDefault()
    $(@el).find('#new_login_name').val(@attributes.attributes.login_name)
    $(@el).find('#new_password').val(@attributes.attributes.password)
    $(@el).find('#new_confirmPassword').val(@attributes.attributes.confirmPassword)