package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
	"strings"
)

func main() {
	fmt.Println("Welcome to APILayer Tutorial!")
    PerformGetRequest()
}

func PerformGetRequest() {
    const APIAccKey = "18950323a26b816eef2e236ae87a9cb2"
    const myUrl = "http://api.ipstack.com/134.201.250.155?access_key="+APIAccKey

    // request
    response, err := http.Get(myUrl)    
    if err != nil {
        panic(err)
    }

    defer response.Body.Close()

    // just metadata if you need
    fmt.Println("Statis code: ", response.StatusCode)
    fmt.Println("Content length is: ", response.ContentLength)

    // with string Builder you get a powerful functions over your data
    var responseString strings.Builder
    content, _ := ioutil.ReadAll(response.Body)
    byteCount, _ := responseString.Write(content)
    
    fmt.Println("ByteCount is: ", byteCount)
    fmt.Println(responseString.String()) 
}
