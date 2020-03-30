<template>
  <div class="home">
    <el-container>
      <el-header style="height:52px;">
        <Navbar :active="'home'"></Navbar>
      </el-header>
      <el-main class="Topstory-container" style="margin-top: 62px;">
        <topStory></topStory>
        <globalSidebar ref="globalSidebar" @scroll="handleScroll" :class="{'is-fixed':isFixed}"></globalSidebar>
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
      console.warn(scrollTop, el.offsetTop);
      if (scrollTop >= 193) {
        this.isFixed = true;
      } else {
        this.isFixed = false;
      }
    }
  },

  mounted() {
    window.addEventListener("scroll", this.handleScroll);
  },
  destroyed() {
    window.removeEventListener("scroll", this.handleScroll);
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
    left: 860px;
    top: -133px;
  }
}
</style>
