#!/usr/bin/env bash

# Root check
if [[ "$EUID" -ne 0 ]]; then
  echo "Please run as root"
  exit 1
fi

# Script start
INSTANCE="${1}"

cat <<EOF > /etc/systemd/system/minecraft.target
[Unit]
Description=Shim for minecraft@${INSTANCE}.service
AllowIsolate=no
Requires=minecraft@${INSTANCE}.service

[Install]
WantedBy=default.target
EOF
systemctl daemon-reload

# Restart if already running
[[ "$(systemctl show -property=ActiveState --value=minecraft.target)" == "running" ]] && systemctl restart minecraft.target