package controllers

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"

	beego "github.com/beego/beego/v2/server/web"
)

type MainController struct {
	beego.Controller
}
type breed struct {
	name string `json:"name"`
	id   string `json:"id"`
}

func (c *MainController) Get() {
	c.Data["Website"] = "beego.me"
	c.Data["Email"] = "astaxie@gmail.com"
	c.TplName = "index.tpl"

	/// codes for fetching all the breeds from CAT API
	//url := "https://api.thecatapi.com/v1/breeds?attach_breed=0"

	// req, _ := http.NewRequest("GET", url, nil)

	// req.Header.Add("x-api-key", "6c73dbb1-628c-4102-b72a-cb021e2368c5 ")

	// res, _ := http.DefaultClient.Do(req)

	// //defer res.Body.Close()
	// body, _ := ioutil.ReadAll(res.Body)

	// fmt.Println(res)
	// fmt.Printf("Body text length %d \n",len(body))

	/// codes for fetching all the categories from CAT API
	//responde, _ := http.Get(url)

	//  a := []breed{}

	// jsonDataFromHttp, _ := ioutil.ReadAll(responde.Body)
	// v := fmt.Sprintf("%s", jsonDataFromHttp)

	

	// fmt.Printf("%T", responde.Body)
	
	// data := json.NewDecoder(responde.Body)
	//
	// fmt.Println(a)

}
