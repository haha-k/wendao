<template>
  <li class="rootNoChild">
    <div class="CommentItemV2">
      <div>
        <div class="meta">
          <router-link :to="comment.url">
            <el-avatar shape="square" :src="comment.author.member.avatar_url" :size="24"></el-avatar>
          </router-link>
          <router-link :to="comment.author.member.url">{{comment.author.member.name}}</router-link>
          <span v-if="comment.author.role=='author'">(作者)</span>
          <template v-if="comment.reply_to_author!==undefined">
            <span style="margin:0 8px;">回复</span>
            <router-link
              :to="comment.reply_to_author.member.url"
            >{{comment.reply_to_author.member.name}}</router-link>
            <span v-show="comment.reply_to_author.role=='author'">(作者)</span>
          </template>
          <span class="time">{{time}}天前</span>
        </div>
        <div class="metaSibling">
          <div class="content">{{comment.content}}</div>
          <div class="footer">
            <el-button
              icon="el-icon-thirdzan"
              :class="{'comment.votes':voted}"
            >{{comment.vote_count?comment.vote_count:"赞"}}</el-button>
            <el-button icon="el-icon-thirdhuifu">回复</el-button>
            <el-button icon="el-icon-thirdfandui">踩</el-button>
            <el-button icon="el-icon-thirdjubao">举报</el-button>
          </div>
        </div>
      </div>
    </div>
  </li>
</template>
<script>
export default {
  name: "rootNoChild",
  data() {
    return {
      comment: this.item
    };
  },
  methods: {},
  mounted() {},
  components: {},
  props: {
    item: Object
  },
  computed: {
    time: function() {
      let date = new Date(this.comment.created_time);
      console.log(date);
      return date.getDate();
    }
  }
};
</script>
<style lang="scss" scoped>
.rootNoChild {
  .CommentItemV2 {
    outline: none;
    position: relative;
    flex-shrink: 0;
    padding: 12px 20px 10px;
    font-size: 15px;

    .meta {
      position: relative;
      height: 24px;
      padding-right: 3px;
      padding-left: 1px;
      margin-bottom: 4px;
      line-height: 24px;
      // display: flex;
      // justify-content: flex-start;
      // align-items: center;
      text-align: left;

      a:nth-child(1) {
        margin-right: 8px;
      }
      a:nth-child(2) {
        // vertical-align: center;
        align-items: center;
        color: #1a1a1a;
      }

      .el-avatar {
        width: 24px;
        height: 24px;
        margin: 0;
      }

      .time {
        float: right;
        font-size: 14px;
        color: #8590a6;
      }
    }

    .metaSibling {
      padding-left: 33px;
      .content {
        margin-bottom: 6px;
        line-height: 25;
        word-break: break-all;
        line-height: 1.6;
        text-align: left;
        font-weight: 500;
        color: #1a1a1a;
        // font-family: -apple-system,BlinkMacSystemFont;
      }

      .footer {
        display: flex;
        align-items: center;
        height: 24px;
        font-size: 14px;
        line-height: 24px;
        margin-top: 4px;

        &:hover {
          .el-button:not(:first-child) {
            opacity: 1;
          }
        }

        .el-button {
          font-size: 14px;
          color: #8590a6;
          text-align: center;
          border: none;
          padding: 0;
          background-color: transparent;

          + .el-button {
            margin-left: 20px;
            opacity: 0;
            transition: opacity 0.2s;
          }
        }
      }
    }
  }
}
</style>
<style lang="css" scoped>
</style>
