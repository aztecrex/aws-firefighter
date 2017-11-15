"use strict";

const Handler = require('../output/Handler');

// need to revisit how this works
exports.handler = function(data, context, callback) {
  Handler.handler(data)(context)(function(s) {
    callback(null, s);
  })();
};

