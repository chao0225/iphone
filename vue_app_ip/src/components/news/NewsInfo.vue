<template> 
    <div class="app-newsinfo">
        <h4>{{info.title}}</h4>
        <textarea>
        {{info.content}}
        </textarea>
        <h5>{{info.ctime | datatimeFilter}}</h5>
        <h5>点击 {{info.point}} 次数</h5>

        <!--新闻评论子组件-->
        <comment-box :id="this.id"></comment-box>
    </div>
</template>
<script>
        import comment from "../sub/comment"
            export default {
                created(){
                this.getNewsInfo();
                },
                data(){
                    return{
                        id:this.$route.query.id,
                        info:{

                        }
                    }
                },
                methods:{
                    getNewsInfo(){
                        var id=this.$route.query.id;
                        this.$http.get("NewsInfo?id="+id)
                        .then(result=>{
                        // console.log(result.body.data[0]);
                            this.info=result.body.data[0];
                        })
                    }
                },
                components:{
                    "comment-box":comment
                }
            }
</script>
<style scoped>
    .app-newsinfo textarea{
        height:530px;
    }
     .app-newsinfo h4{
       margin:20px 10px;
    }
</style>

