<template> 
    <div class="app-comment">
        <h1>子组件</h1>
        <!--发表评论区域-->
        <textarea placeholder="请吐槽最多120个字" maxlength="120" v-model="msg"></textarea>
        <mt-button size="large" @click="postComment">发表评论</mt-button>
        <!--显示评论区域-->
        <div class="cmt-list">
            <div class="cmt-item" v-for="(item,i) in list " :key="item.id">
                <div class="cmt-info">
                    第 {{i+1}} 楼：用户名：{{item.user_name}}<br>
                    发表时间：{{item.ctime | datatimeFilter}}
                    <div class="cmt-body">{{item.content}}</div>
                </div>
            </div>
        </div>
        <mt-button type="primary" size="large" @click="getMore">加载更多</mt-button>
    </div>
</template>
<script>
    //  单独引入mint-ui  组件Toast 其他组件不用
     import {Toast} from "mint-ui";
     // 如果在当前组件使用，可以省略
    export default {
        created(){
            this.getMore();
        },
        data(){
            return{
                list:[],         //显示数据列表
                pno:0,          //当前页码
                pageSize:7,    //页大小
                pageCount:1,  //总页数
                msg:"",      //评论内容双向绑定
            
            }
        },
        props:["id"],
        methods:{
            postComment(){
               //1:获取用户输入的内容，新闻编号，用户名
               var msg=this.msg;  //内容
               var nid=this.id;  //父元素传递新闻编号
               //var user_name="匿名";
               //console.log(msg+":"+nid+":"+user_name);
               //2:判断如果输入内容为空
               var size=msg.trim().length;
               //3:提示评论内容不能为空
               if(size==0){
                   Toast("评论内容不能为空");
                    return;     // 停止函数执行  
               }
            //    //4:发送post请求
            //    var url="addComment";
            //    var obj={nid:nid,user_name:user_name,content:msg};
            //    //5:提示发送成功
            //    this.$http.post(url,obj).then(result=>{
            //        console.log(result);
            //         var obj=result.body;
            //         if(obj.code==1){
            //         Toast("评论发表成功");
            //         //7:显示最新一页数据
            //         this.pno =  0;
            //         this.list = [];
            //         this.getMore();
            //         }
            //         else
            //         Toast("评论发表失败");    
            //    })
            //   不用VueResource  了  用  axios  兼容性好

                var url="http://127.0.0.1:3333/addComment";
                //  传参数
                var param=`nid=${nid}&content=${msg}`;
                this.axios.post(url,param).then(result=>{
                    console.log(result);
                   if(result.data.code==1){
                        Toast("评论发表成功");
                        console.log("ok!");
                        //7:显示最新一页数据
                        this.pno =  0;
                        this.list = [];
                        this.getMore();
                    }
                    else
                        Toast("评论发表失败");
                })
                 this.msg="";
            },
           getMore(){
               var nid=this.id;             //新闻id
               this.pno++;                 //页码自增  初始0
               var pno =this.pno;           //当前页码
               var pageSize=this.pageSize;  //页大小
               var url="getcomment?pno="+pno;
                   url+="&nid="+nid+"&pageSize="+pageSize;
               this.$http.get(url).then(result=>{
                   //console.log(result.body);
                   var rows=this.list.concat(result.body.data);
                   this.list=rows;
               });

           }
        },
    }
</script>
<style scoped>
    .app-comment h1{
        font-size:18px;
    }
    .app-comment textarea{
        font-size:14px;
        height:68px;
        margin:0;
    }
    .app-comment .cmt-list{
        margin:10px;
    }
     .app-comment .cmt-list .cmt-item{
         border-radius:5px;
        padding:10px;
        background: linear-gradient(to bottom,#f0f0f0, #B5DBFF);
    }
    .app-comment .cmt-list .cmt-info{
        line-height:30px;
        
    }
</style>

