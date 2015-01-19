module.exports =
  build:
    options:
      sourceMap: true
    expand: true
    flatten: true
    cwd: '<%= in8.jsSrc %>'
    src: ['*.coffee']
    dest: '<%= in8.jsDest %>'
    ext: '.js'

  component:
    options:
      sourceMap: true
    expand: true
    flatten: true
    cwd: '<%= in8.jsComponentSrc %>'
    src: ['*.coffee']
    dest: '<%= in8.jsComponentDest %>'
    ext: '.js'