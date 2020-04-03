<template>
  <div class="AuthorInfo">
    <span class="UserLink">
      <el-popover placement="bottom" width="200" trigger="hover">
        <author-popover></author-popover>
        <router-link :to="`/member/${author.id}`" slot="reference">
          <el-avatar shape="square" :size="size" :src="author.avatar_url || avatarUrl"></el-avatar>
        </router-link>
      </el-popover>
    </span>
    <div class="content">
      <div class="head">
        <el-popover placement="bottom" width="200" trigger="hover">
          <author-popover></author-popover>
          <el-link slot="reference" :underline="false">{{author.name}}</el-link>
        </el-popover>
      </div>
      <div class="detail">
        <div class="headline">
          <div class="text">{{author.headline}}</div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "AuthorInfo",
  data() {
    return {
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
    author: Object,
    size: Number
  },
  watch: {
    author: {
      handler(newVal, oldVal) {
        this.author = newVal;
      },
      deep: true
    }
  }
};
</script>
<style lang="scss" scoped>
.AuthorInfo {
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
      font-weight: 500;
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
