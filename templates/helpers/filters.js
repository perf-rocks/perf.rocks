/*
 * assemble-swig-examples
 * https://github.com/assemble/assemble-swig-examples
 * Copyright (c) 2013 Jon Schlinkert, Brian Woodward, contributors
 * Licensed under the MIT license.
 */

'use strict';

var extras = require('swig-extras');
var extensions = require('swig-extensions');

module.exports.register = function(swig, opts) {
  opts = opts || {};

  var extrasFilters = [
    "batch",
    "groupby",
    // "markdown", // use {{foo|markdown}} filter from 'asseble/swig-extensions' instead
    "nl2br",
    "pluck",
    "split",
    "trim",
    "truncate"
  ];

  extrasFilters.map(function(filter){
    return extras.useFilter(swig, filter);
  });

  // Register tags from swig-extensions. We can use the
  // same format as above, we're just using a different format
  // here for purposes of instruction.
  extensions.useFilter(swig, 'condense');
  extensions.useFilter(swig, 'markdown');
  extensions.useFilter(swig, 'prettify');
};
