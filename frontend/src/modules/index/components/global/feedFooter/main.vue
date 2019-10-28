// AuthorInfo HoverCard

//profileHeader followshipCard lightList footerOperations
<template>
  <div class="feedFooter">
    <span>
      <el-button
        @click="like"
        type="primary"
        icon="el-icon-thirdxiala-copy-copy"
        size="medium"
        class="VoteButton VoteButton-up"
      >{{statusText+" "+(votes == 0?"":votes)}}</el-button>
      <!-- <el-button>
        <svg-icon class-name="" icon-class="">
        </svg-icon>
      </el-button>-->
      <el-button
        type="primary"
        class="VoteButton VoteButton-down"
        icon="el-icon-thirdxiala"
        size="medium"
      ></el-button>
    </span>
    <el-button
      class="ContentItem-action"
      icon="el-icon-thirdcomment"
      size="medium"
    >{{(comments == 0?"":comments+"条")+"评论"}}</el-button>

    <el-dropdown placement="bottom" trigger="click">
      <el-button class="ContentItem-action" icon="el-icon-thirdfenxiang" size="medium">分享</el-button>
      <el-dropdown-menu slot="dropdown">
        <el-dropdown-item icon="el-icon-thirdlianjie1">分享链接</el-dropdown-item>
      </el-dropdown-menu>
    </el-dropdown>
    <el-button
      class="ContentItem-action"
      icon="el-icon-thirdshoucang1"
      size="small"
      @click="visible=true"
    >收藏</el-button>
    <favlists-dialog :dialogFavlistsVisible="visible" @listen="getStatus"></favlists-dialog>
    <el-button v-if="isAns" class="ContentItem-action" icon="el-icon-thirdshoucang">感谢</el-button>
    <el-button class="ContentItem-action" icon="el-icon-s-flag" v-if="!isAns" size="medium">举报</el-button>
    <el-dropdown placement="bottom" trigger="click">
      <el-button class="ContentItem-action" icon="el-icon-thirdellipsis"></el-button>
      <el-dropdown-menu slot="dropdown">
        <el-dropdown-item v-if="isAns">没有帮助</el-dropdown-item>
        <el-dropdown-item v-if="isAns">举报</el-dropdown-item>
        <el-dropdown-item>不感兴趣</el-dropdown-item>
      </el-dropdown-menu>
    </el-dropdown>
  </div>
</template>
<script>
export default {
  name: "feedFooter",
  data() {
    return {
      votes: 0,
      statusText: "赞同",
      comments: 0,
      visible: false,
    };
  },
  methods: {
    like() {},
    getStatus(status) {
      this.visible = status;
    }
  },
  mounted() {},
  components: {},
  props: {
    item: Object,
    isAns: Boolean
  }
};
</script>
<style lang="scss" scoped>
.feedFooter {
  display: flex;
  align-items: center;
  padding: 10px 20px;
  margin: 0 -20px -10px;
  clear: both;
  color: #646464;
  background: #fff;

  span .el-button {
    line-height: 30px;
    padding: 0 12px;
  }

  .ContentItem-action {
    margin-left: 24px;
    font-size: 14px;
    color: #8590a6;
  }

  .el-button {
    border: none;
    font-weight: 600;
    font-size: 14px;
    padding: 0;
    background-color: transparent;

    &:hover {
      color: rgb(151, 161, 179);
    }
  }

  span {
    .VoteButton {
      color: #0084ff;
      background: rgba(0, 132, 255, 0.1);
      border-color: transparent;

      &:hover {
        background-color: rgba(0, 132, 255, 0.15);
      }

      &.is-active:hover {
        background-color: #0084ff;
      }

      &.is-active {
        color: #fff;
        background: #0084ff;
      }
    }
  }
}
</style>
<style scoped>
.el-button {
  padding: 0;
  font-size: 14px;
}
.el-dropdown-menu__item {
  color: #8590a6;
  line-height: 40px !important;
}

.el-dropdown-menu__item:hover {
  background: #f6f6f6 !important;
  color: #768396 !important;
}
</style>
