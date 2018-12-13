<template>
  <div class="app-goodslist">
    <!--商品列表项-->
    <div class="goods-item" v-for="item in list" :key="item.id">
     <img :src="item.img_url" @click="jumpDetail" :data-id="item.id"/>
     <h3 class="title">{{item.title}}</h3>
     <div class="info">
       <div class="price">
        <span class="now">{{item.now}}</span>
        <span class="old">{{item.old}}</span>
       </div>
     </div>
     <div class="sell">
       <span>热卖中</span>
       <span>剩1件</span>
     </div>
    </div>
   <!--商品列表项-->   
  </div>  
</template>
<script>
 export default {
   created() {
     this.getMore();
   },
   methods:{
     jumpDetail(even){
       //获取商品编号
       var id = even.target.dataset.id;
       //跳转不同组件
       this.$router.push("/GoodsInfo/"+id);
     },
     getMore(){
       var url = "goodsList";
       this.$http.get(url).then(result=>{
           this.list =  result.body;  
       });
     }
   },
   data(){
     return {list:[]}
   }
 }
</script>
<style>
 .app-goodslist{
    display:flex;  /*最外层设置弹性布局*/
    flex-wrap:wrap;/*子元素换行*/
    justify-content:space-between;/*两端对齐*/
    padding:7px;
 }
 /*当前商品元素项*/
 .app-goodslist .goods-item{
   width:49%;              /*元素宽度*/
   border:1px solid #ccc;  /*边框*/
   box-shadow:0 0 8px #ccc;/*阴影*/
   margin:4px 0;
   padding:2px;
   display:flex;           /*子元素弹性布局*/
   flex-direction:column;  /*排列方式:垂直*/
   min-height:210px;       /*最小高度*/
   justify-content:space-between;/*子元素两端对齐*/
 }
 .app-goodslist .goods-item h3{
   font-size:18px;
 }
 .app-goodslist .goods-item img{
   width:100%;
 }
 /*商品价格*/
 .app-goodslist .goods-item .now{
   color:red;
   font-weight:bold;
   font-size:16px;
 }
 .app-goodslist .goods-item .old{
   font-size:12px;
   text-decoration:line-through;
 }
</style>