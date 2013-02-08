class Shop.Routers.Orders extends Backbone.Router

  routes:
    ""           : "index"
    "orders/:id" : "show"
    "new"        : "newOrder"
    ":id/edit"   : "edit"
    ":id/show"   : "show"
   
    
  initialize: ->
    @collection = new Shop.Collections.Orders()
    @collection.fetch()     

  index: ->
    view = new Shop.Views.OrdersIndex(collection: @collection)    
    $('#container').html(view.render().el)
  
  show: (id) ->
    $.getJSON "/api/orders/"+id+".json", (data) ->
      console.log(data)
    order = @collection.get(id)    
    view = new Shop.Views.OrdersEdit({model: order, details: "details"})

  newOrder: ->
    view = new Shop.Views.OrdersNew({collection: @collection})

  edit: (id) ->    
    order = @collection.get(id)   
    view = new Shop.Views.OrdersEdit(model: order)