class PostLike
  constructor: (el) ->
    @like_button = $(el).find("a").first()
    @unlike_button = $(el).find("a").last()

    @_bindEvents()

  _bindEvents: ->
    @like_button.on "click", @_likePost
    @unlike_button.on "click", @_unlikePost

  _likePost: (event) =>
    event.preventDefault()

    url = @like_button.attr("href")

    $.ajax(
      url: url
      method: "post"
      dataType: "json"
      @like_button.hide()
      @unlike_button.show()
    )

  _unlikePost: (event)=>
    event.preventDefault()

    url = @unlike_button.attr("href")

    $.ajax(
      url: url
      method: "delete"
      dataType: "json"
      @unlike_button.hide()
      @like_button.show()
    )

$ ->
  new PostLike(el) for el in $(".like-post")
