#!/usr/bin/env bash

set -euo pipefail
export DIR=$(realpath "$(dirname "${BASH_SOURCE[0]}")")

find $DIR -depth 1 -type d | rev | cut -d'/' -f1 | cut -d'-' -f2- | rev | sort -u
