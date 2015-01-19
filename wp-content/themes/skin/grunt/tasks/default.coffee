module.exports = (grunt)->
  grunt.registerTask 'default', [
    'concurrent:builds'
    'uglify:build'
    'coffeeify'
    'autoprefixer:build'
    'browserSync'
    'watch'
  ]