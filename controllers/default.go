package controllers

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"

	"github.com/beego/beego/v2/client/httplib"
	beego "github.com/beego/beego/v2/server/web"
)

type MainController struct {
	beego.Controller
}

type Image struct {
	Url string `json:"url"`
}

func (c *MainController) Index() {

	type Breed struct {
		Name string `json:"name"`
		Id   string `json:"id"`
	}


	type Category struct {
		Name string `json:"name"`
		Id int `json:"id"`
	}

	c.TplName = "index.tpl"

	/// codes for fetching all the breeds from CAT API
	/// using the "net/http" package of Golang
	url := "https://api.thecatapi.com/v1/breeds?attach_breed=0"


	// https://api.thecatapi.com/v1/images/search?order=ASC&limit=18&category_ids=1&breed_id=abys&mime_types=gif,jpg,png

	req, _ := http.NewRequest("GET", url, nil)

	req.Header.Add("x-api-key", "6c73dbb1-628c-4102-b72a-cb021e2368c5 ")

	res, _ := http.DefaultClient.Do(req)
	
	body, _ := ioutil.ReadAll(res.Body)

	a := []Breed{}

	json.Unmarshal(body, &a)

	//fmt.Println(a)




	/// codes for fetching all the categories from CAT API
	/// using the "httplib" package of Beego
	catReq := httplib.Get("https://api.thecatapi.com/v1/categories")

	catReq.Header("Accept", "application/json")
	catReq.Header("x-api-key", "6c73dbb1-628c-4102-b72a-cb021e2368c5")

	data, _ := catReq.String()
	//fmt.Println(data)

	//fmt.Printf("%T", data)

	cat := []Category{}

	json.Unmarshal([]byte(data), &cat)

	fmt.Println(cat)

	c.Data["breeds"] = &a

	c.Data["categories"] = &cat

	//c.Data["json"]= &cat

	//c.ServeJSON()



	/// codes for fetching initial images

	imageReq := httplib.Get("https://api.thecatapi.com/v1/images/search?limit=9")

	imageReq.Header("x-api-key", "6c73dbb1-628c-4102-b72a-cb021e2368c5")

	imagesData, _ := imageReq.String()

	images := []Image{}

	json.Unmarshal([]byte(imagesData), &images)

	fmt.Println(images)

	c.Data["images"] = &images

	// c.Data["json"] = &images

	// c.ServeJSON()

}


func (c *MainController) FetchData() {

	type Image struct {
		Url string `json:"url"`
	}

	order := c.GetString("order")
	mime_types := c.GetString("type")
	category := c.GetString("category")
	breed := c.GetString("breed")
	limit := c.GetString("limit")

	//url := "https://api.thecatapi.com/v1/images/search?" + "limit=" + limit + "&breed_id=" + breed 

	url := "https://api.thecatapi.com/v1/images/search?order=" + order + "&limit=" + limit + "&category_ids=" + category + "&breed_id=" + breed + "&mime_types=" + mime_types

	fmt.Println(url)

	req, _ := http.NewRequest("GET", url, nil)

	req.Header.Add("x-api-key", "6c73dbb1-628c-4102-b72a-cb021e2368c5 ")

	res, _ := http.DefaultClient.Do(req)
	
	body, _ := ioutil.ReadAll(res.Body)

	

	a := []Image{}

	json.Unmarshal(body, &a)
	c.Data["images"] = &a

	c.Data["json"]= &a
	c.ServeJSON()
	//fmt.Println(a)
}
