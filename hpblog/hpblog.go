package main

import (
//	"bytes"
	"fmt"
	"io/ioutil"
	"net/http"
	"strings"
)

func main() {
	url := "http://www.up-fc.jp/helloproject/member/kensyusei/blog_tamago/?m=20201108"

	// Getリクエスト
	res, _ := http.Get(url)
	defer res.Body.Close()

	// 読み取り
	buf, _ := ioutil.ReadAll(res.Body)
	str := string(buf)
	head := strings.Index(str, "<div class=\"post-")
	futter := strings.Index(str[(head+1):], "<div class=\"post-")
	fmt.Println(str[head:(head+futter)])
}
