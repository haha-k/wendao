<template>
  <div class="commentFooter-container">
    <el-input v-model="comment" placeholder="写下你的评论..."></el-input>
    <el-button :disabled="comment===''">发布</el-button>
  </div>
</template>
<script>
export default {
  name: "commentFooter",
  data() {
    return {
      comment: ""
    };
  },
  components: {}
};
</script>

<style lang="scss" scoped>
.commentFooter-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding-right: 94px;
  padding: 12px 20px;
  background: #fff;
  border-top: 1px solid #ebebeb;

  .el-input {
    flex: 1 1;
  }
  .el-button {
    color: #fff;
    background-color: #0084ff;
  }

  .el-button.is-disabled {
    opacity: 0.5;

    &:hover {
      color: #fff;
      background-color: #0084ff;
      opacity: 0.5;
    }
  }
}
</style>
<style scoped>
.el-button {
}
</style>