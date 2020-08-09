package main

import (
    "bytes"
    "fmt"
    "io/ioutil"
    "net/http"

    "github.com/PuerkitoBio/goquery"
    "github.com/saintfish/chardet"
    "golang.org/x/net/html/charset"
)

func main() {
    url := "http://www.helloproject.com/helloprokenshusei/profile/"

    // Getリクエスト
    res, _ := http.Get(url)
    defer res.Body.Close()

    // 読み取り
    buf, _ := ioutil.ReadAll(res.Body)

    // 文字コード判定
    det := chardet.NewTextDetector()
    detRslt, _ := det.DetectBest(buf)

    // 文字コード変換
    bReader := bytes.NewReader(buf)
    reader, _ := charset.NewReaderLabel(detRslt.Charset, bReader)

    // HTMLパース
    doc, _ := goquery.NewDocumentFromReader(reader)

    fmt.Printf("氏名,生年月日,血液型,出身地\n")
    rslt := doc.Find("h4")
    list := doc.Find("dd")
    for i := 0; i < rslt.Length(); i++ {
        name := rslt.Eq(i).Text()
        birthday := list.Eq(i*3).Text()
        blood := list.Eq(i*3+1).Text()
        hometown := list.Eq(i*3+2).Text()
        fmt.Printf("%v,%v,%v,%v\n", name, birthday, blood, hometown)
    }
}
