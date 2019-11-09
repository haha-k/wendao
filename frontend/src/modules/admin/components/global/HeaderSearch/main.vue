<template>
  <div :class="{'show':show}" class="header-search" @click.stop="click">
    <svg-icon class="search-icon" icon-class="search" />
    <el-select
      ref="headerSearchSelect"
      v-model="search"
      :remote-method="querySearch"
      filterable
      remote
      default-first-option
      class="header-search-select"
      placeholder="???"
      @change="change"

    >
      <el-option
        v-for="item in options"
        :key="item.path"
        :value="item"
        :label="item.title.join(' > ')"
      ></el-option>
    </el-select>
  </div>
</template>
<script>
import Fuse from "fuse.js";
import path from "path";

export default {
  name: "HeaderSearch",
  data() {
    return {
      search: "",
      options: [],
      searchPool: [],
      show: false,
    }
  },
  methods: {
    clickxx: function(){
      console.log('xx');
    },
    click() {
      console.log("xxx");
      this.show = !this.show;
      if (this.show) {
        this.$refs.headerSearchSelect && this.$refs.headerSearchSelect.focus();
      }
    },
    close(){
      // console.log("kai");
      this.$refs.headerSearchSelect && this.$refs.headerSearchSelect.focus();
      this.options = [];
      this.show = false;
    },
    change(val){
      this.$router.push(val.path);
      this.search = '';
      this.options = [];
      this.$nextTick(()=>{
        this.show = false;
      });
    },
    querySearch(){

    },
    generateRoutes(routes,basePath = '/',prefixTitle = []){
      let res = [];

      for(const router of routes){
        // console.log('aaa');
        // console.log(router);
        if(router.hidden){
          continue;
        }

        const data = {
          path: path.resolve(basePath,router.path),
          title: [...prefixTitle]
        }

        if(router.meta && router.meta.title){
          data.title = [...data.title,router.meta.title];

          if(router.redirect !== 'noRedirect'){
            res.push(data);
          }
        }

        if(router.children){
          const tempRoutes = this.generateRoutes(router.children,data.path,data.title)
          if(tempRoutes.length >= 1){
            res = [...res,...tempRoutes];
          }
        }
      }
      // console.log(res);
      return res;
    },
  },
  mounted() {
    this.searchPool = this.generateRoutes(this.routes);
  },
  components: {},
  computed: {
    routes() {
      return this.$store.getters.permission_routes;
    }
  },
  watch:{
    show(value) {
      if(value){
        document.body.addEventListener('click',this.close);
      }else{
        document.body.removeEventListener('click',this.close);
      }
    }
  },
};
</script>


<style lang="scss" scoped>
.header-search {
  // font-size: 2px !important;

  .search-icon {
    cursor: pointer;
    font-size: 18px;
    vertical-align: middle;
  }

  .header-search-select {
    font-size: 18px;
    transition: width 0.2s;
    width: 0;
    overflow: hidden;
    background: transparent;
    border-radius: 0;
    display: inline-block;
    vertical-align: middle;


  }



  &.show {
    .header-search-select {
      width: 210px;
      margin-left: 10px;
    }
  }
}
</style>

<style scoped>
.header-search >>> .el-select .el-input__inner {
      border-radius: 0;
      border: 0;
      padding-left: 0;
      padding-right: 0;
      box-shadow: none !important;
      border-bottom: 1px solid #d9d9d9;
      vertical-align: middle;
}
</style>