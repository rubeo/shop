window.Shop =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initOrders: -> 
    new Shop.Routers.Orders()
    Backbone.history.start(pushState: true)

  initUsers: -> 
    new Shop.Routers.Users()
    Backbone.history.start(pushState: true)

$(document).ready ->
  Shop.initUsers() if curUser?.role == "Administrator"
  Shop.initOrders() if curUser?.role == "Customer"
  

  