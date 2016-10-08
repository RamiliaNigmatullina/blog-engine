$(document).ready(() ->
  $(".category").click(() ->
    $(this).find("li").toggle(300)
  )
)
