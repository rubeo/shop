class Shop.Views.OrdersNew extends Backbone.View

  el: '#container'

  template: JST['orders/details']

  
  initialize: ->
    @collection.on('add', @render, @)
    @render()
    
  render: ->
    @$el.html(@template())
    @