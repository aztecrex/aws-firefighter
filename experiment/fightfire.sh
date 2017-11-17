#!/usr/bin/env bash

responsef=$(mktemp)

prof="$1"
shift

aws --profile "$prof" lambda invoke --function-name firefighter "$responsef" > /dev/null

estr=$(< "$responsef" jp -u 'Credentials | [join(`"="`, [`"AWS_ACCESS_KEY_ID"`,AccessKeyId]),join(`"="`, [`"AWS_SECRET_ACCESS_KEY"`,SecretAccessKey]),join(`"="`, [`"AWS_SESSION_TOKEN"`,SessionToken])] | join(`" "`, @)')
rm -f "$responsef"

env -S "$estr" aws "${@}"
