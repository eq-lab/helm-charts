#!/bin/sh
# Entrypoint for the upstream amneziavpn/amneziawg-go image, which ships no CMD of its own.

CONFIG=/etc/wireguard/wg0.conf

stop () {
    awg-quick down "$CONFIG"
    exit 0
}
trap stop TERM INT QUIT

awg-quick up "$CONFIG" || exit 1
echo "Public key '$(awg show wg0 public-key)'"

sleep infinity &
wait $!
