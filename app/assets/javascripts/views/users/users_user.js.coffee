class Shop.Views.UsersUser extends Backbone.View
  
  template: JST['users/user']
  tagName: 'tr'

  events:
    'click': 'showUser'
   
  initialize: ->
    @model.on('change', @render, @) #no need here

  render: ->
    $(@el).html(@template(user: @model))
    @

  showUser: ->
    Backbone.history.navigate("users/#{@model.get('id')}", true)
  