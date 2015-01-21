Slice = require './Slice.coffee'
Hammer = require 'hammerjs'
require 'jquery-hammerjs'
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
    console.log 'goto next'
    currentIndex = $(@slicesSelector + ' .current').index()
    @gotoSlice(currentIndex+1)
    return @

  gotoPreviousSlice: =>
    console.log 'goto prev'
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

  binds: ->
    next = @gotoNextSlice
    prev = @gotoPrevSlice

    # arrows
    $(@slicesArrowSelector+' .right').on('click', next)
    $(@slicesArrowSelector+' .left').on('click', prev)
    
    # touch gesture
    $('body').hammer().on('swipeleft', ->
      console.log 'swype left'
    )
    # hammer = new Hammer.Manager($('body').get(0))
    # swipe = new Hammer.Pan()
    # hammer.add(swipe)
    # console.log hammer
    # hammer.on('panleft', =>
    #   console.log 'next'
    #   # _.debounce((()->
    #   #   console.log 'coucou next'
    #   # ), 1000, true)
    # )
    # hammer.on('spanright', =>
    #   console.log 'previous'
    #   # _.debounce(prev, 1000, true)
    # )
    return @

$(document).on('ready', ->
  sm = new SliceManager
)