module.exports =
  dev:
    options:
      watchTask: true

    bsFiles:
      src : [
        '<%= in8.cssDest %>/*.css'
        '<%= in8.jsDest %>/*.js'
        '<%= in8.jsComponentDest %>/*.js'
        '<%= in8.htmlSrc %>/**/*.php'
        '<%= in8.imgSrc %>/*'
      ]

