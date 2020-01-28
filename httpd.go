package main

import (
    "fmt"
    "os"
    "net/http"
)

func main() {
    http.HandleFunc("/", HelloServer)
    http.ListenAndServe(":8080", nil)
}

func HelloServer(w http.ResponseWriter, r *http.Request) {
    hostname,err := os.Hostname()
    if err == nil {
        fmt.Fprintf(w, "This version is v3 and hostname is %s\n", hostname)
    }
}
