<!--src/components/tabbar/Home.Vue;-->
<template>
   <div class="app-home">
     <!--1:顶部导航栏-->
     
     <!--2:轮播图-->
     <mt-swipe :auto="3000">
       <mt-swipe-item v-for="item in list" :key="item.id">
          <img  :src="item.img_url"/>
       </mt-swipe-item>
     </mt-swipe>
     <!--3:九宫格-->
        <ul class="mui-table-view mui-grid-view mui-grid-9">
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><router-link to="/NewsList">
                    <img src="../../img/menu1.png">
                    <div class="mui-media-body">新闻</div></router-link></li>
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><router-link to="/GoodsList">
                    <img src="../../img/menu2.png">
                    <div class="mui-media-body">商品</div></router-link></li>
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="#"> 
                    <img src="../../img/menu3.png">
                    <div class="mui-media-body">Chat</div></a></li>
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
                    <img src="../../img/menu4.png">
                    <div class="mui-media-body">location</div></a></li>
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
                    <img src="../../img/menu5.png">
                    <div class="mui-media-body">Search</div></a></li>
            <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
                    <img src="../../img/menu6.png">
                    <div class="mui-media-body">Phone</div></a></li>
           
        </ul> 

    
   </div>
</template>
<script>
   export default {
      created(){
        this.getImages();
      },
      methods:{
        getImages(){
          //11:03
          // this.$http.get("imagelist").then(result=>{
          //   //console.log(result.body);
          //   this.list=result.body;
          // })

           var url="http://127.0.0.1:3333/imagelist";
                this.axios.get(url).then(result=>{
                    console.log(result);
                  this.list=result.data;
                })
        }
      },
      data(){
        return {
          list:[  ]
        }
      }
   }
</script>
<style>
 .app-home .mint-swipe{
   height:200px;
 }
 .app-home .mint-swipe img{
   width:100%;
   height:200px;
 }
 
 .app-home .mui-table-view.mui-grid-view .mui-table-view-cell{
    background:#fff;
    border:0;
 }
 ul li img{
     width:70px;
     height:70px;
 }
</style>
