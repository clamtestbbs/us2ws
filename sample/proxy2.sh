#!/usr/bin/env sh
export GOPATH=$PWD
go run main.go -r `date +%s` -u wss://term.gamer.com.tw/bbs &
socat TCP-LISTEN:$1 UNIX-CONNECT:tmp/telnetBYwebsocket.`date +%s`.sock &

