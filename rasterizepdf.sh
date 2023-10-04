#!/bin/sh
# Rasterize PDF files with Ghostscript and ImageMagick.

set -e


# parse options
DENSITY='600'
ADDEXT='.raster'

while getopts d:e: O; do
    case $O in
        'd' ) DENSITY=$OPTARG;;
        'e' ) ADDEXT=$OPTARG;;
    esac
done

shift $((OPTIND-1))


# convert all specified files
if [ $# -le 0 ]; then
    echo 'Target filename argument is required.' >&2

    exit
fi

TMPDIR=$(mktemp -d)
trap "rm -rf $TMPDIR" EXIT

for file in "$@"; do
    gs -dNOPAUSE -r$DENSITY -dBATCH -sDEVICE=png16m \
        -sOutputFile="$TMPDIR/tmp-%02d.png" "$file"

    # remove profile to avoid 'Insufficient data for an image' error
    convert "$TMPDIR"/tmp-*.png +profile '*' "${file%.*}$ADDEXT.pdf"

    rm "$TMPDIR"/tmp-*.png
done
