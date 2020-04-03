<template>
  <div class="home">
    <el-container>
      <el-header style="height:52px;">
        <Navbar :active="'home'"></Navbar>
      </el-header>
      <el-main class="Topstory-container" style="margin-top: 62px;">
        <topStory></topStory>
        <globalSidebar ref="globalSidebar" @scroll="handleScroll" :class="{'is-fixed':true}"></globalSidebar>
      </el-main>
      <div></div>
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
import topStory from "@/components/global/topStory";
import { debounce } from "#/utils/common.js";
export default {
  name: "home",
  data() {
    return {
      isFixed: false
    };
  },
  methods: {
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
    }
  },

  mounted() {
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
    topStory: topStory,
    globalSidebar: globalSidebar
  }
};
</script>

<style lang="scss">
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
