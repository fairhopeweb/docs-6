#!/bin/bash
set -euo pipefail

mkdir -p _build/html

curl -LO https://downloads.rclone.org/rclone-current-linux-amd64.zip
unzip rclone-current-linux-amd64.zip
rclone=rclone-*/rclone

export RCLONE_CONFIG_AMS3_TYPE=s3
export RCLONE_CONFIG_AMS3_ENDPOINT=ams3.digitaloceanspaces.com
$rclone sync -v ams3:syncthing-docs/ _build/html/

make html
make man
mv _build/man _build/html
