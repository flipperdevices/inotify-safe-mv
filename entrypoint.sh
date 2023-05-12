#!/bin/bash

set -euo pipefail;

INPUT_DIR="${INPUT_DIR:-"/input"}";
OUTPUT_DIR="${OUTPUT_DIR:-"/output"}";

inotifywait -m -q -e close_write "$INPUT_DIR" --format '%w%f' | {
    while read -r FILE; do
        echo "Moving $FILE";
        mv -n "$FILE" "$OUTPUT_DIR";
        rm -f "$FILE";
    done
};
