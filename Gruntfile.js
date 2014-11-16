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
    var person_pages = _.flatten(_.map(grunt.file.readYAML('data/people.yml'), function(data) {
        return {
            filename: mySlug(data.name),
            data: data,
            content: grunt.file.read('templates/partials/person.swig')
        }
    }));

    var resource_count = { resource_count: _.flatten(_.map(grunt.file.expand(['data/*.yml', '!data/people.yml']), function(filepath) {
        var data = grunt.file.readYAML(filepath);
        return Object.keys(data).length;
    })).reduce(function(a, b) { return a + b }) };

    grunt.initConfig({

        pkg:  grunt.file.readJSON('package.json'),
        site: _.merge(grunt.file.readYAML('_config.yml'), resource_count),

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
            site: {
                options: {
                    permalinks: {
                        structure: ':section/:slug:ext',
                    },
                },
                src:  '<%= site.pages %>/*.swig',
                dest: '<%= site.dest %>/'
            },
            people: {
                options: {
                    pages: person_pages,
                    permalinks: {
                        structure: ':basename/index:ext',
                    },
                },
                src:  '!*',
                dest: '<%= site.dest %>/people/'
            }
        },

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

        clean: {
            site: ['<%= site.dest %>/**/*', '!<%= site.dest %>/.{git,gitignore}'],
        },

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
                tasks: ['compass']
            },
            images: {
                files: ['<%= site.theme_img %>/**'],
                tasks: ['imagemin','copy:images']
            }
        },

        copy: {
            images: {
                expand:  true,
                flatten: true,
                src:     '<%= site.theme_img %>/**',
                dest:    '<%= site.dist_img %>/',
            }
        },

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

        autoprefixer: {
            options: {
                browsers: ['last 2 versions']
            },
            dist: {
                src: '<%= site.dist_css %>/style.css',
                dest: '<%= site.dist_css %>/style.css'
            }
        },

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

        uncss: {
            dist: {
                options: {
                    stylesheets: ['assets/css/style.css'],
                    htmlroot: '_gh_pages',
                },
                files: {
                    '<%= site.dist_css %>/style.css': [
                        '_gh_pages/index.html',
                        '_gh_pages/people/index.html',
                        '_gh_pages/articles/index.html',
                        '_gh_pages/tools/index.html',
                        '_gh_pages/talks-and-slides/index.html',
                        '_gh_pages/people/addy-osmani/index.html'
                    ]
                }
            }
        },

        cssmin: {
            dist: {
                options: {
                    report: 'gzip',
                    keepSpecialComments: 0,
                },
                files: {
                    '_gh_pages/assets/css/style.css': '_gh_pages/assets/css/style.css'
                }
            }
        },

        htmlbuild: {
            dist: {
                expand: true,
                cwd: '_gh_pages',
                src: '**/*.html',
                dest: '_gh_pages/',
                ext: '.html',
                options: {
                    styles: {
                        test: '_gh_pages/assets/css/style.css'
                    },
                }
            }
        }

    });

    grunt.loadNpmTasks('assemble');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-contrib-imagemin');
    grunt.loadNpmTasks('grunt-contrib-connect');
    grunt.loadNpmTasks('grunt-contrib-compass');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-contrib-clean');
    grunt.loadNpmTasks('grunt-contrib-copy');
    grunt.loadNpmTasks('grunt-autoprefixer');
    grunt.loadNpmTasks('grunt-html-build');
    grunt.loadNpmTasks('grunt-px-to-rem');
    grunt.loadNpmTasks('grunt-sync-pkg');
    grunt.loadNpmTasks('grunt-uncss');
    grunt.loadNpmTasks('grunt-verb');

    grunt.registerTask('build', [
        'clean',
        'assemble',
        'imagemin',
        'copy',
        'compass',
        'autoprefixer',
        'px_to_rem',
        'uncss',
        'cssmin',
        'htmlbuild',
        'sync'
    ]);

    grunt.registerTask('default', [
        'clean',
        'assemble',
        'copy:images',
        'compass',
        'autoprefixer',
        'px_to_rem',
        'connect',
        'watch',
    ]);

};
