#!/usr/bin/env bash
set -eux

echo "make sure to have oxide.zip here"
: ${RM:=192.168.0.100}
res=oxide
unzip oxide.zip -d oxide
ssh root@$RM "systemctl disable --now tarnish"
scp -r $res/. root@$RM:/
ssh root@$RM "systemctl daemon-reload && systemctl disable --now xochitl && systemctl enable --now tarnish"
rm -rf oxide
