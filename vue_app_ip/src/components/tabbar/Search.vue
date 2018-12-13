<template> 
       
    <div class="app-search">
     <mt-header fixed title="搜索">
        </mt-header>
        <div class="mui-card">
            <div class="mui-card-header">
                <input type="text" name="keyword" v-model="keyword" placeholder="请输入你要搜索的内容" value="">
            </div>
            <div class="mui-card-header">
                <input type="number" name="low" v-model="low" placeholder="价格的下限">
            </div>
            <div class="mui-card-header">  
                <input type="number" name="high" v-model="high" placeholder="价格的下限">
            </div>
            <div class="mui-card-header">  
                <button type="button" class="mui-btn mui-btn-primary mui-icon mui-icon-search"  @click="handleSearch">
                    搜索
                </button>
            </div>
            <div class="mui-card-content">
                <div class="mui-card-content-inner">
                   <ul class="mui-table-view">
                        <li class="mui-table-view-cell mui-media" v-for="item of list" :key="item.lid">
                            <a href="javascript:;">
                                <img class="mui-media-object mui-pull-left" :src="item.img">
                                <div class="mui-media-body">
                                   {{item.lname}}
                                    <p class='mui-ellipsis'>{{item.price}}</p>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            </div>
            <div class="mui-card-footer">共 {{list.length}} 个商品</div>
        </div>
        
    </div>
</template>
<script>
    export default {
        created(){
         
        },
        data(){
            return{
                keyword:"",
                low:"",
                 high:"",
                list:[]
            }
        },
        methods:{
            handleSearch(){
                // 获取三个 参数
                var kw=this.keyword;
                var low=this.low;
                var high=this.high;
                if(high==""){
                    high=2100000000;
                }
                if(low==""){
                    low=0;
                }
                console.log(kw+"-"+low+"-"+high);
                // 关键词

                // 下限  0

                // 上限  2100000000
                var url="http://127.0.0.1:3333/search?keyword="+kw+"&low="+low+"&high="+high;
       
                    this.axios.get(url).then(result=>{
                         console.log(result);
                       this.list=result.data.data;
                    })

                // 发送 axios

            }
        },
    }
</script>
<style scoped>
      .mui-btn.mui-icon{
        padding:7px 100px;
        margin:auto;
        font-size:20px;
    }
    .mui-card{
             margin:0;
         }
    .app-search ul li img {
    width:  15px; 
    
}
.app-search .mui-table-view .mui-media-object.mui-pull-left{
  margin-right: 30px;
}
</style>

