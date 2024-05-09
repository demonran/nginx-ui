BUILD_TIME := $(shell date +%s)
export GO111MODULE=on

os=linux
arch=amd64
cc=x86_64-linux-musl-gcc

build: frontend backend

frontend:
	cd app && $(MAKE)

backend:
	env CC=${cc} CGO_ENABLED=1 GOOS=${os} GOARCH=${arch}  go build -tags=jsoniter -ldflags "$LD_FLAGS -X 'github.com/0xJacky/Nginx-UI/server/settings.buildTime=$(BUILD_TIME)'" -o dist/nginx-ui -v main.go

