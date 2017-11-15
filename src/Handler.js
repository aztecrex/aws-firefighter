"strict";

const secrets = require('../../secrets').secrets;

const AWS = require("aws-sdk");
// const credentials = new AWS.SharedIniFileCredentials();
// AWS.config.credentials = credentials;
// const creds = new AWS.SharedIniFileCredentials({profile: 'default'});
// AWS.config.credentials = creds;

const STS = new AWS.STS();

// const S3 = new AWS.S3();




const somethingInAWS = function() {
    console.log ("doing something");
    STS.assumeRole({
        RoleArn: secrets.firefighterRole,
        RoleSessionName: "FirefighterToTheRescue"
    }, function (err, data) {
        if (err) console.log(err, err.stack);
        else console.log(data);
    });
    return {};
}

exports.somethingInAWS = somethingInAWS;
