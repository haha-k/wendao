<template>
  <div
    class="home"
    style="overflow-y:scroll; height:100%"
    v-infinite-scroll="getRecommendList"
    infinite-scroll-disabled="disabled"
    infinite-scroll-delay="500"
    infinite-scroll-distance="30"
  >
    <el-container>
      <el-header style="height:52px;">
        <Navbar :active="'home'"></Navbar>
      </el-header>
      <el-main class="Topstory-container" style="margin-top:62px">
        <div class="topStory">
          <el-card>
            <el-tabs v-model="activeName" @tab-click="handleClick">
              <el-tab-pane label="推荐" name="first">
                <recommend-content
                  :recommendList="recommendList"
                ></recommend-content>
                <div class="loading"></div>
              </el-tab-pane>
              <el-tab-pane label="关注" name="second">关注</el-tab-pane>
              <el-tab-pane label="热榜" name="third">热榜</el-tab-pane>
            </el-tabs>
          </el-card>
        </div>
        <globalSidebar
          ref="globalSidebar"
          @scroll="handleScroll"
          :class="{ 'is-fixed': true }"
        ></globalSidebar>
      </el-main>
      <div v-if="loading">加载中...</div>
    </el-container>
  </div>
</template>

<style lang="scss" scoped>
@import "@/styles/index.scss";
</style>

<script>
// @ is an alias to /src
import Navbar from "@/components/global/Navbar";
import globalSidebar from "@/components/global/globalSidebar";
import recommendContent from "./components/recommendContent";
import { debounce } from "#/utils/common.js";
import { getRecommend } from "#/api/home";

export default {
  name: "home",
  data() {
    return {
      isFixed: false,
      loading: false,
      recommendList: [],
      activeName: "first"
    };
  },
  computed: {
    noMore() {
      return false;
    },
    disabled() {
      return this.loading || this.noMore;
    }
  },
  methods: {
    handleClick(tab, event) {
      //TODOconsole.log(tab, event);
    },
    handleScroll(e) {
      var scrollTop =
        window.pageYOffset ||
        document.documentElement.scrollTop ||
        document.body.scrollTop;
      let el = this.$refs["globalSidebar"].$el;
      // var offsetTop = document.querySelector("#searchBar").offsetTop;
      // if (scrollTop <= 200) {
      //   offsetTop = 300 - Number(scrollTop);

      // } else {
      // }
      // console.warn(scrollTop, el.offsetTop);

      // 待优化
      // if (scrollTop >= 62) {
      //   this.isFixed = true;
      // } else {
      //   this.isFixed = false;
      // }
    },

    getRecommendList() {
      this.loading = true;
      getRecommend()
        .then(result => {
          let { data } = result.data;
          // this.recommendList.push.apply(this.recommendList, data);
          this.recommendList = this.recommendList.concat(data);
          console.warn(this.recommendList);
          this.loading = false;
          // if(isLoading){
          //   this.recommendList = data.data;
          // }
          // else{
          //   this.recommendList .add(data.data);
          // }
        })
        .catch(err => {
          console.log(err);
        });
    }
  },
  mounted() {
    this.getRecommendList();
    // window.addEventListener("scroll", debounce(this.handleScroll, 500));
    // 待优化
    // window.addEventListener("scroll", this.handleScroll, 500);
  },
  destroyed() {
    // window.removeEventListener("scroll", debounce(this.handleScroll, 500));
    // 待优化
    // window.removeEventListener("scroll", this.handleScroll, 500);
  },
  components: {
    Navbar: Navbar,
    globalSidebar: globalSidebar,
    recommendContent: recommendContent
  }
};
</script>

<style lang="scss">
.loading {
  height: 100px;
}
.topStory {
  flex-shrink: 0;
  margin-right: 10px;
  margin-bottom: 0;
  width: 694px;

  .el-tabs {
    font-size: 14px;
    font-weight: 600;
  }
}
.globalSidebar {
  &.is-fixed {
    position: fixed;
    // top: -133px;
    top: 62px;
    // transform: translateY(62px);
    transform: translateX(704px);
    // left: 704px;
    transition: top 0.4s;
  }
}
</style>
