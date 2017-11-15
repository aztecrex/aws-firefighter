"strict";

const AWS = require("aws-sdk");
// const credentials = new AWS.SharedIniFileCredentials();
// AWS.config.credentials = credentials;
// const creds = new AWS.SharedIniFileCredentials({profile: 'default'});
// AWS.config.credentials = creds;


const S3 = new AWS.S3();


const somethingInAWS = function() {
    console.log ("doing something");
    console.log (AWS.config.credentialProvider);
    S3.listBuckets({}, function (err, data) {
        if (err) console.log(err, err.stack);
        else console.log(data);
    });
    return {};
}

exports.somethingInAWS = somethingInAWS;
