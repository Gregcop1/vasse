module.exports = (grunt)->
  grunt.registerTask 'build', [
    'concurrent:builds'
    'autoprefixer:build'
    'coffeeify'
    'uglify:build'
    'cssmin:minify'
  ]