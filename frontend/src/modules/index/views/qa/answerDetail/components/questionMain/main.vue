<template>
  <div class="questionMain-container">
    <div class="ListShortcut">
      <div class="question-mainColumn">
        <template v-if="!isAll">
          <view-all-card :answerCount="answerCount"></view-all-card>
          <answer-card :answer="answer"></answer-card>
          <el-card :body-style="{ padding: '0px' }" class="moreAnswersCard">
            <div slot="header">
              <span>更多回答</span>
            </div>
            <answer-card :answer="otherAnswer[0]"></answer-card>
            <answer-card :answer="otherAnswer[1]"></answer-card>
          </el-card>
          <view-all-card :answerCount="answerCount"></view-all-card>
        </template>
        <template v-else>
          <!-- <el-card :body-style="{ padding: '0px' }" class="">
          <div slot="header">
          </div>-->
          <answer-card v-for="item in answers" :key="item.id" :answer="item"></answer-card>
          <!-- </el-card> -->
        </template>
      </div>
    </div>
    <div class="side-column" :class="{'is-fixed':isFixed}" ref="side">
      <div class="Sticky">
        <author-card v-if="!isAll" :uid="author.id" :name="author.name"></author-card>
        <answer-favlisat-card></answer-favlisat-card>
        <related-question-card></related-question-card>
      </div>
    </div>
  </div>
</template>
<script>
import { getAnswers } from "#/api/answer";
export default {
  name: "questionMain",
  data() {
    return {
      answerCount: this.ac,
      answer: {},
      loadding: false,
      otherAnswer: [],
      author: {},
      answers: []
    };
  },
  methods: {
    getAllAnswer(qid) {
      getAnswers()
        .then(result => {
          this.answers = result.data.data;
        })
        .catch(err => {});
    }
  },
  mounted() {
    if (this.isAll) {
      this.getAllAnswer(this.qid);
    }
    console.warn(this.isFixed);
  },
  destroyed() {},
  components: {},
  props: {
    ac: {
      type: Number,
      require: false
    },
    mainAnswer: Object,
    otherAnswer: Array,
    isFixed: {
      type: Boolean,
      default: false
    },
    isAll: Boolean,
    qid: String
  },
  watch: {
    ac: {
      handler(newVal, oldVal) {
        this.answerCount = newVal;
      },
      deep: true,
      immediate: true
    },
    mainAnswer: {
      handler(newVal, oldVal) {
        this.answer = newVal;
        this.author = this.answer.author;
      },
      deep: true,
      immediate: true
    },
    otherAnswer: {
      handler(newVal, oldVal) {
        this.otherAnswer = newVal;
      },
      deep: true,
      immediate: true
    },
    isFixed: {
      handler(newVal, oldVal) {
        this.isFixed = newVal;
      }
    }
  }
};
</script>
<style lang="scss" scoped>
.questionMain-container {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  margin: 10px auto;
  padding: 0 16px;
  width: 1000px;
  min-height: 100vh;

  .question-mainColumn {
    width: 694px;
    padding-bottom: 20px;
  }

  .side-column {
    width: 296px;
    margin-left: 10px;

    &.is-fixed {
      position: fixed;
      top: 62px;
      //TODO-完善点
      right: 436px;
      // transform: translateX(704px);
    }
  }

  .moreAnswersCard {
    margin-top: 10px;
  }
}
</style>
