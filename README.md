# Unix Socket to Websocket Proxy

## INSTALL

### 1. clone the repository

```
$ git clone https://github.com/clamtestbbs/us2ws
```

### 2. install the apps for building

```
# apt install -y golang upx socat
```

### 3. set up the environment for GO

a. set go path

  i. If you are using Linux platform ( Debian , Ubuntu , CentOS , RHEL ...) : 

```
$ cd us2ws && export GOPATH=$PWD
```
(use `go env` to check)

  ii. If you are using BSD platform ( FreeBSD , OpenBSD , Apple ...) :

```
$ cd us2ws && setenv GOPATH $PWD
```
(use `go env` to check)

* ref: https://github.com/golang/go/wiki/SettingGOPATH

b. "go get" websocket repo in github

```
$ go get github.com/gorilla/websocket
```

### 4. execute GO script to add an unix socket

```
$ go run main.go -h

Usage of ... :
  -r int
        Assign a random number to distinguish unix domain sockets (default 9487)
  -u string
        Assign the websockets endpoint. Starting with ws:// or wss://
```

For example:

```
$ go run main.go -r 9487 -u wss://ws.ptt.cc/bbs &
```

to add `/tmp/telnetBYwebsocket.9487.sock`

## In Linux platform 

### 5a-1. socat to forward unix socket to telnet socket

https://serverfault.com/questions/517906

For example:

```
$ socat TCP-LISTEN:12345 UNIX-CONNECT:/tmp/telnetBYwebsocket.9487.sock &
```

### 5a-2. connet to telnet socket

```
$ telnet 0 <forwarded-port>
```

For example:

```
$ telnet 0 12345
```

## In BSD platform 


### 5b. use telnet to connect to unix socket

```
$ telnet -8 -u /tmp/telnetBYwebsocket.<NUMBER>.sock
```

For example:

```
$ telnet -8 -u /tmp/telnetBYwebsocket.9487.sock
```
