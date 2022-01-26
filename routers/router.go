package routers

import (
	"Beego_Assignment/controllers"
	beego "github.com/beego/beego/v2/server/web"
)

func init() {
    beego.Router("/", &controllers.MainController{}, "GET:Index")

		beego.Router("/fetch-data", &controllers.MainController{}, "GET:FetchData")

		beego.Router("/test", &controllers.ConcurrentController{}, "GET:Index")
}
