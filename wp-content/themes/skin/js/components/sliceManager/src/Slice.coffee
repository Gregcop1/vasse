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
        @$slice.append($content)
      )