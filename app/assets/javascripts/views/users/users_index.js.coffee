class Shop.Views.UsersIndex extends Backbone.View

  template: JST['users/index']

  events:
    'click #user_create_button': 'createUser'

  initialize: ->
    @collection.on('reset', @render, @)
    @collection.on('add', @render, @)
    @collection.on('destroy', @render, @)
            
  render: ->
    $(@el).html(@template(users: @collection))
    @collection.each(@appendUser)
    @

  appendUser: (user) =>
    view = new Shop.Views.UsersUser(model: user)
    @$('tbody').append(view.render().el)

  createUser: ->
    Backbone.history.navigate("/new", true)