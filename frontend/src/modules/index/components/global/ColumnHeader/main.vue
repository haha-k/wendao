<template>
<el-card class="column-header" :body-style="{ padding: '0px' }">
  <div class="inner">
    <h1 class="title">fdjsklfjkkkkkkkkkkkkkkkkk</h1>
    <p class="desc"></p>
    <div class="about"></div>
    <span class="voters"></span>
    <el-img class="image"></el-img>
    <div class="buttonGroup"></div>
  </div>
</el-card>
</template>
<script>
export default {
  name: 'ColumnHeader',
  data(){
    return{

    }
  },
  methods:{

  },
  mounted(){

  },
  components: {

  }
}
</script>
<style lang="scss" scoped>
.column-header {
  background-color: #fff;
  color:#1a1a1a;
  padding:20px 0 16px;

  .inner {
    box-sizing:border-box;
    padding-right: 140px;
    position:relative;
    width:690px;
    margin:0 auto;
    min-height:124px;
  }
}
</style>
