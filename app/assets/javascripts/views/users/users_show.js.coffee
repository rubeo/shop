class Shop.Views.UsersShow extends Backbone.View
  
  template: JST['users/show']

  events:
    'click #back': 'returnOnMain'
   #'click #destroy': 'destroy'

  el: '#app'

  initialize: ->
    #@model.on 'destroy', @returnOnMain, @
    @render()

  render: ->
    $(@el).html(@template(user: @model))
    @

  returnOnMain: ->
    Backbone.history.navigate("/index", true)

  #destroy: ->
   # @model.destroy()