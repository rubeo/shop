class Shop.Collections.Users extends Backbone.Collection

  url: '/api/users'
  model: Shop.Models.User

  duplicateUser: (userId) ->
    curAttr = @get(userId).attributes
    dupl_user = new Shop.Models.User(curAttr)
    dupl_user.id = undefined
    dupl_user.attributes["id"] = undefined
    dupl_user