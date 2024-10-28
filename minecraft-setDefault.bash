#!/usr/bin/env bash

# Root check
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi

# Script start
INSTANCE="${1}"

cat <<EOF > /etc/systemd/system/minecraft-default.service
[Unit]
Description=Shim for minecraft@${INSTANCE}.service
Requires=minecraft@${INSTANCE}.service

[Install]
WantedBy=default.target
EOF

systemctl daemon-reload
