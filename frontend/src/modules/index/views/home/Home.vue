<template>
  <div class="home">
    <el-container>
      <el-header style="height:52px;">
        <Navbar :active="'home'"></Navbar>
      </el-header>
      <el-main class="Topstory-container">
        <topStory></topStory>
        <globalSidebar></globalSidebar>
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
  // mounted() {
  //   window.addEventListener("scroll", this.handleScroll);
  // },
  // methods: {
  //   handleScroll() {
  //     var scrollTop =
  //       window.pageYOffset ||
  //       document.documentElement.scrollTop ||
  //       document.body.scrollTop;
  //     var offsetTop = document.querySelector("#searchBar").offsetTop;

  //     if (scrollTop <= 200) {
  //       offsetTop = 300 - Number(scrollTop);

  //     } else {
  //     }
  //   }
  // },
  // destroyed() {
  //   //离开该页面需要移除这个监听的事件
  //   window.removeEventListener("scroll", this.handleScroll);
  // },
  components: {
    Navbar: Navbar,
    topStory: topStory,
    globalSidebar: globalSidebar
  }
};
</script>
