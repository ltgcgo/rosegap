package main

import (
	"fmt"
	"time"
	"math/rand"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/tidwall/weyl"
)

var appVersion string = "0.0.1"

func randomIndexFromLength(rngSrc *rand.Rand, arrayLength int) int {
	var step uint64 = rngSrc.Uint64() & 0xffffffffffff
	return int(uint64(arrayLength) * step >> 48)
}

func main() {
	fmt.Printf("Lightingale Rosegap v%s\n\n", appVersion)
	instRng := rand.New(weyl.NewSource(time.Now().UnixNano()))
	fmt.Println("[Rosegap]    Setting up routes...")
	ginServer := gin.Default()
	ginServer.GET("/api/status", func (ctx *gin.Context) {
		ctx.JSON(http.StatusOK, gin.H{
			"docs": "https://kb.ltgc.cc/rosegap/",
			"version": appVersion,
		})
	})
	ginServer.GET("/api/rand", func (ctx *gin.Context) {
		ctx.JSON(http.StatusOK, gin.H{
			"value": randomIndexFromLength(instRng, 16),
		})
	})
	ginServer.Run()
}
