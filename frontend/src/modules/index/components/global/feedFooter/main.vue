// AuthorInfo HoverCard
//profileHeader followshipCard lightList footerOperations
<template>
  <div class="feedFooter" :class="{'is-fixed':!isCollapse}">
    <span>
      <el-button
        @click="like"
        type="primary"
        icon="el-icon-thirdxiala-copy-copy"
        size="medium"
        class="VoteButton VoteButton-up"
        :class="{'is-active' : is_like}"
      >{{statusText+" "+(votes == 0?"":votes)}}</el-button>
      <!-- <el-button>
        <svg-icon class-name="" icon-class="">
        </svg-icon>
      </el-button>-->
      <el-button
        @click="down"
        type="primary"
        class="VoteButton VoteButton-down"
        :class="{'is-active' : is_down}"
        icon="el-icon-thirdxiala"
        size="medium"
      ></el-button>
    </span>
    <el-button
      class="ContentItem-action"
      icon="el-icon-thirdcomment"
      size="medium"
      @click="handlerComment"
    >{{(comments == 0?"":comments+"条")+"评论"}}</el-button>
    <comment-dialog :dialogCommentVisible="commentVisible" :aid="111" @listen="getCommentStatus"></comment-dialog>

    <el-dropdown placement="bottom" trigger="click">
      <el-button class="ContentItem-action" icon="el-icon-thirdfenxiang" size="medium">分享</el-button>
      <el-dropdown-menu slot="dropdown">
        <el-dropdown-item icon="el-icon-thirdlianjie1" @click="handlerEnjoy">分享链接</el-dropdown-item>
      </el-dropdown-menu>
    </el-dropdown>
    <el-button
      class="ContentItem-action"
      icon="el-icon-thirdshoucang1"
      size="small"
      @click="handlerCollect"
    >收藏</el-button>
    <favlists-dialog :dialogFavlistsVisible="collectVisible" @listen="getCollectStatus"></favlists-dialog>
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
    <el-button class="collapse-button" v-show="!isCollapse" @click="handleCollpase">收起</el-button>
  </div>
</template>
<script>
export default {
  name: "feedFooter",
  data() {
    return {
      votes: 10,
      statusText: "赞同",
      is_like: false,
      is_down: false,
      comments: 0,
      collectVisible: false,
      commentVisible: false
    };
  },
  methods: {
    handleCollpase() {
      this.isCollapse = true;
      console.warn("hhhsA");
      this.$emit("getCollpase", this.isCollapse);
    },
    handlerEnjoy() {
      console.log("xxxxx");

      this.$message({
        message: "成功复制链接",
        type: "success"
      });
    },
    like() {
      if (this.statusText == "赞同") {
        if (this.is_down == true) {
          this.down();
        }
        this.votes++;
        this.statusText = "已赞同";
        this.is_like = true;
      } else {
        this.votes--;
        this.statusText = "赞同";
        this.is_like = false;
      }
    },
    down() {
      if (this.statusText == "已赞同") {
        this.like();
      }
      this.is_down = !this.is_down;
    },
    handlerCollect() {
      this.collectVisible = true;
    },
    handlerComment() {
      this.commentVisible = true;
    },
    getCollectStatus(status) {
      this.collectVisible = status;
    },
    getCommentStatus(status) {
      this.commentVisible = status;
    }
  },
  mounted() {
    console.warn(this.isAns, this.isCollapse);
  },
  components: {},
  watch: {
    isCollapse: {
      handler: (newVal, oldVal) => {
        this.isCollapse = newVal;
      }
    }
  },
  props: {
    item: Object,
    isAns: Boolean,
    isCollapse: {
      type: Boolean,
      default: true
    }
  }
};
</script>
<style lang="scss" scoped>
.feedFooter {
  display: flex;
  align-items: center;
  padding: 10px 20px;
  // margin: 0 -20px -10px;
  clear: both;
  margin: 0 -20px;
  color: #646464;
  background: #fff;

  &.is-fixed {
    position: fixed;
    width: 692px;
    bottom: 0px;
    box-sizing: border-box;
    animation: slideInUp 0.2s;
  }

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
    color: #8590a6;

    &:hover {
      color: rgb(151, 161, 179);
    }
  }
  .collapse-button {
    font-size: 15px;
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
