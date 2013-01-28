class Shop.Views.UsersIndex extends Backbone.View

  template: JST['users/index']

  events:
    'click #user_create_button': 'createUser'
    "click a.jlink": "navigateThroughLink"
    "click #paging-buttons button": "navigateThroughLink"
    "click .paging a" : "changeShownNum"

  initialize: ->
    @collection.on('reset', @render, @)
    @collection.on('add', @render, @)
    @collection.on('destroy', @render, @)
    @collection.on('change', @render, @)
    
            
  render: ->
    $(@el).html(@template(users: @collection))
    @collection.each(@appendUser)
    @

  appendUser: (user) =>
    view = new Shop.Views.UsersUser(model: user)
    @$('tbody').append(view.render().el)

  createUser: ->
    Backbone.history.navigate("/new", true)

  navigateThroughLink: (event)->
    event.preventDefault()
    Backbone.history.navigate(event.target.attributes["name"].value, true)
    false

  changeShownNum: ->
    console.log @collection.pageInfo.perPage
    @collection.howManyPer(25) if @collection.pageInfo.perPage = 10
    @collection.howManyPer(10) if @collection.pageInfo.perPage = 25
    @render
    console.log @collection.pageInfo.perPage
