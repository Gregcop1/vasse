module.exports = (grunt)->
  grunt.registerTask 'default', [
    'concurrent:builds'
    'uglify:build'
    'autoprefixer:build'
    'browserSync'
    'watch'
  ]