#!/bin/bash

set -e
set -u

for f in */*/*/*.md; do
    rest=$(cat $f | tail -n +2)
    alias="/blog/$(dirname $f)/$(basename $f .md).html"

    new="${f}.new"

    echo +++ > $new
    echo "aliases = [\"$alias\"]" >> $new
    echo "$rest" >> $new

    mv $new $f
done
