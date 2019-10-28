<template>
  <div class="CommentDialog-container">
    <el-dialog
      :visible.sync="dialogCommentVisible"
      :before-close="handleClose"
      :modal-append-to-body="false"
      width="688"
      top="12vh"
      custom-class="CommentDialog"
    >
      <div class="CommentV2">
        <div class="topbar">
          <div class="topbar-title">
            <h2 class="title">{{commentCount}}条评论</h2>
          </div>
          <el-button icon="el-icon-thirdqiehuan2" v-if="is_defaultSort">切换为默认排序</el-button>
          <el-button icon="el-icon-thirdqiehuan2" v-else>切换为时间排序</el-button>
          <div class="topbar-option"></div>
        </div>
        <div class="CommentItemV2" v-if="is_defaultSort">
          <ul class="NestComment" v-for="i in commentsList" :key="i.id">
            <root-no-child :item="i"></root-no-child>
          </ul>
        </div>
      </div>
    </el-dialog>
  </div>
</template>
<script>
import rootNoChild from "./components/rootNoChild";
import { getAnswerComments } from "#/api/comments";
export default {
  name: "CommentDialog",
  data() {
    return {
      dialogclose: false,
      commentCount: 0,
      sortStatus: true,
      is_defaultSort: true,
      commentsList: []
    };
  },
  methods: {
    handleClose(done) {
      this.dialogclose = false;
      this.$emit("listen", this.dialogclose);
      done();
    },
    getComments(aid) {
      getAnswerComments(aid)
        .then(result => {
          let { data } = result.data;
          this.commentsList = data;
          console.log(this.commentsList);
        })
        .catch(err => {});
    }
  },
  mounted() {
    this.getComments(this.aid);
  },
  components: {
    rootNoChild: rootNoChild
  },
  props: {
    dialogCommentVisible: Boolean,
    aid: String
  }
};
</script>
<style lang="scss" scoped>
ul {
  padding: 0;
  margin: 0;
  li {
    list-style-type: none;
    display: list-item;
  }
}
.CommentDialog-container {
  height: 100%;
  .el-dialog.CommentDialog {
    .CommentV2 {
      display: flex;
      flex-direction: column;
      height: 100%;
      overflow: hidden;

      .topbar {
        // position: fixed;
        // z-index: 203;
        display: flex;
        justify-content: space-between;
        border-bottom: 1px solid #f6f6f6;
        background: #fff;
        align-items: center;
        height: 50px;
        padding: 0 20px;
        text-align: left;
        .topbar-title {
          flex: 1 1;
          .title {
            display: inline-block;
            font-size: 15px;
            font-weight: 600;
            color: #1a1a1a;
            margin: 0;
          }
        }
        .topbar-option {
          display: block;
          .el-button {
          }
        }
      }

      .CommentItemV2 {
        flex: 1 1;
        overflow-x: hidden;
        overflow-y: auto;

        .NestComment {
          position: relative;
        }
      }
    }
  }
}
</style>
<style lang="css" scoped>
.CommentDialog-container >>> .el-dialog__header {
  padding: 0 !important;
  position: fixed;
}
.CommentDialog-container >>> .el-dialog__body {
  padding: 0 !important;
}
</style>
