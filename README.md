# Firefighter

You're a firefighter. You need to get into the infrastructure
but all the access is blocked. This software will get you
in.


## Status

- Lambda Function vends credentals from STS assume-role
- API Gateway fronts the Lambda Function
- provisioning via CloudFormation
- bare-bones deployment

## Up Next

- get serious about packaging this for consumption
    - design the CD for this case, allowing people to hook into it via their own AWS accounts
    - figure out how best to distribute end-user tools
- develop a proper end-user CLI tool

## Prerequisites

### Build
- node (and npm)
- psc-package

### Package

- zip

### Deploy

- aws cli
- aws cli credentials set up on your computer

### Try It Out

- JMESPath processor `jp` installed on your computer

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

Deployment is still a bit in the air because I haven't yet decied how
to publish this software in a continuous delivery. The trouble is that
I want to continuously deploy to my own AWS accounts but that probably
won't help you. I'll figure it out, just give me a little time.

For now, use the CloudFormation template, `provision.yaml` which will
set up the AWS Lambda Function and API Gateway. The stack output
will contain the firefighting credential vendor URL.

The output will also contain the Lambda function name. Update the
Lambda Function code after you deploy the CloudFormation stack, using
`aws lambda update-function-code --function-name <lambda-fn-name> --zip-file fileb://output/firefighter.zip`
where you replace `<lambda-fn-name>` with the name of the function in
your stack.

This will get better as soon as I figure out how I want to deploy
this--the very next thing on my backlog.

## Try It Out

I added a simple AWS CLI replacement called `fightfire.sh` in the
`experiment` directory. It is a simple UI for testing out this
code while it is under development.

Create a file, `experiment/fightfire.env`, using 
`experiment/fightfire.env.sample` as a template. Use the vendor
URL from your stack output in your own `.env` file.

Run `experiment/fightfire.sh` like you would normally run
`aws`, with a subcommand and arguments. If your firefighter
role has permission to perform the request, it will be performed.
Otherwise, you will see an access-denied message.

