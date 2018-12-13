<template>
 <div class="app-goodsinfo">
    <!--轮播图卡片-->
    <div class="mui-card">
      <div class="mui-card-content">
        <div class="mui-card-content-inner">
          <swipe-box :list="list"></swipe-box>
        </div>
      </div>
    </div>
    <!--商品信息-->   
    <div class="mui-card" id="xiqi">
				<div class="mui-card-header">
            商品名称
				</div>
        <div class="mui-card-content">
					<div class="mui-card-content-inner">
						<p class="price">
              市场价：<del>2999.00</del>
              销售价：<span class="now">2111.00</span>
            </p>
            购买数量：
            <div class="mui-numbox">
              <button class="mui-btn mui-btn-numbox-minus" type="button" @click="goodSub">-</button>
              <input class="mui-input-numbox" type="number" value="1" v-model="val"/>
              <button class="mui-btn mui-btn-numbox-plus" type="button" @click="goodAdd">+</button>
            </div>  
					</div>
        </div>
        <div class="mui-card-footer">
          <mt-button type="primary" size="small">立即购买</mt-button>
          <mt-button type="danger" size="small" @click="addCart">加入购物车</mt-button>
        </div>
			</div>
    <!--商品参数-->     
 </div>
</template>
<script>
// 引入轮播的子组件
import swipe from "../sub/swipe.vue"
import {Toast} from "mint-ui"
  export default {
    created() {
      //console.log(this.$route.params.id);
      this.getImages();
    },
     data(){
       return {
         list:[],
         nid:this.$route.params.id,
         val:1
       }
     },
     methods:{
       getImages(){
          var url=`http://127.0.0.1:3333/imagelist`;
          this.axios.get(url).then(result=>{
              this.list=result.data;
          })
       },
       goodSub(){
         if(this.val>1)
         this.val--;
       },
       goodAdd(){
        if(this.val<1000)
        this.val++;
       },
       addCart(){
        // console.log(11111111111);
        //  获取参数   pid  count  uid
        var pid=this.nid;
        var count=this.val;
        var uid=3;
        var url="http://127.0.0.1:3333/addCart?pid="+pid+"&count="+count+"&uid="+uid;
       
          this.axios.get(url).then(result=>{
           // console.log(result);
             if(result.data.code==1){
                // 修改全局共享数据 cartCount
                  this.$store.commit("increment",count);            
                Toast("加入购物车成功！")
             }
             else
                Toast("加入失败！")
          })
       
       }
     },
     components:{
       "swipe-box":swipe
     }
  }

</script>
<style scoped>
 .app-goodsinfo .mui-card-content-inner{
      padding:0;
  }
  #xiqi{
    padding:0 15px;
  }
  .app-goodsinfo .mui-card{
    margin-bottom:10px;
  }
  .app-goodsinfo .now{
    color:red;
  }
</style>