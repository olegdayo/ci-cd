package main

import (
	"log/slog"
	"net/http"
)

const (
	version = "0.1.0"
)

func handler(w http.ResponseWriter, r *http.Request) {
	_, err := w.Write([]byte(version))
	if err != nil {
		slog.Error(err.Error())
	}
}

func main() {
	http.HandleFunc("/", handler)
	panic(http.ListenAndServe(":8080", nil))
}
