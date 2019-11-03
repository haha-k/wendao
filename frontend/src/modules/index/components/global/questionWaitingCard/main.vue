<template>
  <div class="questionWaitingCard">
    <router-link to="/" class="title">xx很谨慎的人xxxxxxx</router-link>
    <div class="detail">fsdfsdfsdfsd</div>
    <div class="tool">
      <div class="mainTool">
        <el-button icon="el-icon-thirdicon">写回答</el-button>
        <el-button icon="el-icon-thirdjia">关注问题</el-button>
        <el-button icon="el-icon-thirdlishi1">稍后答</el-button>
      </div>
      <div class="subTool">
        <div class="info">{{"121"}}个回答 · {{"334"}}个浏览</div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "questionWaitingCard",
  data() {
    return {};
  },
  methods: {},
  mounted() {},
  components: {}
};
</script>
<style lang="scss" scoped>
.questionWaitingCard {
  display: flex;
  flex-direction: column;
  padding: 17px 0 22px;
  position: relative;
  border-bottom: 1px solid #f6f6f6;
  text-align: left;
  .title {
    margin-right: 26px;
    color: #1a1a1a;
    font-size: 18px;
    line-height: 27px;
    margin-bottom: 8px;
    font-weight: 600;
  }
  .detail {
    min-height: 10px;
    font-size: 15px;
    line-height: 25px;
    font-weight: 500;
  }

  .tool {
    display: flex;
    align-items: center;
    margin-top: 17px;
    .mainTool {
      display: flex;
      align-items: center;

      .el-button:nth-child(1) {
        color: #0084ff;
        border-color: #0084ff;
        line-height: 28px;
        padding: 0;
        width: 94px;
      }
      .el-button + .el-button {
        height: 30px;
        margin-left: 20px;
        background-color: transparent;
        border: none;
        border-radius: 0;
        color: #8590a6;
        padding: 0;
      }
    }
    .subTool {
      margin-left: auto;
      display: flex;
      align-items: center;
      .info {
        color: #8590a6;
        font-size: 14px;
      }
    }
  }
}
</style>
