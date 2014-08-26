module.exports = function(grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    jekyll: {
      options: {
        src: '.',
        drafts: true
      },
      dist: {
        options: {
          dest: './_site',
          config: '_config.yml'
        }
      }
    },

    connect: {
      server: {
        options: {
          port: 8000,
          base: './_site'
        }
      }
    },

    autoprefixer: {
      multiple_files: {
        expand: true,
        src: ['css/*.css', '!css/*.min.css', '!css/*.prf.css'],
        ext: '.prf.css'
      }
    },

    cssmin: {
      minify: {
        expand: true,
        src: 'css/*.prf.css',
        ext: '.min.css'
      }
    },

    uglify: {
      options: {
        preserveComments: 'some'
      },
      build: {
        files: [{
          expand: true,
          src: ['js/**/*.js', '!js/**/*.min.js'],
          ext: '.min.js'
        }]
      }
    },

    watch: {
      css: {
        files: ['css/*.css'],
        tasks: ['autoprefixer', 'cssmin', 'jekyll'],
        options: {
          spawn: false
        }
      },
      html: {
        files: ['*.md', '_includes/*.html', '_layouts/*.html', '_drafts/*.md', '_posts/*.md'],
        tasks: ['jekyll'],
        options: {
          spawn: false
        }
      },
      js: {
        files: ['js/**.js'],
        tasks: ['uglify', 'jekyll'],
        options: {
          spawn: false
        }
      }
    }

  });

  require('load-grunt-tasks')(grunt);

  grunt.registerTask('default', ['jekyll', 'connect', 'watch']);
}
