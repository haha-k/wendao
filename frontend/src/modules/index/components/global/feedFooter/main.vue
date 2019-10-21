// AuthorInfo HoverCard

//profileHeader followshipCard lightList footerOperations
<template>
  <div class="feedFooter">
    <span>
      <el-button
        @click="like"
        type="primary"
        icon="el-icon-caret-top"
        size="medium"
        :class="btnClass"
      >{{text+" "+likeCount}}</el-button>
      <el-button>
        <svg-icon class-name="">

        </svg-icon>
      </el-button>

    </span>
      <el-button type="primary" icon="el-icon-caret-bottom" size="medium"></el-button>
      <el-button icon="el-icon-s-comment" size="medium">{{commentCount+"条评论"}}</el-button>
      <el-button icon="el-icon-s-promotion" size="medium">分享</el-button>
      <el-button icon="el-icon-star-off" size="medium">收藏</el-button>
  </div>
</template>
<script>
export default {
  name: "feedFooter",
  data() {
    return {};
  },
  methods: {},
  mounted() {},
  components: {}
};
</script>
<style lang="scss" scoped>
.feedFooter {
}
</style>
