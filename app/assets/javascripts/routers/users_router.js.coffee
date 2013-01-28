class Shop.Routers.Users extends Backbone.Router
  routes:
    "index"         : "index"
    ".*"            : "index"
    ""              : "index"
    "new"           : "newUser"
    "users/:id"     : "show"
    ":id/edit"      : "edit"
    ":id/duplicate" : "duplicate"
  
  initialize: ->
    @route /users\/?\?(.*)/, "index", @index
    @collection = new Shop.Collections.Users($('#app').data('users'))
    @collection.setPageInfo($('#app').data('users-page-info')) #unexpecteble change _ to -  DANGER!!!

    #@collection.fetch()
    
  index: (params) ->
    params = _.strToParams(params)
    @collection.setPage(params["page"]) if params["page"]?
    view = new Shop.Views.UsersIndex(collection: @collection)
    $('#app').html(view.render().el)
  
  show: (id) ->
    usr = @collection.get(id)
    view = new Shop.Views.UsersShow({model: usr})
  
  newUser: ->
    view = new Shop.Views.UsersNew({collection: @collection})
  
  edit: (id) ->
    #@route /id\/?\?(.*)\/edit/, "edit", @edit
    usr = @collection.get(id)
    view = new Shop.Views.UsersEdit({model: usr})

  duplicate: (id) ->
    dupl_user = @collection.duplicateUser(id)
    duplView = new Shop.Views.UsersDuplicate({collection: @collection, attributes: dupl_user})    