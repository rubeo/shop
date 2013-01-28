class ApplicationHelper
  strToParams: (paramStr)->
    return {} unless paramStr? and paramStr.length > 0
    _.inject(
      _.map(
        paramStr.split("&"),
        (i)-> i.split("=")
      ),
      (s, i)-> s[i[0]] = i[1] ; s;,
      {}
    )

  paramsToStr: (params) ->
    _.inject(
      params,
      (result, value, key)-> result.push "#{key}=#{value}"; result
      []
    ).join("&")

      
_.extend(_, new ApplicationHelper)