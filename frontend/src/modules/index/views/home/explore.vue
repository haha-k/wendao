<template>
  <div class="explore-container">
    <el-container>
      <el-header style="height:52px">
        <Navbar :active="'explore'"></Navbar>
      </el-header>
      <el-main class="App-main">
        <div class="ExploreHomePage">
          <div class="ContentSection">
            <div class="header">
              <i class="el-icon-thirdshoucang1"></i>
              <span>热门收藏夹</span>
            </div>
            <div class="body">
              <div class="collections">
                <collection-card v-for="i in 4" :key="i"></collection-card>
              </div>
            </div>
            <div class="moreButton">
              <router-link to="/" class="more">
                查看更多收藏夹
                <i class="el-icon-thirdxiangshangjiantouarrowup1"></i>
              </router-link>
            </div>
          </div>
          <div class="ContentSection">
            <div class="header">
              <i class="el-icon-thirdshoucang1"></i>
              <span>专栏</span>
            </div>
            <div class="body">
              <div class="columns">
                <column-card v-for="i in 4" :key="i"></column-card>
              </div>
            </div>
            <div class="moreButton">
              <router-link to="/" class="more">
                查看更多专栏
                <i class="el-icon-thirdxiangshangjiantouarrowup1"></i>
              </router-link>
            </div>
          </div>
        </div>
      </el-main>
    </el-container>
  </div>
</template>
<script>
import Navbar from "@/components/global/Navbar";
export default {
  name: "explore",
  data() {
    return {};
  },
  methods: {},
  mounted() {},
  components: {
    Navbar: Navbar
  }
};
</script>
<style lang="scss" scoped>
@import "@/styles/index.scss";
</style>
<style lang="scss" scoped>
.explore-container {
  .ExploreHomePage {
    margin: 32px auto 107px;
    width: 1000px;
    .ContentSection {
      .header {
        display: flex;
        align-items: center;
        height: 36px;

        span {
          margin-left: 12px;
          font-size: 25px;
          font-weight: 600;
        }
      }
      .body {
        padding: 24px 0 20px;
        .collections {
          display: flex;
          justify-content: space-between;
          flex-wrap: wrap;
          align-content: space-between;
          height: 748px;
        }
        .columns {
          display: flex;
          justify-content: space-between;

        }
      }
    }
    .moreButton {
      display: flex;
      justify-content: center;
      .more {
        display: flex;
        align-items: center;
        height: 48px;
        background-color: #fff;
        padding: 0 14px 0 24px;
        color: #8590a6;
        border-radius: 25px;
      }
    }
  }
}
</style>
