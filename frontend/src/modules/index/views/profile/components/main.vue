<template>
  <div class="main-container">
    <div class="main-column">
      <el-card>
        <el-tabs v-model="activeName" @tab-click="handleClick">
          <el-tab-pane name="动态">
            <span slot="label">动态</span>
            <app-main :tab="activeName"></app-main>
          </el-tab-pane>
          <el-tab-pane name="回答">
            <span slot="label">回答{{1}}</span>
            <app-main :tab="activeName"></app-main>
          </el-tab-pane>
          <el-tab-pane name="提问">
            <span slot="label">提问{{1}}</span>
            <app-main :tab="activeName"></app-main>
          </el-tab-pane>
          <el-tab-pane name="文章">
            <span slot="label">文章{{1}}</span>
            <app-main :tab="activeName"></app-main>
          </el-tab-pane>
          <el-tab-pane name="专栏">
            <span slot="label">专栏{{1}}</span>
            <app-main :tab="activeName"></app-main>
          </el-tab-pane>
          <el-tab-pane name="6">
            <span slot="label">
              更多
              <i class></i>
            </span>
          </el-tab-pane>
        </el-tabs>
      </el-card>
    </div>
    <div class="side-column">
      <achievement-card></achievement-card>
      <FollowShip-card></FollowShip-card>
      <light-list></light-list>
    </div>
  </div>
</template> <script>
import AppMain from "./Appmain";
export default {
  name: "ProfileMain",
  data() {
    return {
      activeName: "动态"
    };
  },
  methods: {
    handleClick() {}
  },
  mounted() {},
  components: {
    AppMain: AppMain
  },
  watch: {
    me: {
      handler: function(newVal, oldVale) {
        this.profile = newVal;
        this.avatar = newVal.avatar_url;
      },
      deep: true
    }
  },
  props: {
    me: Object
  }
};
</script>
<style lang="scss" scoped>
.main-container {
  display: flex;
  width: 1000px;
  min-height: 100vh;
  padding: 0 16px;
  margin: 10px auto;
  justify-content: space-between;
  align-items: flex-start;
  .main-column {
    width: 694px;
  }
  .side-column {
    width: 296px;
    color: #646464;
  }
  .el-card {
  }
}
</style>
<style scoped>
.main-container >>> .el-card__body {
  padding: 0 !important;
}
.main-container >>> .el-tabs__item {
  padding: 0 20px !important;
  font-weight: 600;
  font-size: 16px;
  color: #1a1a1a;
  text-align: center;
}
</style>