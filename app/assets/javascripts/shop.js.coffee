window.Shop =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: -> 
    new Shop.Routers.Users()
    Backbone.history.start(pushState: true)

$(document).ready ->
  Shop.init()
