# Firefighter

You're a firefighter. You need to get into the infrastructure
but all the access is blocked. This software can help.


## Status

No real code yet. But it does deploy to AWS Lambda and it does
handle requests. You can use this as a starting point for your
own Purescript Lambda Functions.

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

From the source directory, `./package`. This will create a file called
`./output/firefighter.zip`.

If you just want to build the JS, `./build`. This will create a file
called `./output/firefighter.js`.

## Deploy

Create a `deploy.env` environment file using `deploy.env.sample` for
guidance. From the source directory `./deploy`. If you have already
deployed, use `./update` instead.

