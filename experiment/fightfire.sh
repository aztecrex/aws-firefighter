#!/usr/bin/env bash

responsef=$(mktemp)

aws --profile greg lambda invoke --function-name firefighter "$responsef" > /dev/null

estr=$(< "$responsef" jp -u 'Credentials | [join(`"="`, [`"AWS_ACCESS_KEY_ID"`,AccessKeyId]),join(`"="`, [`"AWS_SECRET_ACCESS_KEY"`,SecretAccessKey]),join(`"="`, [`"AWS_SESSION_TOKEN"`,SessionToken])] | join(`" "`, @)')
rm -f "$responsef"

env -S "$estr" aws "${@}"

# env -S $(< "$responsef" jp 'Credentials | [join(`"="`, [`"AWS_ACCESS_KEY"`,AccessKeyId]),join(`"="`, [`"AWS_SECRET_ACCESS_KEY"`,SecretAccessKey]),join(`"="`, [`"AWS_SESSION_TOKEN"`,SessionToken])] | join(`"\n"`, @)')



