Slice = require './Slice.coffee'
# Hammer = require 'hammerjs'
# require 'jquery-hammerjs'
# _ = require 'underscore'
# console.log Hammer
class SliceManager
  menuSelector: '#mainMenu li'
  slicesSelector: '#slices'
  slicesArrowSelector: '#slices-arrows'
  slices: []

  constructor: ->
    @build()
      .gotoSlice(0)
      .binds()
    return @

  build: ->
    that = @
    sliceContainer = $(@slicesSelector)
    # slices
    $(@menuSelector+' a').each(->
      if $(this).parent().hasClass('menu-item-25')
        that.slices.splice(0, 0, new Slice($(this), sliceContainer, false))
      else
        that.slices.push(new Slice($(this), sliceContainer, true))
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
      @refreshMenu(index)
    return @

  gotoNextSlice: =>
    currentIndex = $(@slicesSelector + ' .current').index()
    @gotoSlice(currentIndex+1)
    return @

  gotoPreviousSlice: =>
    currentIndex = $(@slicesSelector + ' .current').index()
    @gotoSlice(currentIndex-1)
    return @

  refreshMenu: (index)->
    $(@menuSelector).removeClass('active')
    @slices[index]?.$menuItem.closest('li').addClass('active')
    return @

  clickOnMenuItem: (e)=>
    e.preventDefault()

    $menuItem = $(e?.target).closest('li')
    @gotoSlice( $(@slicesSelector + ' .' + $menuItem.attr('id')).index() )
    return false

  keyPressed: (e)=>
    switch e?.which
      when 37, 38 then @gotoPreviousSlice()
      when 39, 40 then @gotoNextSlice()

    console.log e.which
    return @

  binds: ->
    next = @gotoNextSlice
    prev = @gotoPreviousSlice

    # arrows
    $(@slicesArrowSelector+' .right').on('click', next)
    $(@slicesArrowSelector+' .left').on('click', prev)
    
    # touch gesture
    $('body').hammer().on('swipeleft panleft pandown', _.debounce(next, 300))
    $('body').hammer().on('panright panup', _.debounce(prev, 300))

    # key
    $('body').on('keydown', _.debounce(@keyPressed, 300))

    return @

$(document).on('ready', ->
  sm = new SliceManager
)