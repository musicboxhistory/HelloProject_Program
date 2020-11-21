package main

import (
	//	"bytes"

	"fmt"
	"io/ioutil"
	"net/http"
	"os"
	"strings"
)

var urllist []string

func linkParse(str string) {
	var start, end int
	urllist = make([]string, 0)
	for {
		str = str[end:]
		start = strings.Index(str, "http://www.up-fc.jp/helloproject/member/kensyusei/blog_tamago/?m=")
		// 終了時にマイナス１が変える想定だが、なぜか変な数字が返ってくるため暫定ガード処理
		if start == -1 || start > 3000 {
			break
		}
		end = strings.Index(str[(start+1):], "'>")
		end += start
		urllist = append(urllist, str[start:(end+1)])
	}
}

func getHpList(url string) {
	//	var start, end int
	// Getリクエスト
	res, _ := http.Get(url)
	defer res.Body.Close()

	// 読み取り
	buf, _ := ioutil.ReadAll(res.Body)
	str := string(buf)

	//日付抽出
	idx := strings.Index(url, "?m=") + 3
	name := url[idx:]
	name = "blog/" + name + ".html"
	/*
		if err := os.Mkdir(dirname, 0777); err != nil {
			fmt.Println(err)
		}
	*/

	//書き出し
	fp, err := os.Create(name)
	if err != nil {
		fmt.Println(err)
		return
	}
	defer fp.Close()
	fp.WriteString(str)

	/* 個別対応は一旦放置
	//ファイル作成
	for {
		//本文抽出
		str = str[end:]
		start = strings.Index(str, "<div class=\"post-")
		// 終了時にマイナス１が変える想定だが、なぜか変な数字が返ってくるため暫定ガード処理
		if start == -1 {
			break
		}
		end = strings.Index(str[(start+1):], "<div class=\"post-")
		end += start
		if end == 0 {
			break
		}
		//		fmt.Println(str[start:(end + 1)])

		//書き出し

	}
	*/
}

func main() {
	//ディレクトリ作成
	if err := os.Mkdir("blog", 0777); err != nil {
		fmt.Println(err)
	}

	//リンクのリストを取得するため一旦仮のURLを取得
	url := "http://www.up-fc.jp/helloproject/member/kensyusei/blog_tamago/?m=20201108"

	// Getリクエスト
	res, _ := http.Get(url)
	defer res.Body.Close()

	// 読み取り
	buf, _ := ioutil.ReadAll(res.Body)
	str := string(buf)

	//リンクリストを取得
	linkParse(str)

	//リンクのリストから各ページの研修生ページを生成
	for i := 0; i < len(urllist); i++ {
		getHpList(urllist[i])
	}
}
