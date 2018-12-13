<template> 
    <div class="app-login">

         <mt-header fixed title="登录">
        </mt-header>
        <!--创建mui 卡片组件-->
        <div class="mui-card">
            <div class="mui-card-header">
                <div class="mui-input-row">
                    <label>账号</label>
                    <input id='account' type="text" class="mui-input-clear mui-input" placeholder="请输入账号"  value="" v-model="uname">
                </div>   
            </div>
             <div class="mui-card-header">
                <div class="mui-input-row">
                    <label>密码</label>
                    <input id='password' type="password" class="mui-input-clear mui-input" placeholder="请输入密码"  value="" v-model="upwd">
                </div>             
            </div>
            <div class="mui-card-footer">
                <div class="mui-content-padded">
                    <button id='login' type="button" class="mui-btn mui-btn-block mui-btn-primary"  @click="handleLogin" size="large">登录</button>
                    <div class="link-area">
                    <router-link id='reg' to="/Register">注册账号</router-link> 
                    <span class="spliter">|</span> <a id='forgetPassword'>忘记密码</a>
				    </div>
			    </div>
            </div>
        </div>
        <!--添加用户名密码提交按钮-->
        <!--为提交按钮绑定点击事件  获取用户名和密码验证-->
        <!--ajax-->
    </div>
</template>
<script>
import {Toast} from "mint-ui"
    export default {
        created(){
          
        },
        data(){
            return{
                uname:"",upwd:""
            }
        },
        methods:{
           handleLogin(){
                //1:获取参数
              var u=this.uname;
              var p=this.upwd;
                //2:正则表达式验证
                //3:发送请求
            //   var url="Login?uname="+u;
            //     url+="&upwd="+p

            //   this.$http.get(url).then(result=>{
            //       console.log(result.body);
            //       var obj=result.body;
            //       if(obj.code==-1){
            //           Toast(obj.msg);//登录失败提示
            //       }else{
            //           //登录成功跳转Home
            //           this.$router.push("/Home");
            //       }
            //   })


            //  换一种方式发送请求，兼容性好一些 axios
             var url="http://127.0.0.1:3333/Login?uname="+u+"&upwd="+p;
             this.axios.get(url).then(result=>{
                 //console.log(result);
                 if(result.data.code==1){
                     this.$router.push("/home");
                 }else{
                     Toast("用户名或密码错误")
                 }
             })
             
           }
        },
    }
</script>
<style scoped>
    .link-area {
    display: block;
    margin-top: 25px;
    text-align: center;
}

.mui-content-padded{
    width:100%;
}
.mui-btn-block{
    padding: 10px 0;
}
.spliter {
    color: #bbb;
    padding: 0px 8px;
}
</style>

