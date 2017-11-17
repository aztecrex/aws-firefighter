#!/usr/bin/env bash

responsef=$(mktemp)

aws lambda invoke --function-name firefighter "$responsef" > /dev/null

cat "$responsef"

estr=$(< "$responsef" jp 'Credentials | [join(`"="`, [`"AWS_ACCESS_KEY"`,AccessKeyId]),join(`"="`, [`"AWS_SECRET_ACCESS_KEY"`,SecretAccessKey]),join(`"="`, [`"AWS_SESSION_TOKEN"`,SessionToken])] | join(`"\n"`, @)')

rm -f "$responsef"

echo "$estr"

# estr=$(< "$responsef" jp 'Credentials | [join(`"="`, [`"AWS_ACCESS_KEY"`,AccessKeyId]),join(`"="`, [`"AWS_SECRET_ACCESS_KEY"`,SecretAccessKey]),join(`"="`, [`"AWS_SESSION_TOKEN"`,SessionToken])] | join(`"\n"`, @)')

# env -S $(< "$responsef" jp 'Credentials | [join(`"="`, [`"AWS_ACCESS_KEY"`,AccessKeyId]),join(`"="`, [`"AWS_SECRET_ACCESS_KEY"`,SecretAccessKey]),join(`"="`, [`"AWS_SESSION_TOKEN"`,SessionToken])] | join(`"\n"`, @)')



