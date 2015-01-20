Slice = require './Slice.coffee'

class SliceManager
  menuContainer: '#mainMenu li:not(.menu-item-25) a'
  sliceContainer: '#slices'
  slices: []

  constructor: ->
    @build()
    return @

  build: ->
    that = @
    sliceContainer = $(@sliceContainer)
    $(@menuContainer).each(->
      that.slices.push(new Slice($(this), sliceContainer))
    )
    return @

$(document).on('ready', ->
  sm = new SliceManager
)