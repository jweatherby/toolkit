#!/bin/bash

usage() { echo "Usage $0 [-e <local|live|test>] <gapi_resource>" 1>&2; exit 1; }

while getopts ":e:" o; do
    case "${o}" in
        e)
            env=${OPTARG}
            shift 2;
            ;;
        *)
            usage
            ;;
    esac

done

gapi_resource=$@

if [ ! "$gapi_resource" ]; then
    usage
fi

if [ "$env" = "live" ]; then
    echo "WARNING: Using gapi LIVE (production)" 1>&2
    CONFIG_KEY=""
else
    echo "Using gapi TEST (sandbox)" 1>&2
    CONFIG_KEY=""
fi

if [ "$env" = "local" ]; then
    gapi_url="https://rest.gadventures.com"
else
    gapi_url="http://127.0.0.1:5000"
fi

CMD="curl --header X-Application-Key:$CONFIG_KEY $gapi_url/$gapi_resource"

echo "Running $CMD" 1>&2
$CMD
