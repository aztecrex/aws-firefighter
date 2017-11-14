# Firefighter

You're a firefighter. You need to get into the infrastructure
but all the access is blocked. This software can help.


Bare bones build and deployment so far.

## Prerequeisites

- node (and npm)
- psc-package
- zip
- aws cli
- aws cli credentials set up on your computer

## Configure

From the source directory, `./configure`. This will install the npm
and purescript libraries.

## Buid and Package

From the source directory, `./package`. This will create a file called
`./output/firefighter.zip`.

## Deploy

Create a `deploy.env` environment file using `deploy.env.sample` for
guidance. From the source directory `./deploy`. If you have already
deployed, use `./update` instead.



