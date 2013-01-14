class Shop.Views.UsersShow extends Backbone.View
  
  template: JST['users/show']

  events:
    'click #back': 'returnOnMain'
    'click #edit': 'goToEdit'
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

  goToEdit: ->
    Backbone.history.navigate("#{@model.get('id')}/edit", true)

  #destroy: ->
   # @model.destroy()