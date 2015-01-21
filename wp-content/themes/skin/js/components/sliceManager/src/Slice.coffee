module.exports = class Slice
  contentConainer: '#main'

  constructor: (@$menuItem, @$sliceContainer, @append)->
    @build()
    return @

  build: ->
    if @append
      @$slice = $('<div/>').addClass('slice')
        .appendTo(@$sliceContainer)
      
      $.get(@$menuItem.attr('href'))
      .done((data)=>
        $content = $(data).find(@contentConainer)
        @buildSlice($content)
      )
    else
      @$slice = $('#content-page-0')
        .prependTo(@$sliceContainer)
      @buildSlice(@$slice.find(@contentConainer))

    return @


  buildSlice: ($content)->
    @$slice.addClass($content.attr('class'))
      .addClass(@$menuItem.closest('li').attr('id'))
      .removeClass('page')
      .removeClass('main')

    $content.attr('id', '')
      .attr('role', '')
      .attr('class', (i, c)->
        return c.replace(/(^|\s)content-page-\S+/g, ''))
    @$slice.append($content)

    $content.css('height', $content.height())
      .addClass('verticalAlignMiddle')
    return @

  gotoPrev: ->
    @$slice.addClass('prev')
      .removeClass('current')
      .removeClass('next')
    return @

  gotoCurrent: ->
    @$slice.addClass('current')
      .removeClass('prev')
      .removeClass('next')
    return @

  gotoNext: ->
    @$slice.addClass('next')
      .removeClass('current')
      .removeClass('prev')
    return @