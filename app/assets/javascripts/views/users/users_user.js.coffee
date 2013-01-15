class Shop.Views.UsersUser extends Backbone.View
  
  template: JST['users/user']
  tagName: 'tr'

  events:
    'dblclick': 'showUser'
    'click #edit': 'goToEdit'
   
  initialize: ->
    @model.on('change', @render, @) #no need here

  render: ->
    $(@el).html(@template(user: @model))
    @

  showUser: ->
    Backbone.history.navigate("users/#{@model.get('id')}", true)

  goToEdit: ->
    Backbone.history.navigate("#{@model.get('id')}/edit", true)
  