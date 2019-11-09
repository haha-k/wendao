<template>
<div class="ArticleList">
  <el-card :body-style="{ padding: '0px' }">
    <div slot="header">
      <span>最新文章</span>
    </div>

  </el-card>

</div>
</template>
<script>
export default {
  name: 'ArticleList',
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
.ArticleList {
  display: block;
  width:690px;
  margin: 12px auto;
  border-radius: 2px;
  color: #1a1a1a;
  text-align: left;
  // box-shadow: hoff voff blur #000;
}
</style>
