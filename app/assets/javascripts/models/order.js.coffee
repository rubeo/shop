class Shop.Models.Order extends Backbone.Model
  url: ->
    if @id?
      "/api/itemstables/#{@id}"
    else
      "/api/itemstables"

  #parse: (resp, options) ->
  # 	@items = new ItemsCollection(resp.items)
  # 	return resp.order