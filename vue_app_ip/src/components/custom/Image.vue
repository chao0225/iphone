
<template> 
    <div class="app-image">
       <ul class="mui-table-view mui-table-view-chevron">
            <li class="mui-table-view-cell mui-media">
                <a class="mui-navigate-right">
                    <img class="mui-media-object mui-pull-left" src="img/mm.png">
                    <div class="mui-media-body">
                        CBD
                        <p class='mui-ellipsis'>烤炉模式的城，到黄昏，如同打翻的调色盘一般.</p>
                    </div>
                </a>
            </li> 
        </ul>
    </div>

<!--
    <div class="mui-content">
        <header class="mui-bar mui-bar-nav">
            <a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
            <h1 class="mui-title">modal（弹出窗口）</h1>
        </header>
        <div class="mui-content">
            <a href="#modal" class="mui-btn mui-btn-primary mui-btn-block">Click</a>
        </div>
        <div id="modal" class="mui-modal">
            <header class="mui-bar mui-bar-nav">
                <a class="mui-icon mui-icon-close mui-pull-right" href="#modal"></a>
                <h1 class="mui-title">Modal</h1>
            </header>
            <div class="mui-content" style="height: 100%;">
                <p class="mui-content-padded">The contents of my modal go here. Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut.</p>
            </div>
        </div>
    </div>
-->
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
    .app-image .mui-table-view p {
    font-size: 14px;
    margin-top: 0;
    margin-bottom: 10px;
    color: #8f8f94;
}
</style>

