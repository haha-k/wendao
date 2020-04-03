<template>
  <header class="Card" style>
    <div class="authorInfo--plain">
      <author-info :author="authorInfo" :size="24"></author-info>
    </div>
    <h1 class="detailHeader--title">{{`${favlist.title}`}}</h1>
    <h4 class="detailHeader--hint">{{`创建于 ${createdTime} • ${favlist.follower_count} 人关注`}}</h4>
    <div class="detailHeader--actions">
      <el-button type="primary" @click="handleFocus">关注收藏</el-button>
      <el-button
        type="text"
        @click="handleComment"
        icon="el-icon-thirdcomment"
      >{{`${favlist.comment_count}条评论`}}</el-button>
      <el-button type="text" @click="handleReport" icon="el-icon-s-flag">举报</el-button>
    </div>
  </header>
</template>
<script>
import { FormatterDate } from "#/utils/common";
export default {
  name: "CollectionHeader",
  data() {
    return {};
  },
  computed: {
    createdTime() {
      return FormatterDate(this.favlist.created);
    }
  },
  watch: {},
  methods: {
    handleFocus() {
      //TODO 处理关注
    },
    handleComment() {
      //TODO 处理评论
    },
    handleReport() {
      //TODO 处理举报
    }
  },
  mounted() {},
  beforeDestroyed() {},
  created() {},
  props: ["authorInfo", "favlist"]
};
</script>

<style lang="scss" scoped>
header {
  text-align: left;
  padding: 20px 24px 20px;
  .authorInfo--plain {
  }

  .detailHeader--title {
    font-size: 22px;
    margin-top: 12px;
    margin-bottom: 0;
    font-weight: 400;
  }
  .detailHeader--hint {
    font-size: 14px;
    margin-top: 16px;
    margin-bottom: 0;
    color: #999;
    font-weight: 400;
  }
  .detailHeader--actions {
    margin-top: 16px;
    display: flex;
    .el-button + .el-button {
      margin-left: 26px;
      color: #8590a6;
    }
  }
}
</style>