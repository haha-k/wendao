<template>
  <div class="home">
    <el-container>
      <el-header style="height:52px">
        <Navbar></Navbar>
      </el-header>
      <el-main>
          <topStory></topStory>
          <globalSidebar></globalSidebar>
      </el-main>
      <div>
</div>
    </el-container>
    <!-- <img alt="Vue logo" src="../../assets/logo.png" /> -->
  </div>
</template>


<style lang="scss" scoped>
$smargin: 10px;
$spadding: 10px;
@import '@/styles/variables.scss';

.el-header {
  // line-height: $navbarHeight;
  // height: $navbarHeight;
  box-shadow:0 1px 3px rgba(26,26,26,.1);
  z-index: 100;
  // min-width: $screenWidth;
  min-width: 100%;
  background-color: #fff;
  // background-clip: content-box;
}

.el-main {
  margin: 0px;
  padding: $spadding;
  // background-color: #B3C0D1;
  color: #333;
  .el-backtop {
    div {
      height: 40px;
      width: 40px;
      background-color: #f2f5f6;
      box-shadow: 0 0 6px rgba(0, 0, 0, 0.12);
      text-align: center;
      line-height: 40px;
      color: #1989fa;
    }
  }
}
</style>

<script>
// @ is an alias to /src
import Header from "@/components/global/Header";
import Search from "@/components/Search";
import Navbar from "@/components/global/Navbar";
import globalSidebar from "@/components/global/globalSidebar";
import topStory from "@/components/global/topStory";
import recommendedContent from "@/components/recommendedContent";

export default {
  name: "home",

  components: {
    Header: Header,
    Search: Search,
    recommendedContent: recommendedContent,
    Navbar:Navbar,
    topStory:topStory,
    globalSidebar:globalSidebar,
  }
};
</script>
