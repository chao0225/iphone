<template> 
    <div class="app-buttonnb">
        <button type="button" class="mui-btn mui-btn-success">Badge button 
            <span class="mui-badge mui-badge-success">12</span>
        </button>
        <span class="mui-btn mui-btn-success">
            绿色
        </span>
        <button type="button" class="mui-btn mui-btn-success mui-btn-block">Block button</button>
        <!--搜索 添加 删除 返回 按钮-->
        <button type="button" class="mui-btn mui-btn-primary mui-icon mui-icon-search">
            搜索
        </button>
        <button type="button" class="mui-btn mui-btn-success mui-icon mui-icon-plus">添加</button>
        <button type="button" class="mui-btn mui-btn-danger mui-btn-outlined">
            <span class="mui-icon mui-icon-trash"></span>
            删除	
        </button>
        <button type="button" class="mui-btn mui-btn-link">
            <span class="mui-icon mui-icon-back"></span>
            返回
        </button>
        <button type="button" class="mui-btn mui-btn-link">
            下一步
            <span class="mui-icon mui-icon-forward"></span>
        </button>

        <!--卡片-->
        <div class="mui-card">
        <div class="mui-card-header">页眉</div>
        <div class="mui-card-content">
            <div class="mui-card-content-inner">
                包含页眉页脚的卡片，页眉常用来显示面板标题，页脚用来显示额外信息或支持的操作（比如点赞、评论等）
            </div>
        </div>
        <div class="mui-card-footer">页脚</div>
        </div>


         <!--九宫格-->
        <div class="mui-content">
                <ul class="mui-table-view mui-grid-view mui-grid-9">
                    <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
                            <span class="mui-icon mui-icon-home"></span>
                            <div class="mui-media-body">Home</div></a>
                    </li> 
                    <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
                            <span class="mui-icon mui-icon-email"><span class="mui-badge">5</span></span>
                            <div class="mui-media-body">Email</div></a>
                    </li>
                    <li class="mui-table-view-cell mui-media mui-col-xs-4 mui-col-sm-3"><a href="#">
                            <span class="mui-icon mui-icon-chatbubble"></span>
                            <div class="mui-media-body">Chat</div></a>
                    </li>
                </ul> 
        </div>


    </div>
</template>
<script>
    export default {
        created(){
          
        },
        data(){
            return{

            }
        },
        methods:{
           
        },
    }

        
</script>
<style scoped>
    .mui-btn{
        margin:10px;
    }
</style>

