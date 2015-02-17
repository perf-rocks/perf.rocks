/*
 * Perf.Rocks
 * http://www.perf.rocks
 *
 * Copyright (c) 2014 Daniel Guillan
 * MIT License
 */

'use strict';

module.exports = function(grunt) {

    var _ = require('lodash');
    var path = require('path');
    var pretty = require('pretty');
    var mySlug = require('speakingurl').createSlug();
    var resource_count = { resource_count: _.flatten(_.map(grunt.file.expand(['data/*.yml', '!data/people.yml']), function(filepath) {
        var data = grunt.file.readYAML(filepath);
        return Object.keys(data).length;
    })).reduce(function(a, b) { return a + b }) };

    grunt.initConfig({

        pkg:  grunt.file.readJSON('package.json'),
        site: _.merge(grunt.file.readYAML('_config.yml'), resource_count),

        // ---------------------------------------------------------------------
        // Assemble
        // ---------------------------------------------------------------------

        assemble: {
            options: {
                engine:    'swig',
                flatten:   true,
                site:      '<%= site %>',
                assets:    '<%= site.assets %>',
                data:      '<%= site.data %>/*.{json,yml}',
                partials:  '<%= site.partials %>',
                layoutdir: '<%= site.layouts %>',
                layout:    '<%= site.layout %>',
                helpers:   ['<%= site.helpers %>/*.js', '<%= site.helpers %>/filters/*.js'],
                plugins:   ['assemble-contrib-permalinks'],
            },

            // -----------------------------------------------------------------
            // Site pages
            // -----------------------------------------------------------------

            site: {
                options: {
                    permalinks: {
                        structure: ':section/:slug:ext',
                    },
                },
                src:  '<%= site.pages %>/*.swig',
                dest: '<%= site.dest %>/'
            },

            // -----------------------------------------------------------------
            // People pages
            // -----------------------------------------------------------------

            people: {
                options: {
                    pages: _.flatten(_.map(grunt.file.readYAML('data/people.yml'), function(data) {
                        return {
                            filename: mySlug(data.name),
                            data: data,
                            content: grunt.file.read('templates/partials/person.swig')
                        }
                    })),
                    permalinks: {
                        structure: ':basename/index:ext',
                    },
                },
                src:  '!*',
                dest: '<%= site.dest %>/people/'
            },

            // -----------------------------------------------------------------
            // Category pages
            // -----------------------------------------------------------------

            category_pages: {
                options: {
                    pages: _.flatten(_.map(grunt.file.readYAML('data/articles.yml'), function(data) {
                        return {
                            filename: mySlug(data.category),
                            data: data,
                            content: grunt.file.read('templates/partials/category.swig')
                        }
                    })),
                    permalinks: {
                        structure: ':basename/index:ext',
                    },
                },
                src:  '!*',
                dest: '<%= site.dest %>/articles/topic/'
            }
        },

        // ---------------------------------------------------------------------
        // Compass
        // ---------------------------------------------------------------------

        compass: {
            site: {
                options: {
                    bundleExec:     true,
                    relativeAssets: false,
                    require:        ['compass-normalize', 'breakpoint'],
                    sassDir:        '<%= site.sass %>',
                    cssDir:         '<%= site.dist_css %>',
                    imagesDir:      '<%= site.dist_img %>',
                    httpImagesPath: '<%= site.img %>',
                },
            },
        },

        // ---------------------------------------------------------------------
        // Clean
        // ---------------------------------------------------------------------

        clean: {
            site: ['<%= site.dest %>/**/*', '!<%= site.dest %>/.{git,gitignore}'],
        },

        // ---------------------------------------------------------------------
        // Watch
        // ---------------------------------------------------------------------

        watch: {
            server: {
                options: {
                    livereload: true,
                },
                files: ['<%= site.dest %>/**/*']
            },
            assemble: {
                files: ['<%= site.data %>/*.{json,yml}',
                        '<%= site.templates %>/**/*.swig'],
                tasks: ['assemble'],
            },
            sass: {
                files: ['<%= site.sass %>/**/*.scss'],
                tasks: ['compass', 'autoprefixer']
            },
            images: {
                files: ['<%= site.theme_img %>/**'],
                tasks: ['imagemin','copy:images']
            },
            js: {
                files: ['<%= site.theme_js %>/**'],
                tasks: ['copy:js']
            }
        },

        // ---------------------------------------------------------------------
        // Copy
        // ---------------------------------------------------------------------

        copy: {
            images: {
                expand:  true,
                flatten: true,
                src:     '<%= site.theme_img %>/**',
                dest:    '<%= site.dist_img %>/',
            },
            js: {
                expand:  true,
                flatten: true,
                src:     '<%= site.theme_js %>/**',
                dest:    '<%= site.dist_js %>/',
            },
            cname: {
                expand:  true,
                flatten: true,
                src:     'CNAME',
                dest:    '<%= site.dest %>/',
            }
        },

        // ---------------------------------------------------------------------
        // Connect
        // ---------------------------------------------------------------------

        connect: {
            server: {
                options: {
                    port: 8000,
                    base: '<%= site.dest %>',
                    livereload: true,
                    //keepalive: true,
                }
            }
        },

        // ---------------------------------------------------------------------
        // Imagemin
        // ---------------------------------------------------------------------

        imagemin: {
            dist: {
                files: [{
                    expand: true,
                    cwd: '<%= site.theme_img %>',
                    src: ['**/*.{png,jpg,gif}'],
                    dest: '<%= site.theme_img %>'
                }]
            }
        },

        // ---------------------------------------------------------------------
        // Autoprefixer
        // ---------------------------------------------------------------------

        autoprefixer: {
            options: {
                browsers: ['last 2 versions']
            },
            dist: {
                src: '<%= site.dist_css %>/style.css',
                dest: '<%= site.dist_css %>/style.css'
            }
        },

        // ---------------------------------------------------------------------
        // Pixel to Rem
        // ---------------------------------------------------------------------

        px_to_rem: {
            dist: {
                options: {
                    base: 16,
                },
                files: {
                    '<%= site.dist_css %>/style.css': ['<%= site.dist_css %>/style.css']
                }
            }
        },

        // ---------------------------------------------------------------------
        // unCSS
        // ---------------------------------------------------------------------

        uncss: {
            dist: {
                options: {
                    stylesheets: ['assets/css/style.css'],
                    htmlroot: '<%= site.dest %>',
                },
                files: {
                    '<%= site.dist_css %>/style.css': [
                        '<%= site.dest %>/index.html',
                        '<%= site.dest %>/people/index.html',
                        '<%= site.dest %>/articles/index.html',
                        '<%= site.dest %>/tools/index.html',
                        '<%= site.dest %>/talks-and-slides/index.html',
                        '<%= site.dest %>/books/index.html',
                        '<%= site.dest %>/people/addy-osmani/index.html'
                    ]
                }
            }
        },

        // ---------------------------------------------------------------------
        // CSSmin
        // ---------------------------------------------------------------------

        cssmin: {
            dist: {
                options: {
                    report: 'gzip',
                    keepSpecialComments: 0,
                },
                files: {
                    '<%= site.dest %>/assets/css/style.css': '<%= site.dest %>/assets/css/style.css'
                }
            }
        },

        // ---------------------------------------------------------------------
        // Uglify
        // ---------------------------------------------------------------------

        uglify: {
            dist: {
                files: [{
                    expand: true,
                    cwd: '<%= site.theme_js %>',
                    src: '**/*.js',
                    dest: '<%= site.dist_js %>'
                }]
            }
        },

        // ---------------------------------------------------------------------
        // htmlbuild (embed CSS)
        // ---------------------------------------------------------------------

        htmlbuild: {
            dist: {
                expand: true,
                cwd: '<%= site.dest %>',
                src: '**/*.html',
                dest: '<%= site.dest %>/',
                ext: '.html',
                options: {
                    styles: {
                        test: '<%= site.dest %>/assets/css/style.css'
                    },
                }
            }
        },

        // ---------------------------------------------------------------------
        // Minify HTML
        // ---------------------------------------------------------------------

        htmlmin: {
            dist: {
                options: {
                    removeComments: true,
                    collapseWhitespace: true
                },
                files: [{
                    expand: true,
                    cwd: '<%= site.dest %>',
                    src: '**/*.html',
                    dest: '<%= site.dest %>'
                }]
            },
        },

        // ---------------------------------------------------------------------
        // Github Pages
        // ---------------------------------------------------------------------

        'gh-pages': {
            options: {

            },
            'gh-pages': {
                options: {
                    base: '<%= site.dest %>',
                    message: 'New version',
                },
                src: ['**/*']
            },
        },

    });

    grunt.loadNpmTasks('assemble');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-imagemin');
    grunt.loadNpmTasks('grunt-contrib-htmlmin');
    grunt.loadNpmTasks('grunt-contrib-connect');
    grunt.loadNpmTasks('grunt-contrib-compass');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-autoprefixer');
    grunt.loadNpmTasks('grunt-html-build');
    grunt.loadNpmTasks('grunt-px-to-rem');
    grunt.loadNpmTasks('grunt-gh-pages');
    grunt.loadNpmTasks('grunt-uncss');
    grunt.loadNpmTasks('grunt-verb');

    // ---------------------------------------------------------------------
    // Build task
    // ---------------------------------------------------------------------

    grunt.registerTask('build', [
        'clean',
        'assemble',
        'imagemin',
        'copy:images',
        'compass',
        'autoprefixer',
        'px_to_rem',
        'uncss',
        'cssmin',
        'htmlbuild',
        'htmlmin'
    ]);

    // ---------------------------------------------------------------------
    // Deploy to Github Pages task
    // ---------------------------------------------------------------------

    grunt.registerTask('deploy', [
        'build',
        'copy:cname',
        'gh-pages'
    ]);

    // ---------------------------------------------------------------------
    // Default development task
    // ---------------------------------------------------------------------

    grunt.registerTask('default', [
        'clean',
        'assemble',
        'copy:images',
        'copy:js',
        'compass',
        'autoprefixer',
        'px_to_rem',
        'connect',
        'watch',
    ]);

};
