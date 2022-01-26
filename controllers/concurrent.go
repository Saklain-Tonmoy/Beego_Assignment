package controllers

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"

	beego "github.com/beego/beego/v2/server/web"
)

type ConcurrentController struct {
	beego.Controller
}

func FetchApi(url string) ([]map[string]interface{}, error) {
	request, err := http.NewRequest("GET", url, nil)

	if err != nil {
		log.Fatalln(err)
	}

	response, _ := http.DefaultClient.Do(request)

	data, err := ioutil.ReadAll(response.Body)

	//fmt.Println(data)

	var jsonMap []map[string]interface{}

	fmt.Println(string(data))
	// a, _ := json.Marshal(data)
	json.Unmarshal(data, &jsonMap)
	fmt.Println((&jsonMap))

	// fmt.Println(string(jsonMap))

	return jsonMap, err
}

func (c *ConcurrentController) Index() {
	urls := []string{
		"https://api.thecatapi.com/v1/breeds",
		"https://api.thecatapi.com/v1/categories",
		"https://api.thecatapi.com/v1/images/search?limit=9",
	}

	ch := make(chan interface{})

	for _, url := range urls {
		go func(url string) {
			data, err := FetchApi(url)
			if err != nil {
				log.Fatalln("error getting comic", err)
			}
			ch <- data
		}(url)
	}

	var allApiData []interface{}
	for i := 0; i < len(urls); i++ {
		data := <-ch
		fmt.Println(data)
		allApiData = append(allApiData, data)
		fmt.Println(allApiData)
	}

	c.TplName = "index.tpl"

	c.Data["allData"] = allApiData

	c.Data["json"] = allApiData

	c.ServeJSON()
}
