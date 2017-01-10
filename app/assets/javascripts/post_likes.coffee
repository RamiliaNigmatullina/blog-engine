class PostLike
  constructor: (el) ->
    @likeButton = $(el).find("a").first()
    @likesNumber = $(el).find("span").first()
    @_bindEvents()

  _bindEvents: ->
    @likeButton.on "click", @_likePost

  _likePost: (event) =>
    event.preventDefault()

    url = @likeButton.attr("href")

    $.ajax(
      url: url
      method: "post"
      dataType: "json"
      @_hideButton()
      @_incremLikesNumber()
    )
  _hideButton: =>
    @likeButton.hide()

  _incremLikesNumber: =>
    @likesNumber.text(parseInt(@likesNumber.text()) + 1)

$ ->
  new PostLike(el) for el in $(".like-post")
