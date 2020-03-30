<template>
  <el-card ref="answerCard" @scroll="handleScroll" class="AnswerCard">
    <div class="content">
      <div class="content-item">
        <div class="meta">
          <answer-authorInfo :author="authorInfo"></answer-authorInfo>
          <div class="answerItem-extraInfo">
            <span class="votes">
              <span>
                <el-popover placement="bottom" width="200" trigger="hover">
                  <author-popover></author-popover>
                  <el-link slot="reference" :underline="false">
                    {{
                    "换好几十块了的机会"
                    }}
                  </el-link>
                </el-popover>
              </span>
              等
              <el-button>
                {{ "4,053" }}
                人赞同了该回答
              </el-button>
            </span>
          </div>
        </div>
        <div class="RichContent" :class="{ 'is-collapsed': isCollapsed }">
          <div style class="inner" @click="isCollapsed && handleCollapse()">
            <article class="article-content" v-html="answer.content"></article>
          </div>
          <el-button v-show="isCollapsed" @click="handleCollapse" class="button-item">展开阅读全文</el-button>
          <div style="height:50px">
            <feed-footer
              ref="feedFooter"
              v-on:getCollpase="getStatus"
              :isAns="true"
              :isCollapse="isCollapsed"
              :show="show"
            ></feed-footer>
          </div>
        </div>
      </div>
    </div>
  </el-card>
</template>
<script>
import { debounce } from "#/utils/common.js";
export default {
  name: "AnswerCard",
  data() {
    return {
      authorInfo: this.answer.author,
      isCollapsed: true,
      text: `
      <h4><a id="_0"></a>数据库索引</h4> <ul> <li>数据库索引就是一个能加快海量数据查询的一项技术</li> </ul> <blockquote> <p>比如字典里面的目录</p> </blockquote> <ul> <li>联合索引(包含多个字段的索引)</li> </ul> <blockquote> <p>比如字典里面的先查部首再根据笔画来查</p> </blockquote> <ul> <li>最左前缀匹配</li> </ul> <blockquote> <p>对于一个联合索引，如果有一个SQL查询语句需要执行，则只有从索引最左边的第一个字段开始到SQL语句查询条件中不包含的字段（不含）或范围条件字段（含）为止的部分才会使用索引进行加速。</p> </blockquote> <ul> <li>聚集索引(数据会根据索引中的顺序进行排列和组织的),比如主键索引</li> </ul> <blockquote> <p>比如像拼音目录这样的索引</p> </blockquote> <ul> <li>数据库索引设计 <ol> <li><strong>整理查询条件</strong> <ul> <li>在where子句、join连接条件中使用的字段</li> </ul> </li> <li><strong>分析字段的可选择性</strong> <ul> <li>会把可选择性高的字段放到前面，可选择性低的字段放在后面,可选择性是指字段的值的区分度</li> </ul> </li> <li><strong>合并查询条件</strong> <ul> <li>最左匹配原则来合并查询条件，尽可能让不同的查询条件使用同一个索引</li> </ul> </li> <li><strong>考虑是否需要使用全覆盖索引</strong></li> </ol> </li> </ul>
      `,
      show: false
    };
  },
  methods: {
    getStatus() {
      this.isCollapsed = true;
    },
    handleCollapse() {
      this.isCollapsed = false;
    },
    handleScroll(e) {
      let el = this.$refs.answerCard.$el;
      let sc = document.documentElement.scrollTop;
      let wh = window.innerHeight;
      let ff = this.$refs.feedFooter.$el.offsetHeight;
      let x = el.offsetHeight;
      this.show =
        !this.isCollapsed && sc + wh >= el.offsetHeight + el.offsetTop;
    }
  },
  mounted() {
    this.isCollapsed = !(this.answer.id === this.$route.params.aid);
    window.addEventListener("scroll", this.handleScroll);
  },
  destroyed() {
    window.removeEventListener("scroll", this.handleScroll);
  },
  components: {},
  props: {
    answer: Object
  },
  created() {},
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
  .feedFooter {
    &.is-fixed {
      position: fixed;
      width: 692px;
      bottom: 0px;
      box-sizing: border-box;
      animation: slideInUp 0.2s;
    }
  }

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
    &.is-collapsed {
      transition: color 0.14s ease-out;
      position: relative;
      cursor: pointer;

      .inner {
        max-height: 400px;
        mask-image: linear-gradient(
          #1a1a1a calc(100% - 8rem),
          transparent calc(100% - 2.8rem)
        );
        mask-size: 100% 100%;
        transition: mask-size 0.22s cubic-bezier(0.95, 0.05, 0.795, 0.035),
          max-height 0.32s cubic-bezier(0.95, 0.05, 0.795, 0.035);
      }
    }

    .inner {
      margin-top: 9px;
      margin-bottom: -4;
      overflow: hidden;
    }
    .article-content {
      text-align: left;
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
