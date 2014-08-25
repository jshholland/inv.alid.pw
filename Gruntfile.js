module.exports = function(grunt) {
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),

    jekyll: {
      options: {
        src: '.'
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
      single_file: {
        src: 'css/main.css',
        dest: 'css/main.prf.css'
      }
    },
    
    cssmin: {
      minify: {
        src: 'css/main.prf.css',
        dest: 'css/main.min.css'
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
        files: ['*.html', '*.md', '_includes/*.html', '_layouts/*.html'],
        tasks: ['jekyll'],
        options: {
          spawn: false
        }
      }
    }

  });

  require('load-grunt-tasks')(grunt);
  
  grunt.registerTask('default', ['connect', 'watch']);
}