module.exports = class Slice
  contentConainer: '#main'

  constructor: (@$menuItem, @$sliceContainer)->
    @build()
    return @

  build: ->
    @$slice = $('<div/>').addClass('slice')
      .appendTo(@$sliceContainer)

    $.get(@$menuItem.attr('href'))
      .done((data)=>
        $content = $(data).find(@contentConainer)
        

        @$slice.addClass($content.attr('class'))
          .addClass(@$menuItem.closest('li').attr('id'))
          .removeClass('page')
          .removeClass('main')

        $content.attr('id', '')
          .attr('role', '')
          .attr('class', (i, c)->
            return c.replace(/(^|\s)content-page-\S+/g, ''))
        @$slice.append($content)
      )

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