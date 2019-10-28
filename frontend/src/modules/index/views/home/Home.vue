<template>
  <div class="home">
    <el-container>
      <el-header style="height:52px">
        <Navbar></Navbar>
      </el-header>
      <el-main class="Topstory-container">
        <topStory></topStory>
        <globalSidebar></globalSidebar>
      </el-main>
      <div></div>
    </el-container>
    <!-- <img alt="Vue logo" src="../../assets/logo.png" /> -->

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

  components: {
    Navbar: Navbar,
    topStory: topStory,
    globalSidebar: globalSidebar
  }
};
</script>
