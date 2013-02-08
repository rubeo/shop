class Shop.Views.OrdersIndex extends Backbone.View

  template: JST['orders/index']

  events:
    'change #filter': 'fillFilterOptions'
    'click #order_create_button': 'createOrder'

  initialize: ->
    @collection.on('reset', @render, @)

  render: ->
  	$(@el).html(@template(orders: @collection))
  	@collection.each(@appendOrder)
  	@

  createOrder: ->
    Backbone.history.navigate("/new", true)	

  appendOrder: (order) =>
    view = new Shop.Views.OrdersOrder(model: order)
    @$('tbody').append(view.render().el)	

  fillFilterOptions: ->
    $("#filter_options").children().remove()
    cur_filter = ($("#filter option:selected").val())    
    status = ["", "Ordered", "Pending", "Delivered"]
    role = ["", "Merchandiser", "Administrator", "Supervisor"]  	
    if cur_filter is "Role"
      i = 0      
      while i < role.length
        $("#filter_options").append $("<option></option>").attr("value", role[i]).text(role[i])
        i++  
    if cur_filter is "Status"
      i = 0      
      while i < status.length
        $("#filter_options").append $("<option></option>").attr("value", status[i]).text(status[i])
        i++ 
