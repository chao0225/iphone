<template> 
    <div class="app-register">
        <mt-header fixed title="注册">
        </mt-header>

        <div class="mui-card">
            <div class="mui-card-header">
                <div class="mui-input-row">
                    <label>账号</label>
                    <input id='account' type="text" class="mui-input-clear mui-input" placeholder="请输入账号">
                </div>
            </div>
            <div class="mui-card-header">
                <div class="mui-input-row">
                    <label>密码</label>
                    <input id='password' type="password" class="mui-input-clear mui-input" placeholder="请输入密码">
                </div>
            </div>
            <div class="mui-card-header">
                <div class="mui-input-row">
                    <label>确认</label>
                    <input id='password_confirm' type="password" class="mui-input-clear mui-input" placeholder="请确认密码">
                </div>
            </div>
            <div class="mui-card-header">
                <div class="mui-content-padded">
                    <button id='reg' class="mui-btn mui-btn-block mui-btn-primary">注册</button>
                </div>
            </div>
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
    .mui-content-padded{
    width:100%;
}
</style>

