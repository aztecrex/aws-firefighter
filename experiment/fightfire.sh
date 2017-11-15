#!/usr/bin/env bash

# env -S $(< temp.json jp 'Credentials | [join(`"="`, [`"AWS_ACCESS_KEY"`,AccessKeyId]),join(`"="`, [`"AWS_SECRET_ACCESS_KEY"`,SecretAccessKey]),join(`"="`, [`"AWS_SESSION_TOKEN"`,SessionToken])] | join(`"\n"`, @)')



