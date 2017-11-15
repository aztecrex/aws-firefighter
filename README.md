# Firefighter

You're a firefighter. You need to get into the infrastructure
but all the access is blocked. This software can help.


## Status

Lambda function can assume STS firefighter role.

Bare bones build and deployment so far.

## Prerequisites

### Build
- node (and npm)
- psc-package

### Package

- zip

### Deploy

- aws cli
- aws cli credentials set up on your computer

## Configure

From the source directory, `./configure`. This will install the JS
and Purescript libraries.

## Buid and Package

Create file, `secrets.js` using `secrets.js.sample` to guide you. You
will need the ARN of the firefighting role (the role you want to assume
when you fight fires). That role must have a trust policy that allows
it to be assumed from the `firefighter` AWS Lambda Function's service
role (see deployment).

Once this project takes more shape, I will provide some provisioning
scripts for the roles you'll need.

From the source directory, `./package`. This will create a file called
`./output/firefighter.zip`.

If you just want to build the JS, `./build`. This will create a file
called `./output/firefighter.js`.

## Deploy

Create a `deploy.env` environment file using `deploy.env.sample` for
guidance. You will need the ARN of a role that has permission to assume
the firefighting role. Use resource '*' or you will have a circular
dependency (you can add conditions if that bothers you). From the
source directory `./deploy`. If you have already deployed, use `./update`
instead.

