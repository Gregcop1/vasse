module.exports =
  html:
    files: '<%= in8.htmlSrc %>/**/.php'
    options:
      reload: true

  sass:
    files:'<%= in8.cssSrc %>/*.scss'
    tasks: [
      'sass:build',
      'autoprefixer:build'
    ]

  images:
    files:[
      '<%= in8.imgSrc %>/**'
    ]
    
  coffee:
    files: '<%= in8.jsSrc %>/*.coffee'
    tasks: 'newer:coffee:build'

  coffeeComponents:
    files:'<%= in8.jsComponentSrc %>/*.coffee'
    tasks: 'newer:coffee:component'