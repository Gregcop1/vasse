Slice = require './Slice.coffee'

class SliceManager
  menuSelector: '#mainMenu li:not(.menu-item-25)'
  slicesSelector: '#slices'
  slices: []

  constructor: ->
    @build()
      .gotoSlice(0)
    return @

  build: ->
    that = @
    sliceContainer = $(@slicesSelector)
    $(@menuSelector+' a').each(->
      that.slices.push(new Slice($(this), sliceContainer))
      $(this).on('click', that.clickOnMenuItem)
    )
    return @

  gotoSlice: (index)->
    if index >=0 && @slices[index]
      @slices.map((item, key)->
        if key < index
          item.gotoPrev()
        else if key == index
          item.gotoCurrent()
        else
          item.gotoNext()
      )
    return @

  clickOnMenuItem: (e)=>
    e.preventDefault()

    $menuItem = $(e?.target).closest('li')
    @gotoSlice( $(@slicesSelector + ' .' + $menuItem.attr('id')).index() )
    return false

$(document).on('ready', ->
  sm = new SliceManager
)