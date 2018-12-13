<template>
 <div class="app-container">
        <!--导航栏-->
        <mt-header fixed title="iphone专卖店"></mt-header>
        <!--
        <header class="mui-bar mui-bar-nav">
			<a class="mui-action-back mui-icon mui-icon-left-nav mui-pull-left"></a>
			<h1 class="mui-title">学子商城</h1>
		</header>-->
        <!--router-view-->
            <router-view>
            
            </router-view>
        <!--tabbar-->

        <nav class="mui-bar mui-bar-tab">
            <router-link class="mui-tab-item mui-active" to="/Home">
                <span class="mui-icon mui-icon-home"></span>
                <span class="mui-tab-label">首页</span>
            </router-link>
            <router-link class="mui-tab-item mui-active" to="/Login">
                <span class="mui-icon mui-icon-contact"></span>
                <span class="mui-tab-label">会员</span>
            </router-link>
            <router-link class="mui-tab-item" to="/Cart">
                <span class="mui-icon mui-icon-extra mui-icon-extra-cart"><span class="mui-badge">{{$store.getters.optCartCount}}</span></span>
                <span class="mui-tab-label">购物车</span>
            </router-link>
            <router-link class="mui-tab-item" to="/Search">
                <span class="mui-icon mui-icon-search"></span>
                <span class="mui-tab-label">搜索</span>
            </router-link>
        </nav>
       <!---->
    
    
 </div>
</template>

<style>
        .app-container{
            padding-top:40px;
            padding-bottom:50px;
            overflow-x:hidden;
        }

        .mui-bar-tab .mui-tab-item-tao.mui-active {
            color: #007aff;
        }
        .mui-bar-tab .mui-tab-item-tao {
            display: table-cell;
            overflow: hidden;
            width: 1%;
            height: 50px;
            text-align: center;
            vertical-align: middle;
            white-space: nowrap;
            text-overflow: ellipsis;
            color: #929292;
        }
        .mui-bar-tab .mui-tab-item-tao .mui-icon {
            top: 3px;
            width: 24px;
            height: 24px;
            padding-top: 0;
            padding-bottom: 0;
        }

        .mui-bar-tab .mui-tab-item-tao .mui-icon~.mui-tab-label {
        font-size:11px;
        display:block;
        overflow:hidden;
        text-overflow:ellipsis;

        }


        
        .mint-header-button.is-left{
            height:40px;
        }

        .mui-bar.mui-bar-nav{
           background:#26A2FF;
           height:40px;
          
        }
        .mui-bar .mui-title,.mui-bar-nav.mui-bar .mui-icon{
            color:#fff; 
            
        }
         .mui-bar .mui-title{
            font-size:15px;
         }
         .mui-card{
             margin:0;
         }
</style>
