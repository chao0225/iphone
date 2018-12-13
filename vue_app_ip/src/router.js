import Vue from 'vue'
import Router from 'vue-router'
import HelloContainer from "./components/HelloWorld.vue"
import Test from "./components/Test.vue"
//1:引入自定义组件
import List from "./components/listContainer.vue"
import Home from "./components/tabbar/Home.vue"
import NewsList from "./components/news/NewsList.vue"
import NewsInfo from "./components/news/NewsInfo.vue"
import GoodsList from "./components/good/GoodsList.vue"
import GoodsInfo from "./components/good/GoodsInfo.vue"
import Login from "./components/login/Login.vue"
import Register from "./components/login/Register.vue"
import Cart from "./components/tabbar/Cart.vue"
import Search from "./components/tabbar/Search.vue"
import ButtonNb from "./components/custom/ButtonNb.vue"
import Image from "./components/custom/Image.vue"

Vue.use(Router)
export default new Router({
  //2:为组件配置访问路径
  routes: [
    {path:"/Image",component:Image},
    {path:"/ButtonNb",component:ButtonNb},
    {path:"/Register",component:Register},
    {path:"/Search",component:Search},
    {path:"/Cart",component:Cart},
    {path:"/Login",component:Login},
    {path:"/GoodsInfo/:id",component:GoodsInfo},
    {path:"/GoodsList",component:GoodsList},
    {path:"/NewsInfo",component:NewsInfo},
    {path:"/NewsList",component:NewsList},
    {path:"/Home",component:Home},
    {path:"/List",component:List},
    {path:'/',redirect:"/Home"},
    {path:"/Test",component:Test}
  ]
})
