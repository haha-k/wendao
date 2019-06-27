<template>
  <div class="home">
    <el-container>
      <el-header>
        <Header></Header>
      </el-header>

      <el-main>
        <Search>
          <!-- ssssss -->
          <!-- <div slot="append">hhhhhhhhh</div> -->
          <!-- <slot name="item">sss</slot> -->
        </Search>
        <recommendedContent></recommendedContent>
        <!-- <el-backtop :visibility-height="70" :bottom="100" :right="0">
          <div
            style="
      {
      height: 40px;
      width: 40px;
      background-color: #f2f5f6;
      box-shadow: 0 0 6px rgba(0, 0, 0, 0.12);
      text-align: center;
      line-height: 40px;
      color: #1989fa;
      }
          "
          >UP</div>
        </el-backtop> -->
      </el-main>
    </el-container>
    <!-- <img alt="Vue logo" src="../../assets/logo.png" /> -->
  </div>
</template>


<style lang="scss" scoped>
$smargin: 10px;
$spadding: 10px;

.el-header {
  color: #333;
  line-height: 60px;
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
import recommendedContent from "@/components/recommendedContent";
export default {
  name: "home",

  components: {
    Header: Header,
    Search: Search,
    recommendedContent: recommendedContent
  }
};
</script>
