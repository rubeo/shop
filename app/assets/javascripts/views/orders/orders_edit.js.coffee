class Shop.Views.OrdersEdit extends Backbone.View

  el: '#container'

  template: JST['orders/details'] 

  initialize: ->
    @model.on('change', @render, @)        
    @render()
    @fillFields()

  render: ->    
    #@ordersitems = new Shop.Collections.Ordersitems();
    #@ordersitems.fetch()
    #console.log @ordersitems
    #@ordersitems.each(@appendOrdersitem)   

    $.getJSON "/api/orders/"+@model.attributes.id+".json", (data) ->
      for x of data
        item = data[x]
        row = $("<tr/>")
        column = $("<td>") 
        column.html item.item_id
        row.append column
        column = $("<td/>")
        column.html item.item_name
        row.append column
        column = $("<td/>")
        column.html item.item_description
        row.append column
        column = $("<td/>")
        column.html item.dimension
        row.append column
        column = $("<td/>")
        column.html item.price
        row.append column
        column = $("<td/>")
        column.html item.quantity
        row.append column
        column = $("<td/>")
        column.html item.price_per_line
        row.append column
        column = $("<td/>")
        column.append "<div id='edit' class= 'btn'><i class='icon-edit'></i></div>"
        row.append column
        column = $("<td/>")
        column.append "<div id='destroy' class='btn'><i class='icon-trash'></i></div>"        
        row.append column
        $("#items_table tbody").append row  


    $(@el).html(@template(order: @model))    
    @

  #appendOrdersitem: (ordersitem) ->
  #  console.log ordersitem.get('item_description')
  #  view = new Shop.Views.OrdersItem(model: ordersitem)
  #  @$('tbody').append(view.render().el)      
  
  fillFields: ->    
    $(@el).find('#order_number').val(@model.attributes.order_number)
    $(@el).find('#status').html(@model.attributes.status)    
    $(@el).find('#total_price').html(@model.attributes.total_price)
    $(@el).find('#total_num_of_items').html(@model.attributes.total_num_of_items)
    $(@el).find('#date_of_ordering').html(@model.attributes.date_of_ordering)
    $(@el).find('#pref_delivery_date').val(@model.attributes.pref_delivery_date)
    $(@el).find('#delivery_date').html(@model.attributes.delivery_date)
    $(@el).find('#assignee').val(@model.attributes.assignee)       
    $(@el).find('#credit_card_type').val(@model.attributes.credit_card_type)  
   