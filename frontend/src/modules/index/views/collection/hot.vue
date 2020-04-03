<template>
  <div class="column">
    <el-container>
      <el-header style="height:52px">
        <Navbar :active="'explore'"></Navbar>
      </el-header>
      <el-main class="App-main"></el-main>
      <div></div>
    </el-container>
  </div>
</template>
<script>
import Navbar from "@/components/global/Navbar";
export default {
  name: "column",
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
.column {
  .App-main {
    margin: 0;
    padding: 0;
    width: 100%;
    flex-direction: column;
  }
}
</style>
