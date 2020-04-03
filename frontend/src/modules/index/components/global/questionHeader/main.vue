<template>
  <div class="questionHeader-container">
    <div class="question-status"></div>
    <div class="question-header">
      <div class="content">
        <div class="main">
          <div class="tags">
            <div class="topics">
              <el-tag v-for="i in q.topics" :key="i">
                <router-link :to="'/topic/'+i.id">{{ i.name }}</router-link>
              </el-tag>
            </div>
          </div>
          <h1 class="title">{{ q.title }}</h1>
          <div class="detail">
            <div class="text" :class="{ Collpsed: isCollpsed }">
              <div>
                <p>{{ q.detail }}</p>
              </div>
            </div>
          </div>
        </div>
        <div class="side">
          <div class="follow-status">
            <div class="numberBoard">
              <el-button class="numberBoard-item">
                <div class="itemInner">
                  <div class="itemName">关注者</div>
                  <strong class="itemValue">{{ q.follower_count }}</strong>
                </div>
              </el-button>
              <div class="numberBoard-item">
                <div class="itemInner">
                  <div class="itemName">被浏览</div>
                  <strong class="itemValue">1,111,111</strong>
                </div>
              </div>
            </div>
            <el-button class="people">
              <span class="people-tip">vczh 也关注了该问题</span>
              <!-- <span class="UserLink"> -->
              <!-- <el-avatar shape="square" :size="small" :src="squareUrl"></el-avatar> -->
              <!-- </span> -->
            </el-button>
          </div>
        </div>
      </div>
      <div class="footer">
        <div class="footer-inner">
          <div class="main footer-main">
            <div class="button-group">
              <el-button
                class="follow-button"
                @click="handlerFollow"
                :class="{ 'is-active': followStatus }"
              >{{ followStatus == true ? "已关注" : "关注问题" }}</el-button>
              <el-button icon="el-icon-thirdxie1" @click="handlerWrite">写回答</el-button>
            </div>
            <div class="actions">
              <el-button icon="el-icon-thirdyaoqinghaoyou" class="invite-button">邀请回答</el-button>
              <div class="comment">
                <el-button class="ContentItem-action" icon="el-icon-thirdcomment" size="medium">
                  {{
                  (commentCount == 0 ? "" : commentCount + "条") + "评论"
                  }}
                </el-button>
              </div>
              <el-dropdown placement="bottom" trigger="click">
                <el-button class="ContentItem-action" icon="el-icon-thirdfenxiang" size="medium">分享</el-button>
                <el-dropdown-menu slot="dropdown">
                  <el-dropdown-item icon="el-icon-thirdlianjie1">分享链接</el-dropdown-item>
                </el-dropdown-menu>
              </el-dropdown>
              <el-button
                class="ContentItem-action report-button"
                icon="el-icon-s-flag"
                v-if="!isAns"
                size="medium"
              >举报</el-button>
              <el-dropdown placement="bottom" trigger="click">
                <el-button class="ContentItem-action" icon="el-icon-thirdellipsis"></el-button>
                <el-dropdown-menu slot="dropdown">
                  <el-dropdown-item v-if="!isAuthor">使用匿名身份</el-dropdown-item>
                  <el-dropdown-item v-if="!isAuthor">查看问题日志</el-dropdown-item>
                </el-dropdown-menu>
              </el-dropdown>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  name: "questionHeader",
  data() {
    return {
      isAuthor: false,
      q: this.question,
      commentCount: 0,
      squareUrl:
        "https://cube.elemecdn.com/9/c2/f0ee8a3c7c9638a54940382568c9dpng.png",
      followStatus: false
    };
  },
  methods: {
    handlerFollow() {
      this.followStatus = !this.followStatus;
    },
    handlerWrite() {
      this.$router.push("/write");
    }
  },
  mounted() {},
  watch: {
    question: {
      deep: true,
      handler(newVal, oldVal) {
        this.q = newVal;
        this.commentCount = newVal.comment_count;
      }
    }
  },
  components: {},
  props: {
    question: Object
  }
};
</script>
<style lang="scss" scoped>
.questionHeader-container {
  .question-status {
  }
  .question-header {
    background: #fff;
    overflow: hidden;
    min-width: 1032px;
    padding: 16px 0;
    box-shadow: 0 1px 3px rgba(26, 26, 26, 0.1);
    .content {
      display: flex;
      justify-content: space-between;
      width: 1000px;
      height: 100%;
      padding: 0 16px;
      margin: 0 auto;
      .main {
        width: 694px;
        padding-left: 20px;
        box-sizing: border-box;
        .tags {
          display: flex;
          .topics {
            display: flex;
            flex-direction: row;
            flex-wrap: wrap;
            align-items: center;
            padding: 1px 0;
            .el-tag {
              height: 30px;
              padding: 0 12px;
              font-size: 14px;
              line-height: 30px;
              margin: 3px 5px 3px 0;
              vertical-align: middle;
              background: rgba(0, 132, 255, 0.1);
              color: #0084ff;
              border-radius: 100px;
              font-weight: 600;
            }
          }
        }
        .title {
          margin-top: 12px;
          margin-bottom: 4px;
          font-size: 22px;
          font-weight: 600;
          line-height: 32px;
          color: #1a1a1a;
          text-align: left;
        }

        .detail {
          min-height: 10px;

          .text {
            font-size: 15px;
            line-height: 25px;
            word-break: break-word;
            line-height: 1.6;
            text-align: left;
            font-weight: 550;
          }
        }
      }
      .side {
        width: 296px;
        padding-right: 20px;
        text-align: right;

        .numberBoard {
          display: flex;
          margin-left: auto;
          width: 200px;

          .itemInner {
            text-align: center;
            line-height: 1.6;
          }

          .numberBoard-item {
            flex: 1 1;

            &:nth-child(2) {
              border-left: 1px solid #f0f2f7;
            }
            .itemInner {
              padding: 0 8px;
            }

            .itemName {
              font-size: 14px;
              color: #8590a6;
              font-weight: 600;
            }

            .itemValue {
              display: inline-block;
              font-size: 18px;
              color: #1a1a1a;
              font-weight: 700;
            }
          }

          .el-button {
            border: 0;
            line-height: unset;
            font-size: unset;
            background-color: none;

            &:hover {
              color: rgb(23, 81, 153);
            }
          }
        }

        .people {
          margin-top: 10px;
          height: 32px;
          border: none;
          border-radius: 0;

          .people-tip {
            margin-right: 8px;
            font-size: 14px;
            color: #8590a6;
            vertical-align: middle;
            font-weight: 600;
          }
        }
      }
    }

    .footer {
      // margin-top: 4px;
      // min-width: 694px;
      // width: auto;
      padding-bottom: 12px;
      margin-top: 4px;
      margin-bottom: -12px;
      background: #fff;

      .footer-inner,
      .footer-main {
        display: flex;
        align-items: center;
      }

      .footer-inner {
        justify-content: space-between;
        width: 1000px;
        padding: 0 16px;
        margin: 0 auto;
      }

      .main {
        padding-left: 20px;
        box-sizing: border-box;
      }

      .footer-main {
        margin-top: 4px;
        min-width: 694px;
        width: auto;

        .button-group {
          display: inline-block;
          margin: 0 -8px;

          .el-button {
            margin: 0 8px;
            padding: 0 16px !important;
            font-size: 14px;
            border: 1px solid;
            border-radius: 3px;
            background: none;
            line-height: 32px;

            &:nth-child(2) {
              color: #0084ff;
              border-color: #0084ff;
              font-weight: 600;
              &:hover {
                background-color: rgba(0, 132, 255, 0.06);
              }
            }
          }
          .follow-button {
            min-width: 96px;
            color: #fff;
            background-color: #0084ff;
            font-weight: 600;

            &:hover {
              border-color: #0077e6;
              background-color: #0077e6;
            }

            &.is-active {
              color: #fff;
              background-color: #8590a6;
            }
          }
        }
        .actions {
          margin-left: 16px;
          display: flex;
          align-items: center;

          .invite-button {
            color: #8590a6;
            border-color: #8590a6;
            padding: 0 16px !important;
            font-size: 14px;
            border: 1px solid;
            border-radius: 3px;
            background: none;
            line-height: 32px;
            margin-right: 16px;
            font-weight: 600;

            &:hover {
              background-color: rgba(133, 144, 166, 0.06);
            }
          }

          .comment {
            .el-button {
              border: none;
              line-height: inherit;
              height: auto;
              border-radius: 0;
              background-color: transparent;
              color: #8590a6;
              font-weight: 600;
            }
          }

          .ContentItem-action {
            height: auto;
            padding: 0;
            line-height: inherit;
            background-color: transparent;
            border: none;
            border-radius: 0;
            color: #8590a6;
            font-weight: 600;
          }

          .el-dropdown,
          .report-button {
            margin-left: 20px;
            font-weight: 600;
          }
        }
      }
    }
  }
}
</style>
<style scoped>
.el-button--medium {
  padding: 0 !important;
  background: none;
}
.el-button--medium:hover {
  color: rgb(23, 81, 153);
}
.button-group .el-button {
  /* padding: 0 16px !important; */
}
</style>
