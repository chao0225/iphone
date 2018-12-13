<template> 
    <div class="app-cart">
     <mt-header fixed title="购物车">
        </mt-header>
        <div class="mui-card">
           
            <div class="mui-card-content">
                <div class="mui-card-content-inner">
                   <ul class="mui-table-view">
                        <li class="mui-table-view-cell mui-media" v-for="item in list" :key="item.iid">
                        <a href="javascript:;">
                            <img class="mui-media-object mui-pull-left" :src="item.img">
                            <div class="mui-media-body">
                                {{item.lname}}
                            <p class='mui-ellipsis'>
                                <span class="price">{{item.price}}</span>
                                <span class="count">
                            <div class="mui-numbox">
                                <button class="mui-btn mui-btn-numbox-minus" type="button" @click="cartSub" :data-iid="item.iid">-</button>
                                <input class="mui-input-numbox" type="number" :value="item.count" />
                                <button class="mui-btn mui-btn-numbox-plus" type="button" @click="cartAdd" :data-iid="item.iid">+</button>
                            </div>
                            </span>
                            </p>
                            </div>
                        </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="mui-card-footer">合计：{{getSubTotal}}</div>
        </div>
    </div>
</template>
<script>
import {Toast} from "mint-ui"
    export default {
        created(){
            this.getMore();
        },
        data(){
            return{
                list:[]
            }
        },
        methods:{
           updateCart(iid,count){
               var url="http://127.0.0.1:3333/updateCart?iid="+iid+"&count="+count;
               this.axios.get(url).then(result=>{
                   if(result.data.code==1){
                       Toast(result.data.msg);
                   }else{
                       Toast(result.data.msg);
                   }
                })
           },
           getMore(){
               var url="http://127.0.0.1:3333/getCarts?uid=3";
               this.axios.get(url).then(result=>{
                   this.list=result.data.data;
               })
           },
           cartSub(e){
               var iid=e.target.dataset.iid;
               console.log(iid+"-");
                // 修改当前购物车项数量
                //1:创建循环list  
                for(var item of this.list){
                 //2判断当前元素iid是否是 iid
                 if(item.iid==iid && item.count>1){
                    // 3当前数据减1
                    item.count--;
                    this.updateCart(iid,item.count);
                    //4 跳出循环
                    break;                
                }
                // 5 更新数据库值减1
                }
           },
           cartAdd(e){
               var iid=e.target.dataset.iid;
               console.log(iid+"+");
               // 修改当前购物车项数量
                //1:创建循环list  
                for(var item of this.list){
                 //2判断当前元素iid是否是 iid
                 if(item.iid==iid && item.count<1000){
                    // 3当前数据减1
                    item.count++;
                    this.updateCart(iid,item.count);
                    //4 跳出循环
                    break;                
                }
                // 5 更新数据库值减1
                }
           },
        },
        computed:{
            getSubTotal:function(){
                // 计算购物车内所有商品价格 累加和
                    var sum =0;
                    for(var item of this.list){
                        sum+=item.price * item.count;
                    }
                    return sum;
            }
        }
    }
</script>
<style scoped>
     .mui-card{
             margin:0;
         }
</style>

