<template>
    <div>
        <h1>数据列表</h1>
        <ul>
            <!--:key=""   v-for 循环对数据排序，key 条件-->
            <!--key 条件，不重复  提升排序效率-->
            <li v-for="item in list" :key="item.uid">
                {{item.uid}}:{{item.name}}
            </li>
        </ul>
    </div>
</template>
<script>
    export default {
        data(){
            return{
                list:[
                    {uid:1,name:"tom"},
                    {uid:2,name:"tom11"},
                    {uid:3,name:"tom22"},
                ]
            }
        }
    }
</script>
<style scoped>
    
</style>









