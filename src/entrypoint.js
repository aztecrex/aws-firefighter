"use strict";

const Handler = require('../output/Handler');

exports.handler = function(data, context, callback) {
  Handler.handler(data)(context)(function(s) {
    callback(null, s);
  })();
};

