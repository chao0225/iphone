<template>
  <div class="app-newlist">
   <ul class="mui-table-view">
        <li class="mui-table-view-cell mui-media" v-for="item in list " :key="item.id">
            <div class="mui-card">
				<router-link :to="'/newsinfo?id='+item.id">
                    <img  :src="item.img_url">
                </router-link>
				<div class="mui-card-content">
					<div class="mui-card-content-inner">
						<p>{{item.ctime | datatimeFilter}}</p>
						<p style="color: #333;">{{item.title}}</p>
					</div>
				</div>
				<div class="mui-card-footer">
					<a class="mui-card-link">点击:{{item.point}} 次</a>
					<router-link :to="'/newsinfo?id='+item.id" class="mui-card-link">查看全部</router-link>
				</div>
			</div>
        </li>
     </ul>
     <mt-button type="primary" size="large" @click="getMore">加载更多</mt-button>
  </div>  
</template>
<script>
 export default {
   created(){
       this.getMore();
   },
   methods:{
       getMore(){
           this.pno++;
             var hasMore=this.pno<=this.pageCount;
               if(!hasMore){ return }
            var url="newslist?pno="+this.pno+"&pageSize="+this.pageSize;
           this.$http.get(url).then(result=>{
               //this.list=result.body.data;
             
                var rows=this.list.concat(result.body.data);
                this.list=rows;
                this.pageCount=result.body.pageCount;
              
           })
       }
   },
   data(){
     return {
         list:[],         //显示数据列表
         pno:0,          //当前页码
         pageSize:7,    //页大小
         pageCount:1,  //总页数
     }
   }
 }
</script>
<style>


 .mui-table-view .mui-media-body .mui-ellipsis{
     display:flex;
     font-size:13px;
     color:#226aff;
     justify-content:space-between;
 }
   .mui-table-view .mui-table-view-cell{
    padding:14px;
}
.app-newlist ul li img {
    width: 347px;
    height: 150px;
}

.app-newlist .mui-card{
        margin:0px;
}
.app-newlist .mui-card-content-inner{
    padding:0 10px 5px 10px;
}
</style>