############################
# STEP 1 build executable binary
############################
FROM golang:alpine AS builder
WORKDIR $GOPATH/src/httpd/
COPY httpd.go .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -ldflags="-w -s" -o /go/bin/httpd
############################
# STEP 2 build a small image
############################
FROM scratch
EXPOSE 8080
COPY --from=builder /go/bin/httpd /go/bin/httpd
ENTRYPOINT ["/go/bin/httpd"]
