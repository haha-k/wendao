
<template>
  <div class="qfooter">
    <el-button
      @click="like"
      type="primary"
      icon="el-icon-caret-top"
      size="medium"
      :class="btnClass"
    >{{text+" "+likeCount}}</el-button>
    <el-button type="primary" icon="el-icon-caret-bottom" size="medium"></el-button>
    <el-button icon="el-icon-s-comment" size="medium">{{commentCount+"条评论"}}</el-button>
    <el-button icon="el-icon-s-promotion" size="medium">分享</el-button>
    <el-button icon="el-icon-star-off" size="medium">收藏</el-button>
  </div>
</template>
<script>
export default {
  name: "qfooter",
  data() {
    return {
      btnClass:"classA",
      status: 0,
      commentCount: 0,
      likeCount: 0,
      text:"赞同"
    };
  },
  props: ["data"],
  methods: {
    like: function() {
      if (this.status == 1) {
        this.likeCount -= 1;
        this.status = 0;
        this.btnClass="classA"
        this.text = "赞同"
      } else{
        this.likeCount += 1;
        this.status = 1;
        this.btnClass="classB"
        this.text = "已赞同"
      }
    }
  },
  mounted() {
    this.commentCount = this.data["aComment"];
    this.likeCount = this.data["like_count"];
    console.log(this.data);
  },
  components: {}
};
</script>
<style lang="scss" scoped>
.qfooter {
  .classA{
      background-color: rgb(229, 242, 255);
      color: rgb(0, 132, 255);
      font-weight: 600;
  }
  .classB{
      background-color: rgb(0, 132, 255);
      color: rgb(255, 255, 255);
      font-weight: 600;
  }
  // .el-button {
  //   // &:nth-child(1), &:nth-child(2) {
  //   //   background-color: rgb(229, 242, 255);
  //   //   color: rgb(0, 132, 255);
  //   //   font-weight: 600;
  //   // }
  // }
}
</style>
