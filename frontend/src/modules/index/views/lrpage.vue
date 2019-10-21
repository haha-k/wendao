
<template>
<div class="lrpage">
<el-card class="box-card">

<el-tabs v-model="activeName" type="border-card" @tab-click="handleClick">
    <el-tab-pane label="注册" name="register">注册</el-tab-pane>
    <el-tab-pane label="登录" name="login">登录</el-tab-pane>
  </el-tabs>
</el-card>


</div>
</template>
<script>
export default {
  name: 'lrpage',
  data(){
    return{

    }
  },
  method(){

  },
  mounted(){

  },
  components: {

  }
}
</script>
<style lang="scss" scoped>
.lrpage {
  .box-card {
    width: 480px;
  }
}
</style>
