#!/usr/bin/env bash

set -euo pipefail
export DIR=$(realpath "$(dirname "${BASH_SOURCE[0]}")")

find $DIR -type d -depth 1 | rev | cut -d'/' -f1 | cut -d'-' -f2- | rev | sort -u
