#!/bin/bash
set -euo pipefail

mkdir -p _build/html

make html
make man
mv _build/man _build/html
