<template>
  <div class="later">
    <el-container>
      <el-header style="height:52px">
        <Navbar :active="'home'"></Navbar>
      </el-header>
      <el-main class="later-container">
        <el-card class="mainColumn" :body-style="{ padding: '0px' }">
          <div slot="header" class="title">
            <i class="el-icon-thirdlishi1"></i>
            我的稍后答
            <div class="number">{{1}}</div>
          </div>
          <div class="questions">
            <later-card v-for="i in 10" :key="i"></later-card>
          </div>
        </el-card>
        <globalSidebar></globalSidebar>
      </el-main>
      <div></div>
    </el-container>
  </div>
</template>
<script>
import Navbar from "@/components/global/Navbar";
import globalSidebar from "@/components/global/globalSidebar";
export default {
  name: "later",
  data() {
    return {};
  },
  methods: {},
  mounted() {},
  components: {
    Navbar: Navbar,
    globalSidebar: globalSidebar
  }
};
</script>
<style lang="scss" scoped>
@import "@/styles/index.scss";
</style>
<style lang="scss" scoped>
.later-container {
  display: flex;
  margin: 10px auto;
  width: 1000px;
  .mainColumn{
    width: 694px;
    margin-right: 10px;
    align-self: flex-start;
    .title{
      padding: 0;
      display: flex;
      align-items: center;
      font-weight: 500;
      height: 68px;
      padding: 0 20px;
      border-bottom: 1px solid #f6f6f6;
      font-size:19px;
    }

  }
}
</style>
