<template>
  <el-breadcrumb class="app-breadcrumb" separator="/">
    <transition-group name="breadcrumb">
      <el-breadcrumb-item v-for="(item,index) in levelList" :key="item.path">
        <span v-if="item.redirect==='noRedirect'||index==levelList.length-1"></span>
        <a v-else @click.prevent="handleLink(item)">{{item.meta.title}}</a>
      </el-breadcrumb-item>
    </transition-group>
  </el-breadcrumb>
</template>
<script>
// import pathToRegexp from 'path-to-regexp'

export default {
  name: 'Breadcrumb',
  data(){
    return{
      levelList:null
    }
  },
  methods:{
    getBreadcrumb(){
      let matched = this.$route.matched.filter(item => item.meta && item.meta.title);
      const first = matched[0];

      if (!this.isDashboard(first)){
        matched = [{path:'/home',meta:{title:'Home'}}]
      }

      this.levelList = matched.filter(item => item.meta && item.meta.title)
    },
    isDashboard(route) {
      const name = route && route.name;
      if(!name) {
        return false;
      }
      return name.trim().toLocaleLowerCase()==='Home'.toLocaleLowerCase()
    }
  },
  mounted(){

  },
  components: {

  },
  watch: {
    $route(route) {
      // if(route.path.startsWith('/redirect/')){
      //   return;
      // }
    }
  }
}
</script>
<style lang="scss" scoped>
.Breadcrumb {
}
</style>
