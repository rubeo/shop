class Shop.Views.OrdersOrder extends Backbone.View

  template: JST['orders/order']
  tagName: 'tr'

  events:
    'click #edit': 'goToEdit'
    'click #destroy': 'goToShow'  #todo  
   
  render: ->
    $(@el).html(@template(order: @model))
    @

  goToEdit: ->   
    Backbone.history.navigate("#{@model.get('id')}/edit", true)

  goToShow: ->   
    Backbone.history.navigate("#{@model.get('id')}/show", true)    
