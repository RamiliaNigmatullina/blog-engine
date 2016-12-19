class PoslLikes
  constructor: (@$el) ->
    @el = el

$ ->
  new PostLikes($(el)) for el in $(".like-post")
