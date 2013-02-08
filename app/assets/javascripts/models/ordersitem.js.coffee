class Shop.Models.Ordersitem extends Backbone.Model
  url: ->
    if @id?
      "/api/itemstables/#{@id}"
    else
      "/api/itemstables"