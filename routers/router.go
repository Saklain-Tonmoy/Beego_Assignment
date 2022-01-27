package routers

import (
	"Beego_Assignment/controllers"
	beego "github.com/beego/beego/v2/server/web"
)

func init() {

		beego.Router("/", &controllers.ConcurrentController{}, "GET:Index")

		beego.Router("/fetch", &controllers.ConcurrentController{}, "GET:FetchImages")
}
