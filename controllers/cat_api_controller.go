package controllers

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"

	beego "github.com/beego/beego/v2/server/web"
)

type CatApiController struct {
	beego.Controller
}

type Image struct {
	Url string `json:"url"`
}

func FetchApi(url string, ch chan string){

	request, err := http.NewRequest("GET", url, nil)

	if err != nil {
		log.Fatalln(err)
	}

	response, _ := http.DefaultClient.Do(request)

	data, _ := ioutil.ReadAll(response.Body)

	ch <- string(data)

}

func (c *CatApiController) Index() {

	type Breed struct {
		Name string `json:"name"`
		Id string `json:"id"`
	}

	type Category struct {
		Name string `json:"name"`
		Id int `json:"id"`
	}

	breedChannel := make(chan string)
	categoryChannel := make(chan string)
	imageChannel := make(chan string)

	go FetchApi("https://api.thecatapi.com/v1/breeds", breedChannel)

	go FetchApi("https://api.thecatapi.com/v1/categories", categoryChannel)

	go FetchApi("https://api.thecatapi.com/v1/images/search?limit=9", imageChannel)

	breeds := []Breed{}
	json.Unmarshal([]byte(<-breedChannel), &breeds)
	//fmt.Println(breed)

	categories := []Category{}
	json.Unmarshal([]byte(<-categoryChannel), &categories)
	//fmt.Println(category)

	images := []Image{}
	json.Unmarshal([]byte(<-imageChannel), &images)
	//fmt.Println(image)

	defer close(breedChannel)
	defer close(categoryChannel)
	defer close(imageChannel)

	c.TplName = "index.tpl"

	c.Data["breeds"] = breeds
	c.Data["categories"] = categories
	c.Data["images"] = images

}


func (c *CatApiController) FetchImages() {
	order := c.GetString("order")
	mime_types := c.GetString("type")
	category := c.GetString("category")
	breed := c.GetString("breed")
	limit := c.GetString("limit")
	page := c.GetString("page")

	url := "https://api.thecatapi.com/v1/images/search?order=" + order + "&limit=" + limit + "&category_ids=" + category + "&breed_id=" + breed + "&mime_types=" + mime_types + "&page=" + page

	fmt.Println(url)

	imagesChannel := make(chan string)

	go FetchApi(url, imagesChannel)

	images := []Image{}

	json.Unmarshal([]byte(<-imagesChannel), &images)

	fmt.Println(images)

	c.Data["json"]= &images

	defer close(imagesChannel)
	defer c.ServeJSON()
}
