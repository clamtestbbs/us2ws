#!/usr/bin/env sh
export GOPATH=$PWD
go get github.com/gorilla/websocket
go run main.go -r `date +%s` -u wss://ws.ptt.cc/bbs &
socat TCP-LISTEN:$1 UNIX-CONNECT:tmp/telnetBYwebsocket.`date +%s`.sock &

