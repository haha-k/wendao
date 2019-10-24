
<template>
  <el-card class="AnswerCard">
    <div class="content">
      <div class="content-item">
        <div class="meta">
          <answer-authorInfo :author="authorInfo"></answer-authorInfo>
          <div class="answerItem-extraInfo">
            <span class="votes">
              <span>
                <el-popover placement="bottom" width="200" trigger="hover">
                  <author-popover></author-popover>
                  <el-link slot="reference" :underline="false">{{"换好几十块了的机会"}}</el-link>
                </el-popover>
              </span>
              等
              <el-button>
                {{"4,053"}}
                人赞同了该回答
              </el-button>
            </span>
          </div>
        </div>
        <div class="RichContent">
          <div
            style="max-height:400px"
            class="inner"
            :class="{'is-collapsed':isCollapsed}"
          >{{"有幸一毕业就进了阿里。身边的同事确实都很厉害， 我是个非科班的Java工程师，本科学的是电信，后来跨考到985软件工程，自己学了两年Java，期间找了两次实习，一次在网易，一次在百度，秋招前复习了小半年，最后拿到了BAT等公司的offer，考虑到技术栈和成长速度的原因，最后选择去了阿里。 分享一下我的自学经历和秋招经历，顺便给大家带点干货。 听说送资料可以防喷子，不知道是不是真的。CC 大学时期的迷茫与坚定 我的本科专业是电子信息工程，基本没有接触过计算机专业的课程，只学过c语言，然后在大三的时候接触过java，Android，以及前端开发。这时候我只是一个刚刚入门的菜鸟，还不知道软件开发的水有多深，抱着试一试的态度去应聘了很多公司。结果可想而知，连简历筛选都没有通过。"}}</div>
          <el-button class="button-item">展开阅读全文</el-button>
          <div>
            <feed-footer :ans="true"></feed-footer>
          </div>
        </div>
      </div>
    </div>
  </el-card>
</template>
<script>
export default {
  name: "AnswerCard",
  data() {
    return {
      authorInfo: this.answer.author,
      isCollapsed: true
    };
  },
  methods: {},
  mounted() {
    console.log();
  },
  components: {},
  props: {
    answer: Object
  },
  watch: {
    answer: {
      handler(newVal, oldVal) {
        this.answer = newVal;
        this.authorInfo = this.answer.author;
      },
      deep: true
    }
  }
};
</script>
<style lang="scss" scoped>
.AnswerCard {
  overflow: initial;
  .content {
    .answerItem-extraInfo {
      margin-top: 10px;
      margin-bottom: -4px;
      font-size: 14px;
      color: #8590a6;

      .votes {
        color: #8590a6;
        font-weight: 600;
        display: flex;
        align-items: flex-end;

        .el-link {
          font-size: 14px;
          color: #8590a6;
          font-weight: 600;
        }

        .el-button {
          height: auto;
          padding: 0 !important;
          line-height: inherit;
          background-color: transparent;
          border: none;
          border-radius: 0;
          color: #8590a6;
          font-weight: 600;
          font-size: 14px;
        }
      }
    }
  }

  .RichContent {
    .inner {
      margin-top: 9px;
      margin-bottom: -4;
      overflow: hidden;

      .is-collapsed {
        transition: color 0.14s ease-out;
        position: relative;
      }
    }
    .button-item {
      // position: absolute;
      z-index: 1;
      // bottom: 75px;
      // left: 0;
      width: 100%;
      color: #175199;
      font-size: 15px;
      margin-left: auto;
      height: auto;
      padding: 0 !important;
      background-color: transparent;
      border: none;
      border-radius: 0;
    }
  }
}
</style>
<style scoped>
.AnswerCard >>> .el-card__body {
  padding: 16px 20px !important;
}
</style>
