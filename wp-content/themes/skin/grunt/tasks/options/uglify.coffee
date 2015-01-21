module.exports =
  options:
    banner: '/*! uglified <%= grunt.template.today("yyyy-mm-dd HH:MM:ss") %> */'
    sourceMap: true,
  build:
    files: [{
      expand: true,
      cwd: '<%= in8.jsDest %>',
      src: '*.js',
      dest: '<%= in8.jsDest %>'
      ext: '.min.js'
    }]
  sliceManager:
    files: 
      '<%= in8.sliceManagerDest %>/slice-manager.min.js' : '<%= in8.sliceManagerDest %>/slice-manager.js'
