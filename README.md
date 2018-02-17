# Unix Socket to Websocket Proxy

## INSTALL

### 1. clone the repository

```
git clone https://github.com/clamtestbbs/us2ws
```

### 2. install the apps for building

```
# apt install -y golang upx socat
```

### 3. set up the building environment

a. set go path

```
$ cd us2ws && export GOPATH=$PWD
```

(use "go env" to check)

* ref: https://github.com/golang/go/wiki/SettingGOPATH

b. "go get" websocket repo in github

```
$ go get github.com/gorilla/websocket
```

### 4. build the package

```
$ ./build.sh
```

### 5. add an unix socket

execute `usock2wsock` to add an unix socket (telnetBYwebsocket.{$ANYNUMBER}.sock

```
./usock2wsock -h
Usage of ./usock2wsock:
  -r int
        Assign a random number to distinguish unix domain sockets (default 9487)
  -u string
        Assign the websockets endpoint. Starting with ws:// or wss://
```

For sxample:

```
$ ./usock2wsock -r 9487 -u wss://ws.ptt.cc/bbs
```

to add `/tmp/telnetBYwebsocket.9487.sock`

### 6. socat to forward unix socket to telnet socket

https://serverfault.com/questions/517906

For example:

```
$ socat TCP-LISTEN:12345 UNIX-CONNECT:/tmp/telnetBYwebsocket.9487.sock
```

### 7. connet to telnet socket

```
$ telnet 0 <forwarded-port>
```

For example:

```
$ telnet 0 12345
```
