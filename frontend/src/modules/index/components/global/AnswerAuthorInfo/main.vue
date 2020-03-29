<template>
  <div class="AnswerAuthorInfo">
    <span class="UserLink">
      <el-popover placement="bottom" width="200" trigger="hover">
        <author-popover></author-popover>
        <router-link :to="authorUrl" slot="reference">
          <el-avatar v-if="avatarUrl" shape="square" :size="38" :src="avatarUrl"></el-avatar>
          <el-avatar v-else shape="square" :size="38" :src="squareUrl"></el-avatar>
        </router-link>
      </el-popover>
    </span>
    <div class="content">
      <div class="head">
        <el-popover placement="bottom" width="200" trigger="hover">
          <author-popover></author-popover>
          <el-link slot="reference" :underline="false">{{Info.name}}</el-link>
        </el-popover>
      </div>
      <div class="detail">
        <div class="headline">
          <div class="text">{{Info.headline}}</div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "AnswerAuthorInfo",
  data() {
    return {
      Info: this.author,
      name: "",
      headline: "",
      authorUrl: "/",
      avatarUrl:
        "https://cube.elemecdn.com/0/88/03b0d39583f48206768a7534e55bcpng.png",
      squareUrl:
        "https://cube.elemecdn.com/9/c2/f0ee8a3c7c9638a54940382568c9dpng.png"
    };
  },
  methods: {},
  mounted() {},
  components: {},
  props: {
    author: Object
  },
  watch: {
    author: {
      handler(newVal, oldVal) {
        this.Info = newVal;
        this.name = this.Info.name;
        this.headline = this.Info.headline;
        console.log(this.name);
      },
      deep: true
    }
  }
};
</script>
<style lang="scss" scoped>
.AnswerAuthorInfo {
  margin-top: 0;
  display: flex;
  align-items: center;

  .content {
    flex: 1 1;
    margin-left: 14px;
    overflow: hidden;
    font-weight: 600;

    .head {
      display: flex;
      align-items: center;
      font-size: 15px;
      line-height: 1.1;
      flex-shrink: 0;

      .el-link {
        font-weight: 600;
      }
    }

    .detail {
      overflow: hidden;
      .headline {
        display: flex;
        align-items: center;
        margin-top: 2px;
        font-size: 14px;
        .text {
          overflow: hidden;
          text-overflow: ellipsis;
          white-space: nowrap;
          color: #646464;
        }
      }
    }
  }
}
</style>
