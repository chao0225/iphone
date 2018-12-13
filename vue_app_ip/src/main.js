import Vue from 'vue'
import App from './App.vue'
import router from './router'


import'mint-ui/lib/style.css'

Vue.config.productionTip = false
//5: 设置请求的根路径 
//Vue.http.options.root = "http://127.0.0.1/vue_ser/";
//6:全局设置post 时候表音的数据组织格式为 application/x-www-form-urlencoded
//Vue.http.options.emulateJSON = true;
// 导入 MUI 的样式表， 和 Bootstrap 用法没有差别
import './lib/mui/css/mui.css'
// 导入 MUI 的样式表，扩展图标样式，购物车图标
// 还需要加载图标字体文件
import './lib/mui/css/icons-extra.css'


// 1 引入Vuex 
  import Vuex from "vuex"
//2 注册Vuex 实例对象
Vue.use(Vuex)
 // 3 创建Vuex  组件
var store=new Vuex.Store({
  state:{
    cartCount:0   // 购物车商品的数量
  },
  mutations:{   // 修改共享属性 的方法
    increment(state,count){  
       state.cartCount+=count
    },
    substract(state){   // 清空
      state.cartCount--
    },
    clear(state){
      state.cartCount=0
    }
  },
  getters:{   // 获取共享数据的方法  
    optCartCount:function(state){
      return state.cartCount;
    }
  }
})
  //4 将Vuex  独享注册vue 对象 


// 1.引入mint-ui  Header 组件
import {Header,Swipe,SwipeItem,Button} from "mint-ui"
// 2.注册 Header 组件
Vue.component(Header.name,Header);
Vue.component(Swipe.name,Swipe);
Vue.component(SwipeItem.name,SwipeItem);
Vue.component(Button.name,Button);


// 引入 axios 库（VueResource）
import axios from 'axios'
//注册
axios.defaults.withCredentials=true
// VueResource 兼容性太差
Vue.prototype.axios=axios


// 1.引入VueResource 组件
import VueResource from "vue-resource"
// 2.注册 VueResource 组件
Vue.use(VueResource)
//配置 vue-resource 常见属性
//6.1 ：设置请求服务器跟目录
Vue.http.options.root = "http://127.0.0.1:3333/";
//6.2:全局设置post 时候表音的数据组织格式为 application/x-www-form-urlencoded
// 将提交数据进行转码操作
Vue.http.options.emulateJSON = true;

//  6.3 跨域访问保存session 值选项
Vue.http.options.withCredentials=true;

// 7 创建 日期类型过滤器
//val  : 原先日期对象
Vue.filter("datatimeFilter",function(val){
   //创建时间对象
   var data=new Date(val);
   //获取年月日时分秒
   var y=data.getFullYear();
   var m=data.getMonth()+1;
   var d=data.getDate();
   var h=data.getHours();
   var mi=data.getMinutes();
   var s=data.getSeconds();
   //月日格式判断  07 08 09 10
   m<10&&(m="0"+m);
   d<10&&(d="0"+d);
   // 拼接字符串返回 
   return `${y}-${m}-${d} ${h}:${mi}:${s}`;
})


new Vue({
  router,
  render: h => h(App),
  store         //  将 VUex 对象注册 Vue 实例
}).$mount('#app')
