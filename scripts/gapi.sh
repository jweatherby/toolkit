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
    CONFIG_KEY="live_532c2dccb163cdeb0e11103a5bdb26263fa98446"
else
    echo "Using gapi TEST (sandbox)" 1>&2
    CONFIG_KEY="test_b97026e3d6d9f6de89aa2ac3b77e3813d61f9e5e"
fi

if [ "$env" = "local" ]; then
    gapi_url="https://rest.gadventures.com"
else
    gapi_url="http://127.0.0.1:5000"
fi

CMD="curl --header X-Application-Key:$CONFIG_KEY $gapi_url/$gapi_resource"

echo "Running $CMD" 1>&2
$CMD
