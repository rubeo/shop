class Shop.Routers.Users extends Backbone.Router
  routes:
    "index"       : "index"
    ".*"          : "index"
    ""            : "index"
    "new"         : "newUser"
    "users/:id"   : "show"
    ":id/edit"    : "edit"
  
  initialize: ->
    @collection = new Shop.Collections.Users()
    @collection.reset($('#app').data('users'))
    @collection.fetch()

  index: ->
    view = new Shop.Views.UsersIndex(collection: @collection)
    $('#app').html(view.render().el)
  
  show: (id) ->
    usr = @collection.get(id)
    view = new Shop.Views.UsersShow({model: usr})
  
  newUser: ->
    view = new Shop.Views.UsersNew({collection: @collection})
  
  edit: (id) ->
    usr = @collection.get(id)
    view = new Shop.Views.UsersEdit({model: usr})
