<template>
  <div class="laterCard">
    <div class="item">
      <div class="title">{{"动漫给你的感觉是什么？"}}</div>

      <div class="tool">
        <div class="mainTool">
          <el-button @click="handlerWrite">写回答</el-button>
          <el-button>移除</el-button>
          <div class="info">{{"100个回答 · 3334个浏览"}}</div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "laterCard",
  data() {
    return {};
  },
  methods: {
    handlerWrite() {
      this.$router.push("/write");
    }
  },
  mounted() {},
  components: {}
};
</script>
<style lang="scss" scoped>
.laterCard {
  padding: 0 20px;
  .item {
    border-bottom: 1px solid #f6f6f6;
    display: flex;
    flex-direction: column;
    padding: 17px 0 22px;
    position: relative;
    text-align: left;
    .title {
      color: #1a1a1a;
      font-size: 18px;
      font-weight: 600;
      line-height: 27px;
    }
    .tool {
      display: flex;
      align-items: center;
      margin-top: 17px;
      .mainTool {
        display: flex;
        align-items: center;

        .info {
        }
      }
    }
  }
}
</style>
