"strict";

const secrets = require('../../secrets').secrets;

const AWS = require("aws-sdk");
// const credentials = new AWS.SharedIniFileCredentials();
// AWS.config.credentials = credentials;
// const creds = new AWS.SharedIniFileCredentials({profile: 'default'});
// AWS.config.credentials = creds;

const STS = new AWS.STS();

// const S3 = new AWS.S3();

exports._fakeInput = {};
exports._fakeContext = {};

exports._stringify = function (o) { return JSON.stringify(o, null, 1); };

exports._firefighterRole = secrets.firefighterRole;

exports._assumeRole = function (role) {
    return function (session) {
        const params = {
            RoleArn: role,
            RoleSessionName: session
        };
        return function (errh) {
            return function(succh) {
                return function() {
                    STS.assumeRole(params, function(err, data) {
                        if (err) errh(err)();
                        else succh(data)();
                    });
                    return {};
                }
            };
        };
    };
};
