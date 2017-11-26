#!/usr/bin/env bash

fenv="$(dirname $0)/fightfire.env"

if [ ! -x "$(which jp)" ]; then
    echo "JMESPath processer 'jp' required" 1>&2
    exit 2
fi

if [ -f "$fenv" ]; then
    source "$fenv"
fi

if [ -z "$FIREFIGHTER_VENDOR" ]; then
    echo "environment variable 'FIREFIGHTER_VENDOR' required" 1>&2
    exit 3
fi


estr="$(    curl -s "${FIREFIGHTER_VENDOR}" \
        | jp -u 'Credentials | [join(`"="`, [`"AWS_ACCESS_KEY_ID"`,AccessKeyId]),join(`"="`, [`"AWS_SECRET_ACCESS_KEY"`,SecretAccessKey]),join(`"="`, [`"AWS_SESSION_TOKEN"`,SessionToken])] | join(`" "`, @)' \
    )"

env -S "$estr" aws "${@}"
