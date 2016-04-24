#!/bin/bash

# Usage: ./install.sh $TEXROOT
# Or: exprot $TEXROOT; ./install.sh

# TODO: Add option to run "context --generate"
# TODO: Can we do something with files that are removed

if [ -n "$1" ]; then
    TEXROOT="$1"
fi

if [ -z "$TEXROOT" ]; then
    echo "TEXROOT is not set and no argument passed.  Nothing transfered."
    exit 1
fi

if [ -x ${TEXROOT}/setuptex ]; then
    # current options: -v: verbose, -r: recursive, -c: use checksums, -p: permissions
    # other options: -i: itemize files -n do nothing
    rsync -v -r -p --exclude '*~' -c --log-file=install.log  --stats texmf-local/ ${TEXROOT}/texmf-local
#    context --generate
else
    echo "TEXROOT is not valid"
    exit 2
fi
