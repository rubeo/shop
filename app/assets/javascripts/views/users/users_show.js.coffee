class Shop.Views.UsersShow extends Backbone.View
  
  template: JST['users/show']

  events:
    'click #back': 'returnOnMain'
    
  el: '#app'

  initialize: ->
    #@model.on 'destroy', @returnOnMain, @
    @render()

  render: ->
    $(@el).html(@template(user: @model))
    @

  returnOnMain: ->
    Backbone.history.navigate("/index", true)  