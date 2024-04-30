package main

import (
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
)

var appVersion string = "0.0.1"

func main() {
	fmt.Printf("Lightingale Rosegap v%s\n\n", appVersion)
	fmt.Println("[Roesgap] Setting up routes...")
	ginServer := gin.Default()
	ginServer.GET("/api/status", func (ctx *gin.Context) {
		ctx.JSON(http.StatusOK, gin.H{
			"docs": "https://kb.ltgc.cc/rosegap/",
			"version": appVersion,
		})
	})
	ginServer.Run()
}
