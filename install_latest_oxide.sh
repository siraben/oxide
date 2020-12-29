#!/usr/bin/env bash
set -eux

RM=192.168.0.100

res=$(nix-build --no-out-link --argstr system 'x86_64-linux')
ssh root@$RM "systemctl disable --now tarnish"
scp -r $res/. root@$RM:/
ssh root@$RM "systemctl daemon-reload && systemctl disable --now xochitl && systemctl enable --now tarnish"
