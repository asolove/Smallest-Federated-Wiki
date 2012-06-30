module.exports = active = {}
# FUNCTIONS and HANDLERS to manage the active page, and scroll viewport to show it

active.scrollContainer = undefined
findScrollContainer = ->
  scrolled = $("body, html").filter -> $(this).scrollLeft() > 0
  if scrolled.length > 0
    scrolled
  else
    $("body, html").scrollLeft(4).filter(-> $(this).scrollLeft() > 0).scrollTop(0)

scrollTo = (el) ->
  debugger
  
  active.scrollContainer ?= findScrollContainer()
  bodyWidth = $("body").width()
  minX = active.scrollContainer.scrollLeft()
  maxX = minX + bodyWidth
  wiki.log 'scrollTo', el, el.position()
  width = el.outerWidth(true)
  contentWidth = $(".page").outerWidth(true) * $(".page").size()
  target = el.position().left - (bodyWidth - width) / 2
  
  # we're just prototyping, so this is ok... but seriously, don't do this
  if target < 0
    $(".page").css
      position: "relative"
      left: (val) ->
        $(this).position().left - target
    active.scrollContainer.animate scrollLeft: 0
  else 
    $(".page").css
      position: ""
      left: ""
    active.scrollContainer.animate scrollLeft: target
  
active.set = (el) ->
  el = $(el)
  wiki.log 'set active', el
  $(".active").removeClass("active")
  scrollTo el.addClass("active")

