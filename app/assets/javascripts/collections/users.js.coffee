class Shop.Collections.Users extends Backbone.Collection

  baseUrl: '/api/users'
  model: Shop.Models.User
  currentPage: 1
  perPage: 10
  pageInfo: {}
  pageParam: "page"

  parse: (resp, xhr) ->
    @setPageInfo(resp)
    resp["models"]

  setPageInfo: (info) ->
    _.extend(@pageInfo, {
      currentPage:  Number(info["current_page"] or info["currentPage"]),
      numPages:     Number(info["num_pages"]    or info["numPages"]),
      perPage:      @perPage
    })
    @currentPage = @pageInfo['currentPage']

  howManyPer: (perPage) ->
    @pageInfo.currentPage = 1
    @pageInfo.perPage = perPage
    
    

  setPage: (page) ->
    return unless page > 0
    [oldPage, @currentPage] = [@currentPage, Number(page)]
    @fetch() unless oldPage == @currentPage

  url: ->
    @baseUrl + '?' + $.param({page: @currentPage})

  duplicateUser: (userId) ->
    curAttr = @get(userId).attributes
    dupl_user = new Shop.Models.User(curAttr)
    dupl_user.id = undefined
    dupl_user.attributes["id"] = undefined
    dupl_user  