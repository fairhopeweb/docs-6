#!/bin/bash
set -euo pipefail

mkdir -p _build/html

export RCLONE_CONFIG_AMS3_TYPE=s3
export RCLONE_CONFIG_AMS3_ENDPOINT=ams3.digitaloceanspaces.com
rclone sync -v ams3:syncthing-docs/ _build/html/

make html
make man
mv _build/man _build/html
