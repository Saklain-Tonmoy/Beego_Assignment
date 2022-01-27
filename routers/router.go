package routers

import (
	"Beego_Assignment/controllers"
	beego "github.com/beego/beego/v2/server/web"
)

func init() {

		beego.Router("/", &controllers.CatApiController{}, "GET:Index")

		beego.Router("/fetch", &controllers.CatApiController{}, "GET:FetchImages")
}
