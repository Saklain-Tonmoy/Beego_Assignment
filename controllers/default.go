package controllers

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	//"log"
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
	// fmt.Println(a[0].Name)
	// for i:=0; i<len(a); i++ {
	// 	fmt.Println(a[i].Id)
	// 	fmt.Println(a[i].Name)
	// }
	fmt.Println(a)
	// fmt.Println(len(a))




	/// codes for fetching all the categories from CAT API
	/// using the "httplib" package of Beego
	catReq := httplib.Get("https://api.thecatapi.com/v1/categories")

	catReq.Header("Accept", "application/json")
	catReq.Header("x-api-key", "6c73dbb1-628c-4102-b72a-cb021e2368c5")

	data, _ := catReq.String()
	fmt.Println(data)

	fmt.Printf("%T", data)

	cat := []Category{}

	json.Unmarshal([]byte(data), &cat)

	fmt.Println(cat)

	c.Data["breeds"] = &a

	c.Data["categories"] = &cat

	//c.Data["json"]= &cat

	//c.ServeJSON()

}


func (c *MainController) FetchData() {
	order := c.GetString("order")
	mime_types := c.GetString("type")
	category := c.GetString("category")
	breed := c.GetString("breed")
	limit := c.GetString("limit")

	url := "https://api.thecatapi.com/v1/images/search?order=" + order + "&limit=" + limit + "&category_ids=" + category + "&breed_id=" + breed + "&mime_types=" + mime_types

	http.Get(url)

	fmt.Println("yrs",order)
	c.ServeJSON()
}
